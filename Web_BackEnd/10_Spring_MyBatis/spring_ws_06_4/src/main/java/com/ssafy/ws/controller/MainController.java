package com.ssafy.ws.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.ws.model.dto.Restaurant;
import com.ssafy.ws.model.dto.Review;
import com.ssafy.ws.model.service.RestaurantService;
import com.ssafy.ws.model.service.ReviewService;

@Controller
public class MainController {

	@Autowired
	RestaurantService restaurantService;
	@Autowired
	ReviewService reviewService;

	@GetMapping({ "/", "/index" })
	public String index() {
		return "index";
	}

	@GetMapping("/res/list")
	public String getRestaurantList(Model model) {
		List<Restaurant> resList = restaurantService.getResList();
		model.addAttribute("resList", resList);

		return "/res/resList";
	}

	@GetMapping("/res/regist")
	public String getRestaurantRegist() {
		return "/res/resRegist";
	}

	@PostMapping("/res/regist")
	public String postRestaurantRegist(@ModelAttribute Restaurant restaurant, Model model) {

		restaurantService.insert(restaurant);
//		List<Review> reviews = reviewService.getReview(restaurant.getResId());
//		model.addAttribute("restaurant", restaurant);
//		model.addAttribute("reviews",reviews);
		return "redirect:detail?resId=" + restaurant.getResId();
	}

	@GetMapping("/res/detail")
	public String getRestaurantDetail(@RequestParam int resId, Model model) {

		Restaurant restaurant = restaurantService.getRes(resId);
		model.addAttribute("restaurant", restaurant);
		List<Review> reviews = reviewService.getReview(resId);
		model.addAttribute("reviews", reviews);

		return "/res/resDetail";
	}

	@GetMapping("/res/delete")
	public String PostDelteRestaurant(@RequestParam int resId) {
		List<Review> reviews = reviewService.getReview(resId);
		if (reviews != null) {
			for (int i = 0; i < reviews.size(); i++) {
				reviewService.removeReview(resId,i);
			}
		}
		restaurantService.removeRestaurant(resId);

		return "redirect:/res/list";
	}

	@GetMapping("/res/update")
	public String getRestaurantUpdate(@RequestParam int resId, Model model) {

		Restaurant res = restaurantService.getRes(resId);

		model.addAttribute("restaurant", res);

		return "/res/resUpdate";
	}

	@PostMapping("/res/update")
	public String postRestaurantUpdate(@ModelAttribute Restaurant restaurant, Model model) {

		restaurantService.modify(restaurant);
		model.addAttribute("restaurant", restaurant);

		List<Review> reviews = reviewService.getReview(restaurant.getResId());
		model.addAttribute("reviews", reviews);

		return "redirect:/res/detail?resId=" + restaurant.getResId();
	}

	@PostMapping("/review/regist")
	public String postReviewRegist(@ModelAttribute Review rev, @RequestParam int resId, Model model) {
		Restaurant res = restaurantService.getRes(resId);
		rev.setResId(resId);
		reviewService.writeReview(rev);

		model.addAttribute("restaurant", res);
		model.addAttribute("reviews", reviewService.getReview(resId));

		return "redirect:/res/detail?resId=" + resId;
	}

//
	@GetMapping("/review/delete")
	public String getReviewDelete(@RequestParam("reviewId") int reviewId, @RequestParam("resId") int resId,
			Model model) {
		reviewService.removeReview(resId, reviewId);
		return "redirect:/res/detail?resId="+resId;
	}

	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> getDownLoad(@RequestParam(value = "fileName") String fileName) {

		String filePath = "C:\\temp\\" + fileName;

		Resource res = new FileSystemResource(filePath);

		String resourceName = res.getFilename();

		resourceName = resourceName.substring(resourceName.indexOf("_") + 1);

		HttpHeaders headers = new HttpHeaders();

		try {
			headers.add("Content-Disposition",
					"attachment; filename=" + new String(resourceName.getBytes("UTF-8"), "ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return new ResponseEntity<Resource>(res, headers, HttpStatus.OK);
	}

	@GetMapping("error/404")
	public void showError404() {

	}

	@GetMapping("/info")
	public String showBreakTimeInfo() {
		return "info";
	}

}
