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
          <h1 class="m-0">상품 등록</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active">상품관리 > 상품등록</li>
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
	    <h3 class="card-title"><i class="fas fa-box"></i> 상품 등록</h3>
	  </div>
	  <div class="card-body">
	    <form id="form1" enctype="multipart/form-data">
	    <input type="hidden" name="productId" value="${product.productId}">
	      <!-- 카테고리 섹션 -->
	      <h5 class="mb-3"><i class="fas fa-layer-group text-primary"></i> 카테고리</h5>
	      <div class="form-row mb-4">
	        <div class="form-group col-md-6">
	          <label>상위 카테고리</label>
	          <select class="form-control" id="topCategory" name="subCategory.topCategory.topCategoryId"></select>
	        </div>
	        <div class="form-group col-md-6">
	          <label>하위 카테고리</label>
	          <select class="form-control" id="subCategory" name="subCategory.subCategoryId"></select>
	        </div>
	      </div>
	
	      <!-- 기본 정보 -->
	      <h5 class="mb-3"><i class="fas fa-info-circle text-primary"></i> 기본 정보</h5>
	      <div class="form-row mb-4">
	        <div class="form-group col-md-6">
	          <label>상품명</label>
	          <input type="text" class="form-control" name="productName" value = "${product.productName}" placeholder="상품명을 입력하세요">
	        </div>
	        <div class="form-group col-md-6">
	          <label>브랜드</label>
	          <input type="text" class="form-control" name="brandName" value = "${product.brandName}" placeholder="브랜드명">
	        </div>
	      </div>
	
	      <!-- 가격/할인/재고 -->
	      <h5 class="mb-3"><i class="fas fa-tags text-primary"></i> 가격 정보</h5>
	      <div class="form-row mb-4">
	        <div class="form-group col-md-4">
	          <label>상품 가격</label>
	          <input type="text" class="form-control" name="price" value = "${product.price}" placeholder="원">
	        </div>
	        <div class="form-group col-md-4">
	          <label>할인 가격</label>
	          <input type="text" class="form-control" name="discount" value = "${product.discount}" placeholder="원">
	        </div>
	        <div class="form-group col-md-4">
	          <label>재고</label>
	          <input type="text" class="form-control" name="productStock" value = "${product.productStock}" placeholder="수량">
	        </div>
	      </div>
	
	      <!-- 모델명/원산지 -->

		<h5 class="mb-3"><i class="fas fa-cogs text-primary"></i> 제품 세부 정보</h5>
		<div class="form-row mb-4">
		  <div class="form-group col-md-6">
		    <label><i class="fas fa-barcode text-secondary mr-1"></i> 모델명</label>
		    <input type="text" class="form-control" name="modelCode" value = "${product.modelCode}" placeholder="모델명을 입력하세요">
		  </div>
		  <div class="form-group col-md-6">
		    <label><i class="fas fa-globe-asia text-secondary mr-1"></i> 원산지</label>
		    <input type="text" class="form-control" name="origin" value = "${product.origin}" placeholder="국가명을 입력하세요">
		  </div>
		</div>
	
	      <!-- 간단소개 -->
	      <h5 class="mb-3"><i class="fas fa-pencil-alt text-primary"></i> 간단소개</h5>
	      <div class="form-group">
	        <textarea class="form-control" name="introduce" rows="2" placeholder="100자 이내로 작성하세요">${product.introduce}</textarea>
	      </div>
	     </form>
	  </div>
	</div>
        </div>

	<!-- 우측: 이미지 업로드 -->
	<div class="col-md-6">
	  <div class="card card-success">
	    <div class="card-header">
	      <h3 class="card-title"><i class="fas fa-image"></i> 상품 이미지 등록 </h3>
	    </div>
	    <div class="card-body text-center">
	    
	      <!-- 큰 썸네일 영역 -->
		<div id="main-thumbnail-preview" class="border rounded mb-3" 
		     style="min-height:550px; display:flex; justify-content:center; align-items:center;">
		  <img id="main-preview" style="max-width: 100%; max-height: 550px;" 
		       src="${product.imgList[0].filename}?v=${System.currentTimeMillis()}" 
		       alt="선택된 이미지">
		</div>
	
	      <!-- 작은 썸네일 리스트 -->
		<div id="thumbnail-list" class="d-flex flex-wrap border rounded" 
		     style="gap:10px; padding:10px; min-height:100px; justify-content:center; overflow-y:auto;">
		  <c:forEach var="img" items="${product.imgList}">
		    <img src="${img.filename}?v=${System.currentTimeMillis()}"  
		         style="width:80px; height:80px; object-fit:cover; cursor:pointer;" 
		         class="border rounded thumbnail-img" />
		  </c:forEach>
		</div>
	
	      <!-- 파일 선택 버튼 -->
	      <div class="mt-3">
	        <input type="file" id="photo" name="photo" accept="image/*" multiple class="d-none" onchange="previewMultipleImages(event)">
	        <button type="button" class="btn btn-outline-primary" onclick="document.getElementById('photo').click();">
	          <i class="fas fa-upload"></i> 파일 선택
	        </button>
	      </div>
	    </div>
	  </div>
	</div>
   </div>
	
      <!-- 상세 내용 -->
      <div class="card card-primary mt-3">
        <div class="card-header">
          <h3 class="card-title"><i class="fas fa-info-circle"></i> 상품 상세 내용 등록</h3>
        </div>
        <div class="card-body">
          <textarea id="summernote" name="productDetail">${product.productDetail}</textarea>
        </div>
        <div class="card-footer text-right">
          <button type="button" class="btn btn-primary" id="bt_update"><i class="fas fa-save"></i> 상품수정</button>
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
	
	//카테고리 렌더링
	function printCategory(obj,list,categoryId){

		let tag="<option value='0'>카테고리 선택</option>"
		
		for(let i=0; i<list.length;i++){
			if(obj=="#topCategory"){
				tag+="<option value='"+list[i].topCategoryId+"'>"+list[i].categoryName+"</option>";
			}else if(obj=="#subCategory"){
				tag+="<option value='"+list[i].subCategoryId+"'>"+list[i].categoryName+"</option>";
			}	
		}
		$(obj).html(tag);
		$(obj).val(categoryId);
	}
	
	//판매자가 보유한 상위 카테고리 요청
	function getTopCategory(categoryId){
		$.ajax({
			url:"/store/seller/manage/product/getStoreTopList",
			type:"get",
			success:function(result, status, xhr){ //200번대의 성공 응답 시, 이 함수 실행
				printCategory("#topCategory",result,categoryId);
			},
			error:function(xhr,status,err){
				
			}
		});
	}
	
	//판매자가 보유한 하위 카테고리 요청 (상위 카테고리에 따른 change 이벤트 부여)
	function getSubCategory(topCategoryId,categoryId){
		$.ajax({
			url :"/store/seller/manage/product/getStoreSubList?topCategoryId=" + topCategoryId,
			type:"GET",
			success:function(result, status, xhr){
				printCategory("#subCategory",result,categoryId);
			}
		});
	}
	
	function validateProductForm() {
	    const topCategoryId = parseInt($('#topCategory').val());
	    const subCategoryId = parseInt($('#subCategory').val());
	    const productName = $('[name="productName"]').val().trim();
	    const brandName = $('[name="brandName"]').val().trim();
	    const priceStr = $('[name="price"]').val().trim();
	    const discountStr = $('[name="discount"]').val().trim();
	    const productStockStr = $('[name="productStock"]').val().trim();
	    const modelCode = $('[name="modelCode"]').val().trim();
	    const origin = $('[name="origin"]').val().trim();
	    const introduce = $('[name="introduce"]').val().trim();
	    const productDetail = $('#summernote').summernote('code').replace(/<[^>]*>/g, '').trim();
	    // 기존 이미지나 새로 업로드한 이미지 중 최소 1장 이상 있는지 확인
	    const existingImagesCount = $('#thumbnail-list img').length;
	    const newImagesCount = selectedFile.length;

	    if (isNaN(topCategoryId) || topCategoryId <= 0) {
	      alert('상위 카테고리를 선택해주세요.');
	      return false;
	    }

	    if (isNaN(subCategoryId) || subCategoryId <= 0) {
	      alert('하위 카테고리를 선택해주세요.');
	      return false;
	    }

	    if (productName.length < 1) {
	      alert('상품명을 입력해주세요.');
	      return false;
	    }

	    if (brandName.length < 1) {
	      alert('브랜드명을 입력해주세요.');
	      return false;
	    }

	    if (!/^\d+$/.test(priceStr) || parseInt(priceStr) <= 0) {
	      alert('상품 가격은 0보다 큰 숫자만 입력 가능합니다.');
	      return false;
	    }
	    const price = parseInt(priceStr);

	    if (!/^\d+$/.test(discountStr) || parseInt(discountStr) < 0) {
	      alert('할인 가격은 0 이상의 숫자만 입력 가능합니다.');
	      return false;
	    }
	    const discount = parseInt(discountStr);

	    if (discount > price) {
	      alert('할인 가격은 상품 가격보다 클 수 없습니다.');
	      return false;
	    }

	    if (!/^\d+$/.test(productStockStr) || parseInt(productStockStr) <= 0) {
	      alert('상품 재고는 0보다 큰 숫자만 입력 가능합니다.');
	      return false;
	    }

	    if (modelCode.length < 1) {
	      alert('모델명을 입력해주세요.');
	      return false;
	    }

	    if (origin.length < 1) {
	      alert('원산지를 입력해주세요.');
	      return false;
	    }

	    if (introduce.length < 1) {
	      alert('간단소개를 입력해주세요.');
	      return false;
	    }

	    if (productDetail.length < 1) {
	      alert('상세 내용을 입력해주세요.');
	      return false;
	    }

	    if (existingImagesCount + newImagesCount < 1) {
	        alert('상품 이미지를 최소 1장 선택해주세요.');
	        return false;
	    }

	    return true;
	}
	
  $(()=>{
	
	//summernote 디자인 조정
    $('#summernote').summernote({
      height: 600,
      placeholder: "상품 상세 설명을 입력하세요"
    });
    
	//상위 카테고리 / 하위 카테고리 상품에 맞게 가져온다음 selectd 효과 주기
	//storeInfoId 세션에서 얻어와야함. 현재 하드코딩
	getTopCategory(${product.subCategory.topCategory.topCategoryId})
	getSubCategory(${product.subCategory.topCategory.topCategoryId},${product.subCategory.subCategoryId})
	
	//상위 카테고리의 값 변경 시, 하위 카테고리 가져오기
	//storeInfoId 세션에서 얻어와야함. 현재 하드코딩
   	$("#topCategory").change(function(){
		getSubCategory($(this).val(),0);
    });
	
  	//이미지 Hover 효과 부여
    $('#thumbnail-list').on('mouseenter', 'img.thumbnail-img', function() {
        let src = $(this).attr('src');
        $('#main-preview').attr('src', src);
      });
  	
  	$('#bt_list').click(()=>{
  		location.href='/store/seller/manage/product/list'
  	});
	
    //상품등록 버튼 등록 이벤트 부여
    $('#bt_update').click(()=>{
		if (!validateProductForm()) return;
    	const form = document.getElementById('form1');
    	const formData = new FormData(form);

		//summernote는 form 태그 바깥에 있으므로 추가
		formData.append('productDetail', $('#summernote').summernote('code'));
		
		//썸네일 정보는 form 태그 바깥에 있으므로 추가
		for (let i = 0; i < selectedFile.length; i++) {
		  formData.append('photo', selectedFile[i]);
		}
    	
 	  // 3. serialize 후 전송
 	  $.ajax({
 	    url: '/store/seller/manage/product/updateProduct',
 	    type: 'POST',
 	    data: formData,
 	    contentType: false,
 	    processData: false,
 	    success: function (res) {
 	      if (res.status === 'ok') {
 	        alert(res.msg);
 	        location.href = '/store/seller/manage/product/update?productId=' + ${product.productId};
 	      } else {
 	        alert(res.msg);
 	      }
 	    },
 	    error: function (err) {
 	      console.error('에러 발생:', err);
 	    }
 	  });
  	});
    
    
  });
</script>