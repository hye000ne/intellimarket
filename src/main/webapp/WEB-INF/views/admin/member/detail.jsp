<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<div class="content-wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<h1 class="mb-2">회원 상세</h1>
		</div>
	</section>

	<section class="content">
		<div class="container-fluid d-flex justify-content-center">
			<div class="card card-outline card-primary" style="width: 800px;">
				<div class="card-header">
					<h3 class="card-title">회원 정보</h3>
				</div>
				<div class="card-body">
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">이메일</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" value="_hye_one@hanmail.net" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" value="박혜원" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">생년월일</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" value="1997-12-12" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">연락처</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" value="01063954201" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">성별</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" value="여자" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">상태</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" value="ACTIVE" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">우편번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" value="12917" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">주소</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" value="경기 하남시 미사강변대로 95" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">상세주소</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" value="123" readonly>
						</div>
					</div>
				</div>
				<div class="card-footer text-center">
					<a href="/admin/member/list" class="btn btn-secondary">목록</a>
				</div>
			</div>
		</div>
	</section>
</div>
