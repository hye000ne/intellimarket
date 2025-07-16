package com.intellimarket.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * 프로젝트 공통 컴포넌트 스캔
 * @author 혜원
 */
@Configuration
@ComponentScan(basePackages = "com.intellimarket")
public class AppConfig {

}
