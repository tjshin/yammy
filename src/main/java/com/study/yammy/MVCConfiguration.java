package com.study.yammy;

import org.springframework.context.annotation.Configuration;

import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.study.yammy.AdminInterceptor;

@Configuration
public class MVCConfiguration implements WebMvcConfigurer {
	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		registry.addInterceptor(new AdminInterceptor()).addPathPatterns("/admin/**");

	}
}