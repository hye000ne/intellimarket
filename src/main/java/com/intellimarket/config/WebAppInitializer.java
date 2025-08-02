package com.intellimarket.config;


import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * Web 설정 초기화 클래스
 * - 인코딩 필터 등록 (UTF-8)
 * - Root Context (AppConfig, MyBatisConfig)
 * - Servlet Context (WebMvcConfig → DispatcherServlet)
 * @author 혜원
 */
public class WebAppInitializer implements WebApplicationInitializer {
	@Override
    public void onStartup(ServletContext servletContext) {
		// 인코딩 필터
        CharacterEncodingFilter enc = new CharacterEncodingFilter("UTF-8", true);
        servletContext.addFilter("encodingFilter", enc).addMappingForUrlPatterns(null, false, "/*");

        // Root Context
        AnnotationConfigWebApplicationContext root = new AnnotationConfigWebApplicationContext();
        root.register(AppConfig.class, MyBatisConfig.class);
        servletContext.addListener(new ContextLoaderListener(root));
	    
        // Web(MVC) Context
        AnnotationConfigWebApplicationContext web = new AnnotationConfigWebApplicationContext();
        web.register(WebMvcConfig.class);
        ServletRegistration.Dynamic dispatcher = servletContext.addServlet("dispatcher", new DispatcherServlet(web));
        dispatcher.setInitParameter("throwExceptionIfNoHandlerFound", "true");
        dispatcher.setLoadOnStartup(1);
        dispatcher.addMapping("/"); // 전체 요청 처리
	}
}
