package com.ssafy.ws.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// Q2. MainPageWebConfig 클래스를 작성하시오.
// MainPageWebConfig 클래스에는 @Configuration 어노테이션을 붙여준다.
// MainPageWebConfig 클래스에는 WebMvcConfigurer 인터페이스를 구현한다.
// MainPageWebConfig 클래스에는 addViewControllers 메소드를 오버라이딩한다.
// addViewControllers 메소드 내부에서 registry.addViewController 메소드를 사용하여 "/" 경로로 요청이 들어왔을 때 "/board/list"로 리다이렉트 되도록 설정한다.

@Configuration
public class MainPageWebConfig implements WebMvcConfigurer {

		@Override
		public void addViewControllers(ViewControllerRegistry registry) {
			registry.addViewController("/").setViewName("redirect:board/list");
		}
}
