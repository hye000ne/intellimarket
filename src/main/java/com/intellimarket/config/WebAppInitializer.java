package com.intellimarket.config;


import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * Web 설정 : 영역별 Config/DispatcherServlet
 * @author 혜원
 */
public class WebAppInitializer implements WebApplicationInitializer {
	@Override
    public void onStartup(ServletContext servletContext) {
		// 공통 인코딩
		CharacterEncodingFilter enc = new CharacterEncodingFilter("UTF-8", true);
		servletContext.addFilter("encodingFilter", enc).addMappingForUrlPatterns(null, false, "/*");
		
		// Root context
		AnnotationConfigWebApplicationContext root = new AnnotationConfigWebApplicationContext();
		root.register(AppConfig.class, MyBatisConfig.class); // 공통 구성
	    servletContext.addListener(new ContextLoaderListener(root));
	    
		// Admin context
		AnnotationConfigWebApplicationContext admin = new AnnotationConfigWebApplicationContext();
		admin.register(AdminWebConfig.class);
		ServletRegistration.Dynamic adminDispatcher = servletContext.addServlet("adminDispatcher", new DispatcherServlet(admin));
		adminDispatcher.setLoadOnStartup(1);
		adminDispatcher.addMapping("/admin/*");
		
		// Shop
		
		// Seller
		
	}

}
