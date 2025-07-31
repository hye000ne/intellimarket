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
		<div class="container-fluid d-flex justify-content-center">
			<div class="card card-outline card-primary" style="width: 800px;">
				<form id="bannerForm" enctype="multipart/form-data">
					<div class="card-body">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">제목</label>
							<div class="col-sm-9">
								<input type="text" name="title" id="title" class="form-control" required>
							</div>
						</div>

						<div class="form-group row">
							<label class="col-sm-3 col-form-label">배너 이미지</label>
							<div class="col-sm-9">
								<input type="file" name="imageFile" id="imageFile" class="form-control" accept="image/*">
							</div>
						</div>

						<div class="form-group row">
							<label class="col-sm-3 col-form-label">노출 여부</label>
							<div class="col-sm-9">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="isVisible" id="visibleY" value="Y" checked>
									<label class="form-check-label" for="visibleY">Y</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="isVisible" id="visibleN" value="N">
									<label class="form-check-label" for="visibleN">N</label>
								</div>
							</div>
						</div>

						<div class="form-group row">
							<label class="col-sm-3 col-form-label">링크 URL</label>
							<div class="col-sm-9">
								<input type="text" name="linkUrl" id="linkUrl" class="form-control" placeholder="http:// 또는 /path 형식">
							</div>
						</div>
					</div>

					<div class="card-footer text-center">
						<button type="button" class="btn btn-primary" onclick="handleBannerForm('save')">저장</button>
						<button type="button" class="btn btn-secondary" onclick="handleBannerForm('list')">목록</button>
					</div>
				</form>
			</div>
		</div>
	</section>
</div>

<script>
	function handleBannerForm(action) {
		if (action === 'list') {
			location.href = '/admin/market/banner/list';
			return;
		}
		
		if (!validateBannerForm()) return;

		$.ajax({
			url: '/admin/market/banner/regist',
			type: 'POST',
			data: $("#bannerForm").serialize(),
			success: function(res) {
				if (res.status === 'ok') {
					alert(res.msg);
					location.href = '/admin/market/banner/list';
				}
			},
			error: function(xhr) {
				alert('등록 중 오류가 발생했습니다.');
			}
		});
	}

	function validateBannerForm() {
		if (!$('#title').val()) {
			alert('제목을 입력해주세요.');
			return false;
		}

		if (!$('#imageFile').val()) {
			alert('이미지를 선택해주세요.');
			return false;
		}
		
		if (!$('[name="isVisible"]').is(':checked')) {
		  	alert('노출기간을 선택해주세요.');
		  	return false;
		}

		return true;
	}
</script>
