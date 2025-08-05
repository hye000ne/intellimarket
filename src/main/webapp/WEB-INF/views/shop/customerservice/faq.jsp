<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<c:set var="selectedMenu" value="faq" />
<%@ include file="/WEB-INF/views/shop/customerservice/common/customerserviceui.jsp" %>
<%
    // FAQ 데이터 예시 (질문, 답변)
    List<String[]> faqList = new ArrayList<>();
    faqList.add(new String[]{"배송은 얼마나 걸리나요?", "일반적으로 2~3일 이내에 배송됩니다."});
    faqList.add(new String[]{"인텔리 마켓은 무엇인가요?", "스마트 스토어로써 더욱더 다양한 판매자들의 개성과 상품들을 만나보실 수 있습니다."});
    faqList.add(new String[]{"회원가입 없이 구매 가능한가요?", "아니요 회원가입이 되어 있어야만 구매가 가능합니다."});
    faqList.add(new String[]{"판매자도 본인의 판매 사이트를 꾸밀 수 있는 건가요?", "맞습니다. 판매자의 독창성과 디자인을 마음껏 뽐내실 수 있으십니다."});
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>자주 묻는 질문</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            font-family: 'Segoe UI', sans-serif;
        }

        .faq-container {
            max-width: 900px;
            margin: 80px auto;
            padding: 50px 40px;
            background-color: #fff;
            border-radius: 16px;
            box-shadow: 0 6px 16px rgba(0,0,0,0.06);
        }

        .faq-container h2 {
            text-align: center;
            margin-bottom: 40px;
            font-size: 28px;
            color: #0072c6;
        }

        .faq-item {
            border-bottom: 1px solid #eee;
            padding: 20px 0;
        }

        .faq-question {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .faq-answer {
		  	font-size: 16px;
		  	color: #555;
		  	margin-top: 10px;
		  	max-height: 0;
		  	opacity: 0;
		  	overflow: hidden;
		  	padding-top: 0;
		  	transition: max-height 0.6s ease, opacity 0.5s ease, padding-top 0.4s ease;
		  	line-height: 1.8;
		}
		
		.faq-answer.show {
		  	max-height: 1000px;
		  	opacity: 1;
		  	padding-top: 10px;
		}

        .arrow {
            font-size: 14px;
            color: #888;
            transition: transform 0.3s ease;
        }

        .faq-question.open .arrow {
            transform: rotate(180deg);
        }
    </style>
</head>
<body>
	<!-- 상단 배너 -->
	<div class="slider-area">
		<div class="single-slider slider-height2 d-flex align-items-center"
			data-background="${ctx}/resources/shop/assets/img/hero/category.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<h2>FAQ</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="faq-container">
	    <h2>FAQ</h2>
	    <div class="faq-list">
	        <% for(String[] faq : faqList) { %>
	            <div class="faq-item">
	                <div class="faq-question" onclick="toggleFaq(this)">
	                    <%= faq[0] %>
	                    <span class="arrow">▼</span>
	                </div>
	                <div class="faq-answer">
	                    <%= faq[1] %>
	                </div>
	            </div>
	        <% } %>
	    </div>
	</div>

<script>
	function toggleFaq(element) {
		  const answer = element.nextElementSibling;
		  const isOpen = answer.classList.contains("show");
	
		  document.querySelectorAll(".faq-answer").forEach(el => el.classList.remove("show"));
		  document.querySelectorAll(".faq-question").forEach(q => q.classList.remove("open"));
	
		  if (!isOpen) {
		    answer.classList.add("show");
		    element.classList.add("open");
		  }
	}
</script>

</body>
</html>