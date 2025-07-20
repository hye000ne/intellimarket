package com.intellimarket.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * 프로젝트 전역에서 사용할 Bean 등록 및 컴포넌트 스캔 설정
 * - com.intellimarket 이하 모든 패키지 스캔
 * @author 혜원
 */
@Configuration
@ComponentScan(basePackages = "com.intellimarket")
public class AppConfig {
}
