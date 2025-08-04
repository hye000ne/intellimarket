<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<div class="content-wrapper">
	<section class="content-header">
		<div class="container-fluid">
	        <div class="row mb-2">
	            <div class="col-sm-12">
	                <ol class="breadcrumb float-sm-right">
	                    <li class="breadcrumb-item">스토어</li>
                    	<li class="breadcrumb-item active">스토어 상세</li>
	                </ol>
	            </div>
	        </div>
	    </div>
	</section>

	<section class="content">
		<div class="container-fluid d-flex justify-content-center">
			<div class="card card-outline card-primary" style="width: 800px;">
				<div class="card-header">
					<h3 class="card-title">스토어 정보</h3>
				</div>
				<div class="card-body">
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="storeName" name="storeName" value="${store.storeName}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">스토어 연락처</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="storeTel" name="storeTel" value="${store.storeTel}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">판매자 이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="sellerName" name="sellerName" value="${store.seller.name}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">판매자 연락처</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="sellerTel" name="sellerTel" value="${store.seller.tel}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">사업자등록번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="businessNum" name="businessNum" value="${store.seller.businessNum}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">스토어 소개</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="storeIntroduce" name="storeIntroduce" value="${store.storeIntroduce}" readonly>
						</div>
					</div>
				</div>
				<div class="card-footer text-center">
					<a href="/admin/store/list" class="btn btn-secondary btn">목록</a>
				</div>
			</div>
		</div>
	</section>
</div>