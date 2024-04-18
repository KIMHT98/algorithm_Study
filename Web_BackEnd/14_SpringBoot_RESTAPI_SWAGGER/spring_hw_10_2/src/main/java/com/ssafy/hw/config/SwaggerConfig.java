package com.ssafy.hw.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
 
@Configuration
public class SwaggerConfig {
    @Bean
    public OpenAPI openAPI() {
        return new OpenAPI()
                .components(new Components())
                .info(apiInfo());
    }
 
    private Info apiInfo() {
        return new Info()
                .title("SSAFY 사용자 관리 API")
                .description("<h3>워크샵에서 사용되는 RestApi에 대한 문서를 제공한다.</h3>")
                .version("1.0.0")
                .license(new License().name("SSAFY").url("http://www.ssafy.com"))
                ;
    }
}
