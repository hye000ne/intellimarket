<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	$(()=>{
		const IMP = window.IMP;
		
		IMP.init("imp61000270"); // 예: 'imp00000000'
	    
		window.requestPay = function(){
	        IMP.request_pay(
	            {
	                channelKey: "channel-key-175fdf55-0110-4c69-899a-806add66d8f2",
	                pay_method: "card",
	                merchant_uid: `payment-${crypto.randomUUID()}`, // 주문 고유 번호
	                name: "노르웨이 회전 의자",
	                amount: 100,
	                buyer_email: "gildong@gmail.com",
	                buyer_name: "홍길동",
	                buyer_tel: "010-4242-4242",
	                buyer_addr: "서울특별시 강남구 신사동",
	                buyer_postcode: "01181",
	                m_redirect_url: "http://localhost:8888/shop/main"
	            },
	            
	            function (response) {
	                if(response.success){
	                    console.log(response);
	                    
	                    $.ajax({
							url: "/payment/",
							method: "POST",
							data: response,
							success: function(result){
								alert("결제가 완료되었습니다.");	
							},
	                    	error: function(err){
								alert("결제 정보 저장 실패")
	                    	}
							
	                    });
	                }else{
	                    console.log(response);
	                    alert("결제 실패 : " + rsp.error_msg);
	                }
	            },
	        );
	    }
	});

</script>
</head>
<body>
	<button onclick="requestPay()">결제하기</button>
</body>
</html>