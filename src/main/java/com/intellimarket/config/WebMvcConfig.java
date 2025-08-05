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
 * - 정적 리소스 핸들링
 * - 파일 업로드, JSON 변환
 * - 컨트롤러 자동 스캔 (@Controller)
 * @author 혜원
 */
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.intellimarket")
public class WebMvcConfig extends WebMvcConfigurerAdapter {

	/**
     * JSP 뷰 리졸버 설정
     * - /WEB-INF/views/ 이하 .jsp 파일을 뷰로 인식
     */
    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver vr = new InternalResourceViewResolver();
        vr.setPrefix("/WEB-INF/views/");
        vr.setSuffix(".jsp");
        return vr;
    }

    /**
     * 정적 리소스 경로 설정
     * - /resources/** → /resources/ 내부 파일 접근 가능
     * - 배포 중 직접 접근 가능한 이미지 경로도 추가 매핑
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
        
        // 임시 배포 폴더 물리 경로 추가 매핑
        registry.addResourceHandler("/store/**")
                .addResourceLocations("file:///C:/workspace/project_wroksapce2/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/intellimarket/resources/");
        
        // 크롬 개발자 도구 자동요청 무시
        registry.addResourceHandler("/.well-known/**")
        .addResourceLocations("classpath:/static/.well-known/");
        
        // favicon 요청 매핑
        registry.addResourceHandler("/favicon.ico").addResourceLocations("classpath:/static/favicon.ico");

    }
    /**
     * JSON 변환기 등록
     * - @ResponseBody 사용 시 객체를 JSON으로 자동 변환
     */
    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(new MappingJackson2HttpMessageConverter());
        super.configureMessageConverters(converters);
    }
    
    /**
     * 파일 업로드 설정
     * - 최대 업로드 사이즈: 10MB
     */
	@Bean 
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setMaxUploadSize(10*1024*1024); //10M 
		return resolver;
	}
}
