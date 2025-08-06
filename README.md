<img width="983" height="241" alt="logo07" src="https://github.com/user-attachments/assets/70e8888d-378d-48a9-ae85-aaf393165f8c" />

# 🛍️  Intelli Market (온라인 마켓플레이스)

> 인텔리마켓은 다수의 판매자와 소비자가 온라인상에서 상거래를 할 수 있도록 중개 역할을 수행하는 플랫폼 입니다.
>
> 네이버 스마트스토어, 쿠팡등을 참고한 미니 프로젝트 입니다.

---

## 📌 프로젝트 개요

- **기획 의도**: 평범한 온라인 쇼핑몰이 아닌, 다수의 판매자가 입점하여 스토어를 관리/디자인 할 수 있는 플랫폼 개발
  
- **기술 스택**: 
    - 개발 언어 : JAVA 8, JAVASCRIPT
    - 웹 개발 기술 : JSP, CSS, HTML, Bootstrap
    - 웹 컨테이너 : Tomcat 8.5
    - 서버 환경 : Localhost
    - DBMS : MySQL (Ubutntu 24.04 LTS)
    - 빌드도구 : Maven
    - 프레임워크
        - Spring-webmvc, spring-security-core
    - 라이브러리
        -  서블릿 : servlet-api, servlet.jsp-api
        -  JSP: JSTL
        -  JDBC : Spring-JDBC / MySQL-connector-java
        -  SQL 매퍼 : MyBatis / MyBatis-spring
        -  로깅 추상화 구현: Logback / Slf4j
        -  코드 자동 생성 : LOMBOK
        -  JSON 직렬화 : Jackson / jackson-datatype-jsr310
        -  이메일/편의 : javax.mail-api / sun.mail:javax.mail / spring-context-support
        -  파일업로드 : commons-fileupload
    - 기타 환경 :  DBeaver(DB 관리), STS(IDE), Ashion / Admin-LTE (Temlplete), ERD(ERD-CLOUD)
    - 
- **프로젝트 구성**: 단일 Maven 프로젝트 내 역할별 패키지 분리
    - 플랫폼(인텔리마켓) 메인 (shop)
    - 판매자 페이지 (store)
    - 플랫폼 관리자 (admin)

---
## 👤 팀 구성 및 역할 분담

| 이름 | 담당 업무 |
| --- | --- |
| **구지훈 jihoon-devstu** | 요구사항 명세 설계, 판매자 어드민 페이지 디자인, 판매자 기능(상품관리, 주문관리, 정산관리) |
| **박혜원 hye000ne** | 프로젝트 구조 설계, 로그인 세션 및 권한 관리, 공통 예외처리, 전체 디자인, 마켓 어드민 기능 전반, 공통 기능 |
| **신주원 JuWonISee** | 소비자 마이페이지, 고객센터 페이지, 주문 관련 페이지 및 기능 (장바구니, 결제), 소비자 구매내역 관리 |
| **정재환 rekindle402** | ERD/DB 설계, 스토어 페이지 전반, 개인 스토어 관리(카테고리, 로고, 정보), 회원인증 |

---

## 📂 디렉토리 구조

```
📦 src/main/java/com.eoneifour
├── common                      # 공통 설정 / 유틸
│   ├── controller/             # 메일 처리 컨트롤러
│   ├── exception/              # 전역 예외 처리
│   ├── service/                # 메일 서비스
│   ├── util/                   # 세션, 쿠키, 파일관리, 암호화, 
│   └── view/                   # 로그인 / 회원가입 뷰
│
├── shop, store, admin          # 플랫폼 / 스토어 / 관리자
│   ├── controller/            
│   ├── exception/            
│   ├── service/              
│   ├── domain/               
│   ├── dao/ 
│                                  
├── resources
│   ├───mapper/                 # MyBatis 매퍼
│   ├───logback     
│ 
├── webapp
    ├── WEB-INF/views            
    ├── common/error           
    ├── layout             
    ├── shop
    ├── store
```

---

## ⚙️ 주요 기능별 요약

### 🌐 플랫폼(마켓)

- 

### 🛍️ 스토어

-

### 🛠 판매자

- 

### 🛠 관리자

-

---

## 💻 ERD

<img width="2170" height="2462" alt="Intelli Market (3)" src="https://github.com/user-attachments/assets/ec4ff1bf-403b-4b39-b8ed-9075568637a5" />


---

## 🖥️ 실행 화면 캡쳐

## 🔗기타 참고 링크

