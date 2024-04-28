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

@Controller
public class UploadController {
	
	@GetMapping("/download")
	public ModelAndView download(@RequestParam(name = "filename", required = true) String fileName) {
        // 파일 정보를 모델에 담는다.
		Map<String, Object> fileInfo = new HashMap<String, Object>();
		fileInfo.put("filename", fileName);
		
		// FileDownLoadView로 fileInfo를 모델과 함께 넘겨준다.
		return new ModelAndView("fileDownLoadView", "fileInfo", fileInfo);
	}
}
