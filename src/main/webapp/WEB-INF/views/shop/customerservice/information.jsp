<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<c:set var="selectedMenu" value="information" />
<%@ include file="/WEB-INF/views/shop/customerservice/common/customerserviceui.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>고객센터 위치 안내</title>
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #f9f9f9;
      margin: 0;
      padding: 20px;
    }
    .container {
      max-width: 900px;
      margin: auto;
      background: #fff;
      padding: 30px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      border-radius: 10px;
    }
    h2 {
      color: #333;
      margin-bottom: 20px;
    }
    #map {
      width: 100%;
      height: 400px;
      border-radius: 8px;
      margin-bottom: 30px;
    }
    .info-box {
      display: flex;
      justify-content: space-between;
      gap: 20px;
    }
    .info {
      flex: 1;
      background: #f0f4ff;
      padding: 20px;
      border-radius: 8px;
      color: #333;
    }
    .info h3 {
      margin-top: 0;
      color: #0055aa;
    }
  </style>

  <!-- Google Maps API 로드 -->
  <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=MyKeyPlease&callback=initMap">
  </script>
  <script>
    function initMap() {
      const location = { lat: 37.50979773884461, lng: 127.05562474231094 };
      const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 17,
        center: location,
      });

      const marker = new google.maps.Marker({
        position: location,
        map: map,
        title: "📍 삼성동 151-7 고객센터"
      });

      const infoWindow = new google.maps.InfoWindow({
        content: '<div style="font-size:14px;">📍 삼성동 151-7 고객센터</div>'
      });

      marker.addListener("click", () => {
        infoWindow.open(map, marker);
      });

      infoWindow.open(map, marker); // 자동으로 정보창 열기
    }
  </script>
</head>
<body>
  <div class="container">
    <h2>📍 고객센터 위치 안내</h2>
    <div id="map"></div>

    <div class="info-box">
      <div class="info">
        <h3>고객센터</h3>
        <p>주소: 서울특별시 강남구 삼성동 151-7</p>
        <p>전화번호: 02-1234-5678</p>
        <p>운영시간: 평일 09:00 ~ 18:00</p>
      </div>
      <div class="info">
        <h3>판매자 고객센터</h3>
        <p>주소: 서울특별시 강남구 삼성동 151-7</p>
        <p>전화번호: 02-9876-5432</p>
        <p>운영시간: 평일 10:00 ~ 17:00</p>
      </div>
    </div>
  </div>
</body>
</html>
