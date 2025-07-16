package com.intellimarket.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * Web 설정 : 영역별 Config/DispatcherServlet
 * @author 혜원
 */
public class WebAppInitializer implements WebApplicationInitializer {
	@Override
    public void onStartup(ServletContext servletContext) {
		// root context (공통 빈)
		AnnotationConfigWebApplicationContext rootCtx = new AnnotationConfigWebApplicationContext();
	    rootCtx.register(AppConfig.class, PersistenceConfig.class); // 공통 구성
	    servletContext.addListener(new ContextLoaderListener(rootCtx));
		// Admin context
		AnnotationConfigWebApplicationContext adminCtx = new AnnotationConfigWebApplicationContext();
		adminCtx.register(AdminWebConfig.class);
		ServletRegistration.Dynamic adminDispatcher = servletContext.addServlet("adminDispatcher", new DispatcherServlet(adminCtx));
		adminDispatcher.addMapping("/admin/*");
		
		// Shop
		
		// Seller
		
	}

}
