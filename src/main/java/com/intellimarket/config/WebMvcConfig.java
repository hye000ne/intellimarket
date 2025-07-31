package com.intellimarket.config;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/**
 * Spring MVC 설정
 * - 뷰 리졸버
 * - 정적 리소스 경로 설정
 * - 컨트롤러 전체 스캔 포함
 * @author 혜원
 */
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.intellimarket")
public class WebMvcConfig extends WebMvcConfigurerAdapter {

    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver vr = new InternalResourceViewResolver();
        vr.setPrefix("/WEB-INF/views/");
        vr.setSuffix(".jsp");
        return vr;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
        
        // 임시 배포 폴더 물리 경로 추가 매핑
        registry.addResourceHandler("/resources/store/img/**")
                .addResourceLocations("file:///C:/TeamProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/intellimarket/resources/store/img/");
    }
    
    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(new MappingJackson2HttpMessageConverter());
        super.configureMessageConverters(converters);
    }
    
	@Bean 
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setMaxUploadSize(10*1024*1024); //10M 
		return resolver;
	}
	
}
