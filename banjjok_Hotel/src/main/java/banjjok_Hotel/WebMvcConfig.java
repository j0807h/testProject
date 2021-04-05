package banjjok_Hotel;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import banjjok_Hotel.interceptor.CertificationInterceptor;


@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {
//	 interceptor
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		// addPathPatterns("/**/**") : interceptor 걸 페이지
//		// excludePathPatterns("/register/**/") : interceptor 예외처리 할 주소
//		registry.addInterceptor(new CertificationInterceptor()).addPathPatterns("/**/**")
//		.excludePathPatterns("/")
//		.excludePathPatterns("/login").excludePathPatterns("/salon/desn")
//		.excludePathPatterns("/salon/desn/**").excludePathPatterns("/salon/style/**")
//		.excludePathPatterns("/salon/menu/menuInfo")
//		.excludePathPatterns("/salon/menu")
//		.excludePathPatterns("/resources/**");
//	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/**").addResourceLocations("/WEB-INF/view/");
	}

}
