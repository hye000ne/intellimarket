<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>

<div class="content-wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-12">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">배너 관리</li>
						<li class="breadcrumb-item active">배너 등록</li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<section class="content">
  		<div class="container-fluid">
			<form id="bannerForm" enctype="multipart/form-data">
    			<div class="row">
		      		<!-- 좌측: 배너 정보 -->
		      		<div class="col-md-6">
		        		<div class="card card-primary" style="height: 440px;">
		          			<div class="card-header">
		            			<h3 class="card-title"><i class="fas fa-flag"></i> 배너 등록</h3>
		          			</div>
		          			<div class="card-body">
		              				<!-- 제목 -->
		              				<div class="form-group mt-3 mb-4">
			                			<label for="title">제목</label>
			                			<input type="text" class="form-control" id="title" name="title" placeholder="배너 제목 입력">
		              				</div>
					
					             	<!-- 노출 여부 -->
					              	<div class="form-group mt-3 mb-4">
					                	<label>노출 여부</label><br/>
					                	<div class="form-check form-check-inline">
					                  		<input class="form-check-input" type="radio" id="statusY" name="status" value="Y" checked>
	                  						<label class="form-check-label" for="statusY">Y</label>
				                		</div>
					                	<div class="form-check form-check-inline">
						                  	<input class="form-check-input" type="radio" id="statusN" name="status" value="N">
						                  	<label class="form-check-label" for="statusN">N</label>
						                </div>
					              	</div>
		
					              	<!-- 링크 URL -->
					              	<div class="form-group mt-3 mb-5">
					                	<label>링크 URL</label>
					                	<input type="text" class="form-control" id="linkUrl" name="linkUrl" placeholder="클릭 시 이동할 링크">
					              	</div>
								<div class="text-right">
								  	<button type="button" class="btn btn-secondary" onclick="goListPage()">목록</button>
								  	<button type="button" class="btn btn-primary mr-2" onclick="submitBanner()">등록</button>
						        </div>
			          		</div>
		       			</div>
		      		</div>
	
		      		<!-- 우측: 이미지 업로드 -->
			      	<div class="col-md-6">
			        	<div class="card card-success">
				          	<div class="card-header">
				            	<h3 class="card-title"><i class="fas fa-image"></i> 배너 이미지 등록</h3>
				          	</div>
				          	<div class="card-body text-center">
					            <!-- 미리보기 영역 -->
				            	<div class="preview-wrapper border rounded mb-3 d-flex justify-content-center align-items-center flex-column" style="min-height: 300px;">
								  	<img id="bannerPreview" class="img-fluid d-none mb-2" alt="선택된 이미지" />
								  	<p id="bannerPlaceholder" class="text-muted">이미지 미리보기</p>
								</div>
								<!-- 파일 선택 -->
								<div>
								  	<input type="file" id="imageFile" name="imageFile" accept="image/*" class="d-none" onchange="onBannerImageChange(this)">
								  	<button type="button" class="btn btn-outline-primary" onclick="openImageFile()">이미지 선택</button>
								</div>
				            </div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
</div>

<script>
	// 이미지 선택 트리거
	function openImageFile() {
		$('#imageFile').click();
	}

	// 이미지 미리보기
	function onBannerImageChange(input) {
		const file = input.files[0];
		if(!file) return;
		
		const reader = new FileReader();
		reader.onload =function(e) {
			$('#bannerPreview').attr('src', e.target.result).removeClass('d-none');
			$('#bannerPlaceholder').hide();
		};
		reader.readAsDataURL(file);		
	}
	
	// 배너 등록 ajax
	function submitBanner() {
		if (!validateBannerForm()) return;
	
		const formData = new FormData(document.getElementById('bannerForm'));
	
		$.ajax({
			url: '/admin/market/banner/regist',
			type: 'POST',
			data: formData,
			processData: false,
			contentType: false,
			success: function(res) {
				if (res.status === 'ok') {
					alert(res.msg);
					location.href = '/admin/market/banner/list';
				} else {
					alert(res.msg);
				}
			},
			error: function(xhr) {
				alert('등록 중 오류가 발생했습니다.');
			}
		});
	}
	
	// 유효성 검사
	function validateBannerForm() {
		if (!$('#title').val()) {
			alert('제목을 입력해주세요.');
			return false;
		}

		if (!$('#imageFile').val()) {
			alert('이미지를 선택해주세요.');
			return false;
		}
		
		if (!$('[name="status"]').is(':checked')) {
		  	alert('노출여부를 체크해주세요.');
		  	return false;
		}

		return true;
	}
	
	// 목록
	function goListPage() {
		location.href = '/admin/market/banner/list';
	}
</script>
