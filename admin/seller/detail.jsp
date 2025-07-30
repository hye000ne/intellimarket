<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<div class="content-wrapper">
	<section class="content-header">
		<div class="container-fluid">
	        <div class="row mb-2">
	            <div class="col-sm-12">
	                <ol class="breadcrumb float-sm-right">
	                    <li class="breadcrumb-item">판매자 관리</li>
						<li class="breadcrumb-item active">판매자 상세</li>
	                </ol>
	            </div>
	        </div>
	    </div>
	</section>

	<section class="content">
		<div class="container-fluid d-flex justify-content-center">
			<div class="card card-outline card-primary" style="width: 800px;">
				<div class="card-header">
					<h3 class="card-title">판매자 정보</h3>
				</div>
				<form id="updateForm">
					 <input type="hidden" id="sellerId" name="sellerId" value="${seller.sellerId}">
					 
					<div class="card-body">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">이메일</label>
							<div class="col-sm-9">
								<input type="email" class="form-control" id="email" name="email" value="${seller.email}" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">이름</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="name" name="name" value="${seller.name}" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">생년월일</label>
							<div class="col-sm-9">
								<input type="date" class="form-control" id="birth" name="birth" value="${seller.birth}" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">연락처</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="tel" name="tel" value="${seller.tel}" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">상태</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="status" name="status" value="${seller.status}" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">우편번호</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="zipCode" name="zipCode" value="${seller.zipCode}" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">주소</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="address" name="address" value="${seller.address}" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">상세주소</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="detailAddress" name="detailAddress" value="${seller.detailAddress}" readonly>
							</div>
						</div>
					</div>
					<div class="card-footer text-center">
						<button type="button" onclick="goListPage()" class="btn btn-secondary btn">목록</button>
					</div>
				</form>
			</div>
		</div>
	</section>
</div>

<script>
	function goListPage(){
		location.href = '/admin/seller/list';
	}
</script>
