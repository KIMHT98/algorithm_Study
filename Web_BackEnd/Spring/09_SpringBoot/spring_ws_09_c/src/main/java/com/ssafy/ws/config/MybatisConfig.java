package com.ssafy.ws.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

// Q1. MybatisConfig 클래스를 작성하시오.
// MybatisConfig 클래스에는 @Configuration 어노테이션을 붙여준다.
// MybatisConfig 클래스에는 @MapperScan 어노테이션을 붙여준다.

@MapperScan("com.ssafy.ws.model.dao")
@Configuration
public class MybatisConfig {

}
