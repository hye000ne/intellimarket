<%@page import="com.intellimarket.store.domain.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>

<link rel="stylesheet" href="${ctx}/resources/admin/assets/plugins/summernote/summernote-bs4.min.css">


<!-- Content -->
<div class="content-wrapper">
  <!-- Content Header -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">상품 상세</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item">Home</li>
            <li class="breadcrumb-item active">상품관리 > 상품상세</li>
          </ol>
        </div>
      </div>
    </div>
  </div>
  <!-- /.content-header -->

  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <!-- 좌측: 상품 기본 정보 -->
        <div class="col-md-6">
          <div class="card card-primary">
	  <div class="card-header">
	    <h3 class="card-title"><i class="fas fa-box"></i> 상품 상세</h3>
	  </div>
	  <div class="card-body">
	    <form id="form1" enctype="multipart/form-data">
	    <input type="hidden" id="productId" value="${product.productId}">
	      <!-- 카테고리 섹션 -->
	      <h5 class="mb-3"><i class="fas fa-layer-group text-primary"></i> 카테고리</h5>
	      <div class="form-row mb-4">
	        <div class="form-group col-md-6">
	          <label>상위 카테고리</label>
	          <input type="text" class="form-control" id = "topCategory" name="topCategory.topCategoryId" value = "${product.subCategory.topCategory.categoryName}" disabled>
	        </div>
	        <div class="form-group col-md-6">
	          <label>하위 카테고리</label>
	          <input type="text" class="form-control" id = "subCategory" name="subCategory.subCategoryId" value = "${product.subCategory.categoryName}"disabled>
	        </div>
	      </div>
	
	      <!-- 기본 정보 -->
	      <h5 class="mb-3"><i class="fas fa-info-circle text-primary"></i> 기본 정보</h5>
	      <div class="form-row mb-4">
	        <div class="form-group col-md-6">
	          <label>상품명</label>
	          <input type="text" class="form-control" name="productName" value = "${product.productName}" disabled>
	        </div>
	        <div class="form-group col-md-6">
	          <label>브랜드</label>
	          <input type="text" class="form-control" name="brandName" value = "${product.brandName}" disabled>
	        </div>
	      </div>
	
	      <!-- 가격/할인/재고 -->
	      <h5 class="mb-3"><i class="fas fa-tags text-primary"></i> 가격 정보</h5>
	      <div class="form-row mb-4">
	        <div class="form-group col-md-4">
	          <label>상품 가격</label>
	          <input type="text" class="form-control" name="price" value = "${product.price}" disabled>
	        </div>
	        <div class="form-group col-md-4">
	          <label>할인 가격</label>
	          <input type="text" class="form-control" name="discount" value = "${product.discount}" disabled>
	        </div>
	        <div class="form-group col-md-4">
	          <label>재고</label>
	          <input type="text" class="form-control" name="productStock" value = "${product.productStock}" disabled>
	        </div>
	      </div>
	
	      <!-- 모델명/원산지 -->

		<h5 class="mb-3"><i class="fas fa-cogs text-primary"></i> 제품 세부 정보</h5>
		<div class="form-row mb-4">
		  <div class="form-group col-md-6">
		    <label><i class="fas fa-barcode text-secondary mr-1"></i> 모델명</label>
		    <input type="text" class="form-control" name="modelCode" value = "${product.modelCode}" disabled>
		  </div>
		  <div class="form-group col-md-6">
		    <label><i class="fas fa-globe-asia text-secondary mr-1"></i> 원산지</label>
		    <input type="text" class="form-control" name="origin" value = "${product.origin}" disabled>
		  </div>
		</div>
	
	      <!-- 간단소개 -->
	      <h5 class="mb-3"><i class="fas fa-pencil-alt text-primary"></i> 간단소개</h5>
	      <div class="form-group">
	        <textarea class="form-control" name="introduce" rows="2" disabled>${product.introduce}</textarea>
	      </div>
	     </form>
	  </div>
	</div>
        </div>

	<!-- 우측: 이미지 업로드 -->
	<div class="col-md-6">
	  <div class="card card-success">
	    <div class="card-header">
	      <h3 class="card-title"><i class="fas fa-image"></i> 상품 이미지 조회 </h3>
	    </div>
	    <div class="card-body text-center">
	      <!-- 큰 썸네일 영역 -->
		<div id="main-thumbnail-preview" class="border rounded mb-3" 
		     style="min-height:550px; display:flex; justify-content:center; align-items:center;">
		  <img id="main-preview" style="max-width: 100%; max-height: 550px;" 
		       src="${ctx}/resources/store/img/p_${product.productId}/${product.imgList[0].filename}" 
		       alt="선택된 이미지">
		</div>
	
	      <!-- 작은 썸네일 리스트 -->
		<div id="thumbnail-list" class="d-flex flex-wrap border rounded" 
		     style="gap:10px; padding:10px; min-height:100px; justify-content:center; overflow-y:auto;">
		  <c:forEach var="img" items="${product.imgList}">
		    <img src="${ctx}/resources/store/img/p_${product.productId}/${img.filename}" 
		         style="width:80px; height:80px; object-fit:cover; cursor:pointer;" 
		         class="border rounded thumbnail-img" />
		  </c:forEach>
		</div>
	    </div>
	  </div>
	</div>
   </div>
	
      <!-- 상세 내용 -->
      <div class="card card-primary mt-3">
        <div class="card-header">
          <h3 class="card-title"><i class="fas fa-info-circle"></i> 상품 상세 내용 조회</h3>
        </div>
        <div class="card-body">
          <textarea id="summernote" name="productDetail">${product.productDetail}</textarea>
        </div>
        <div class="card-footer text-right">
          <button type="button" class="btn btn-primary" id="bt_update"><i class="fas fa-save"></i> 상품 수정</button>
          <button type="button" class="btn btn-secondary" id="bt_list">목록보기</button>
        </div>
      </div>
    </div>
  </section>
</div>

<script>
	//이미지 업로드 시 , 필요한 selected file 배열 선언
	let selectedFile = [];
	//이미지 미리보기 렌더링
	function previewMultipleImages(event) {
		let files = event.target.files;
	    let mainPreview = document.getElementById('main-preview');
	    let mainPlaceholder = document.getElementById('main-upload-placeholder');
	    let thumbnailList = document.getElementById('thumbnail-list');
	
	    thumbnailList.innerHTML = ''; // 작은 썸네일 초기화
	
	    if (files.length === 0) {
	      mainPreview.style.display = 'none';
	      mainPlaceholder.style.display = 'block';
	      return;
	    }
	
	    // 첫번째 이미지를 크게 보여주기
	    let firstFile = files[0];
	    let readerMain = new FileReader();
	    readerMain.onload = function(e) {
	      mainPreview.src = e.target.result;
	      mainPreview.style.display = 'block';
	      mainPlaceholder.style.display = 'none';
	    }
	    readerMain.readAsDataURL(firstFile);
	
	    // 작은 썸네일 생성
	    Array.from(files).forEach(file => {
			selectedFile.push(file);
	    	let reader = new FileReader();
	      reader.onload = function(e) {
	    	let img = document.createElement('img');
	        img.src = e.target.result;
	        img.style.width = '80px';
	        img.style.height = '80px';
	        img.style.objectFit = 'cover';
	        img.style.cursor = 'pointer';
	        img.classList.add('border', 'rounded');
	
	        // 호버 시 큰 이미지 변경
	        img.addEventListener('mouseenter', () => {
	          mainPreview.src = img.src;
	        });
	
	        thumbnailList.appendChild(img);
	      }
	      reader.readAsDataURL(file);
	    });
	  }
	
	//업데이트 페이지 요청
	function gotoUpdate(){
		let productId = Number($('#productId').val()); 
    	location.href='/store/seller/manage/product/update?productId='+productId;
	}
	
  $(()=>{
	
	//summernote에 작성된 내용 가져오기
    $('#summernote').summernote({
   	 	height: 600,
   	  	toolbar: false,       // 툴바 숨김 (수정 도구 없애기)
   	  	disableResizeEditor: true,
   	  	callbacks: {
   	    onInit: function() {
   	      $('#summernote').summernote('disable');  // 에디터 비활성화 (읽기 전용)
   	    }
   	  }
    });
	
    
  	//상품 목록 버튼 이벤트 부여
    $('#bt_list').click(()=>{
    	location.href='/store/seller/manage/product/list'
    });
  	
  	//상품 수정 버튼 이벤트 부여
    $('#bt_update').click(()=>{
		gotoUpdate();
    });
  	
  	//이미지 Hover 효과 부여
    $('#thumbnail-list').on('mouseenter', 'img.thumbnail-img', function() {
        let src = $(this).attr('src');
        $('#main-preview').attr('src', src);
      });
  });
</script>