<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Content Wrapper -->
<div class="content-wrapper">
	<!-- Content Header -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">스토어 정보 관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">
							<a href="#">Home</a>
						</li>
						<li class="breadcrumb-item active">스토어 관리 > 스토어 정보 관리</li>
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
				<!-- 위쪽: 스토어 정보 -->
				<div class="col-md-12 mb-4">
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">
								<i class="fas fa-box"></i> 스토어 정보
							</h3>
						</div>
						<div class="card-body">
							<form id="editForm">
								<!-- 스토어 정보 입력 폼 -->
								<div class="form-row mb-4">
									<div class="form-group col-md-6">
										<label for="storeName">스토어 이름</label> <input type="text" class="form-control" id="storeName" name="storeName" value="${storeInfo.storeName}" placeholder="스토어 이름을 입력하세요" />
									</div>
									<div class="form-group col-md-6">
										<label for="storeTel">스토어 연락처(고객센터)</label> <input type="text" class="form-control" id="storeTel" name="storeTel" value="${storeInfo.storeTel}" placeholder="스토어 연락처를 입력하세요" />
									</div>
									<div class="form-group col-12">
										<label for="storeIntroduce">스토어 간단소개</label>
										<textarea class="form-control" id="storeIntroduce" name="storeIntroduce" rows="2" placeholder="50자 이내로 입력해주세요">${storeInfo.storeIntroduce}</textarea>
									</div>
								</div>
								<div class="form-group text-right">
									<button type="button" class="btn btn-primary" onclick="applyEditForm()">적용</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				<!-- 아래쪽: 배너 이미지 등록 -->
				<div class="col-md-12">
					<form id="logoForm" enctype="multipart/form-data">
						<div class="card card-success">
							<div class="card-header">
								<h3 class="card-title">
									<i class="fas fa-image"></i> 로고 이미지 등록
								</h3>
							</div>
							<div class="card-body text-center">
								<div class="preview-wrapper border rounded mb-3 d-flex justify-content-center align-items-center flex-column" style="min-width: auto; max-width: 100%">
									<img id="logoPreview" class="img-fluid d-none mb-2" alt="선택된 이미지" />
									<p id="logoPlaceholder" class="text-muted">이미지 미리보기</p>
								</div>
								<div>
									<input type="file" id="imageFile" name="imageFile" accept="image/*" class="d-none" onchange="onBannerImageChange(this)" />
									<button type="button" class="btn btn-outline-primary" onclick="openImageFile()">이미지 선택</button>
								</div>
								<div class="text-right mt-3">
									<button type="button" class="btn btn-primary" onclick="submitBanner()">등록</button>
								</div>
							</div>
						</div>
					</form>
				</div>

			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</section>
</div>
<!-- /.content-wrapper -->

<script>
	// 스토어 정보 수정 AJAX
	function applyEditForm() {
		$.ajax({
			type : 'POST',
			url : '/store/seller/manage/editstore/info/apply',
			data : $('#editForm').serialize(),
			success : function(res) {
				if (res.status === 'ok') {
					alert(res.msg);
					location.href = '/store/seller/manage/';
				} else {
					alert('수정 중 오류가 발생했습니다.');
				}
			},
			error : function(xhr) {
				alert(xhr.responseText);
			}
		});
	}

	// 이미지 파일 입력 클릭 트리거
	function openImageFile() {
		$('#imageFile').click();
	}

	// 이미지 미리보기 처리
	function onBannerImageChange(input) {
		const file = input.files[0];
		if (!file)
			return;

		const reader = new FileReader();
		reader.onload = function(e) {
			$('#logoPreview').attr('src', e.target.result).removeClass(
					'd-none');
			$('#logoPlaceholder').hide();
		};
		reader.readAsDataURL(file);
	}

	// 배너 이미지 등록 AJAX
	function submitBanner() {
		if (!validatelogoForm())
			return;

		const formData = new FormData(document.getElementById('logoForm'));

		$.ajax({
			url : '/store/seller/manage/editstore/info/logo',
			type : 'POST',
			data : formData,
			processData : false,
			contentType : false,
			success : function(res) {
				if (res.status === 'ok') {
					alert(res.msg);
				} else {
					alert(res.msg);
				}
			},
			error : function(xhr) {
				alert('등록 중 오류가 발생했습니다.');
			}
		});
	}

	// 배너 등록 폼 유효성 검사
	function validatelogoForm() {
		if (!$('#imageFile').val()) {
			alert('이미지를 선택해주세요.');
			return false;
		}
		return true;
	}
</script>
