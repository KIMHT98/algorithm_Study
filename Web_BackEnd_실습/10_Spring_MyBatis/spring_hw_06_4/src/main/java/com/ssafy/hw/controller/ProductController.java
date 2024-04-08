package com.ssafy.hw.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssafy.hw.model.dto.Product;
import com.ssafy.hw.model.dto.Review;

@Controller
public class ProductController {

	List<Product> productList = new ArrayList<>();
	Map<String, List<Review>> reviewMap = new HashMap<>();
	String pCode = "";
	int reviewId = 0;

	
	@GetMapping({ "/", "/index" })
	public String index() {
		return "index";
	}

	@GetMapping("/product/list")
	public String getProductList(Model model) {
		model.addAttribute("productList", productList);
		return "product/productList";
	}

	@GetMapping("/product/regist")
	public String getProductRegist() {
		return "/product/productRegist";
	}

	@PostMapping("/product/regist")
	public String postProductRegist(Product product, @RequestParam("file") MultipartFile file, Model model) {
		
		String fileName = file.getOriginalFilename();
		String uploadPath = "C:\\temp";
		String saveName = UUID.randomUUID() + "_" + fileName;
		
		File target = new File(uploadPath, saveName);
	
		if(!new File(uploadPath).exists()) {
			new File(uploadPath).mkdirs();
		}
		
		try {
			FileCopyUtils.copy(file.getBytes(), target);
			product.setFileName(saveName);
			product.setFileUri(target.getCanonicalPath());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(file);
		model.addAttribute("product", product);
		productList.add(product);

		return "/product/productDetail";
	}

	@GetMapping("/product/detail")
	public String getProductDetail(String pCode, Model model) {

		Product product = null;

		for (int i = 0; i < productList.size(); i++) {
			if (productList.get(i).getpCode().equals(pCode)) {
				product = productList.get(i);
			}
		}

		if (product == null) {
			throw new RuntimeException();
		}

		model.addAttribute("product", product);
		model.addAttribute("reviews", reviewMap.get(pCode));

		return "/product/productDetail";
	}

	@GetMapping("/product/delete")
	public String PostDeleteProduct(String pCode) {
		for (int i = 0; i < productList.size(); i++) {
			if (productList.get(i).getpCode().equals(pCode)) {
				productList.remove(i);
				break;
			}
		}

		if (reviewMap.containsKey(pCode)) {
			reviewMap.remove(pCode);
		}

		return "redirect:/product/list";
	}

	@GetMapping("/product/update")
	public String getProductUpdate(String pCode, Model model) {
		Product product = null;

		for (int i = 0; i < productList.size(); i++) {
			if (productList.get(i).getpCode().equals(pCode)) {
				product = productList.get(i);
				break;
			}
		}

		if (product == null) {
			throw new RuntimeException();
		}

		model.addAttribute("product", product);

		return "/product/productUpdate";
	}

	@PostMapping("/product/update")
	public String postProductUpdate(Product product, Model model) {
		for (int i = 0; i < productList.size(); i++) {
			if (productList.get(i).getpCode().equals(product.getpCode())) {
				productList.set(i, product);
			}
		}
		model.addAttribute("product", product);
		model.addAttribute("reviews", reviewMap.get(pCode));

		return "/product/productDetail";
	}

	@PostMapping("/review/regist")
	public String postReviewRegist(Review rev, Model model) {
		String pCode = rev.getpCode();

		rev.setReviewId(reviewId++);

		if (reviewMap.containsKey(pCode)) {
			reviewMap.get(pCode).add(rev);
		} else {
			List<Review> list = new ArrayList<>();
			list.add(rev);
			reviewMap.put(pCode, list);
		}

		Product product = null;

		for (int i = 0; i < productList.size(); i++) {
			if (productList.get(i).getpCode().equals(pCode)) {
				product = productList.get(i);
			}
		}

		model.addAttribute("product", product);
		model.addAttribute("reviews", reviewMap.get(pCode));

		return "/product/productDetail";
	}

	@GetMapping("/review/delete")
	public String getReviewDelete(Integer reviewId, String pCode, Model model) {

		List<Review> list = reviewMap.get(pCode);

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getReviewId() == reviewId) {
				list.remove(i);
				break;
			}
		}

		Product product = null;

		for (int i = 0; i < productList.size(); i++) {
			if (productList.get(i).getpCode().equals(pCode)) {
				product = productList.get(i);
			}
		}

		model.addAttribute("product", product);
		model.addAttribute("reviews", reviewMap.get(pCode));

		return "/product/productDetail";
	}

	
	@GetMapping(value="/download"
			,produces= MediaType.APPLICATION_OCTET_STREAM_VALUE )
	@ResponseBody
	public ResponseEntity<Resource> getDownLoad(@RequestParam(value="fileName") String fileName) {
		
		String filePath = "C:\\temp\\" + fileName;
		
		Resource res = new FileSystemResource(filePath);
		
		String resourceName = res.getFilename();
		
		resourceName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.add("Content-Disposition", "attachment; filename=" + new String(resourceName.getBytes("UTF-8") , "ISO-8859-1"));
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
