<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>

<!-- Content -->
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
				<!-- 좌측: 상품 기본 정보 -->
				<div class="col-md-6">
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">
								<i class="fas fa-box"></i> 스토어 정보
							</h3>
						</div>
						<div class="card-body">
							<form id="editForm">
								<div class="form-row mb-4">
									<div class="form-group col-md-6">
										<label>스토어 이름</label> 
										<input type="text" class="form-control" name="storeName" placeholder="상품명을 입력하세요">
									</div>
									<div class="form-group col-md-6">
										<label>스토어 연락처(고객센터)</label> 
										<input type="text" class="form-control" name="storeTel" placeholder="브랜드명">
									</div>
									<div class="form-group col-md-6">	
										<label>스토어 로고</label> 
										<input type="text" class="form-control" name="logoPath" placeholder="브랜드명">
									</div>
									<div class="form-group col-md-6">
										<label>스토어 간단소개</label> 
									<textarea class="form-control" name="storeIntroduce" rows="2" placeholder="30자 이내로 작성하세요"></textarea>
									</div>
									<div class="col-md-12 form-group">
										<button type="button" class="btn_1 w-30" onclick="applyEditForm()">적용</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div> 
			</div>
		</div>

	</section>
</div>

<script>
// 업데이트 ajax
function applyEditForm() {
	$.ajax({
		type : 'POST',
		url : '/store/seller/manage/editstore/apply',
		data : $('#editForm').serialize(),
		success : function(res) {
			if (res.status === 'ok') {
				alert(res.msg);
				location.href = '/store/seller/manage/';
			}
		},
		error : function(xhr) {
			alert(xhr.responseText);
		}
	});
}
</script>