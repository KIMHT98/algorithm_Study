package com.ssafy.ws.view;

import java.io.*;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FileDownLoadView extends AbstractView {
	
	@Autowired
	ResourceLoader resLoader;
	
	public FileDownLoadView() {
		setContentType("application/download; utf-8");
	}
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		// 모델로부터 파일 정보를 가져온다.
		Map<String, Object> fileInfo = (Map<String, Object>) model.get("fileInfo");
		
		// 파일 정보로부터 파일명을 가져온다.
		String filename = (String) fileInfo.get("filename");
		
		Resource res = resLoader.getResource("resources/profile");
		File file = new File(res.getFile().getCanonicalPath() + "/" + filename);
		
		// 파일 다운로드를 위한 응답 헤더 정보 설정
		response.setContentType("application/download; utf-8");
		response.setContentLength((int) file.length());
		response.setHeader("Content-Disposition",
				"attachment; filename=\"" + new String(filename.getBytes("UTF-8"), "ISO-8859-1") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		// 파일을 읽어서 클라이언트로 전송
		FileInputStream fis = new java.io.FileInputStream(file);
		OutputStream os = response.getOutputStream();
		FileCopyUtils.copy(fis, os);
		fis.close();
		os.close();
	}
}
