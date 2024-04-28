package com.ssafy.ws.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.ws.view.FileDownLoadView;

@Controller
public class UploadController {
	
	// resource 경로를 가져오기 위해 ResourceLoader를 주입 받는다.
	@Autowired
	ResourceLoader resLoader;
	
	// 업로드 테스트 페이지로 이동
	@GetMapping("/")
	public String index() {
		return "redirect:/upload";
	}
	
	// 업로드 폼을 보여준다.
	@GetMapping("/upload")
	public String uploadForm() {
		return "upload";
	}
	
	@PostMapping("/upload")
	public String upload(@RequestParam(name="file1", required=true) MultipartFile file, Model model) throws IllegalStateException, IOException {
		if (file != null && file.getSize() > 0) {
			// 파일을 저장할 폴더 지정
			// 실제 경로 : 워크스페이스폴더\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\프로젝트명\\resources\\upload
			Resource res = resLoader.getResource("resources/upload");

			// 파일이 존재하면 파일을 저장한다. 파일명에 현재 시간을 붙여서 중복을 방지한다.
			String filename = System.currentTimeMillis() + "_" + file.getOriginalFilename();
			File target = new File(res.getFile().getCanonicalPath(), filename);

			file.transferTo(target);
			
			model.addAttribute("fileName", filename);
		}

		return "result";
	}
	/* Q. 파일 다운로드를 위한 컨트롤러 메소드를 작성하세요.
	* 해당 메소드는 /download로 요청이 들어오면 실행되며, filename을 파라미터로 받습니다.
	* 파일 정보를 모델에 담고, 파일 다운로드를 위한 뷰인 FileDownLoadView로 fileInfo를 모델과 함께 넘겨줍니다.
	*/
	@GetMapping("/download")
	public ModelAndView download(@RequestParam(name = "filename", required = true) String fileName) {
        // 파일 정보를 모델에 담는다.
		Map<String, Object> fileInfo = new HashMap<String, Object>();
		fileInfo.put("filename", fileName);
		
		// FileDownLoadView로 fileInfo를 모델과 함께 넘겨준다.
		return new ModelAndView("fileDownLoadView","downloadFile", fileInfo);
	}
}
