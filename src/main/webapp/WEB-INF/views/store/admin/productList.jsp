<%@page import="com.intellimarket.store.domain.TopCategory"%>
<%@page import="com.intellimarket.store.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.intellimarket.common.util.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<% 
	List<TopCategory> topList = (List)request.getAttribute("topList");
	List<Product> productList = (List)request.getAttribute("productList");
	Paging paging = (Paging)request.getAttribute("paging");
%>
<!-- Content -->
<div class="content-wrapper">

	<!-- Content Header -->
	<div class="content-header">
	  <div class="container-fluid">
	    <div class="row mb-2">
	      <div class="col-sm-6">
	        <h1 class="m-0">상품 목록</h1>
	      </div>
	      <div class="col-sm-6">
	        <ol class="breadcrumb float-sm-right">
	          <li class="breadcrumb-item"><a href="#">Home</a></li>
	          <li class="breadcrumb-item active">상품관리 > 상품목록</li>
	        </ol>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /.content-header -->
	  
	<section class="content">
	    <!-- 상위 카테고리 카드 반복 시작 -->
	    <% for (int i = 1; i < 5; i++) { %>
	        <div class="card">
	            <div class="card-header">
	                <h3 class="card-title">전자제품</h3>
	                <div class="card-tools">
	                    <div class="input-group input-group-sm" style="width: 300px;">
	                        <input
	                            type="text"
	                            name="table_search"
	                            class="form-control float-right"
	                            placeholder="Search"
	                        />
	                        <div class="input-group-append">
	                            <button type="submit" class="btn btn-default">
	                                <i class="fas fa-search"></i>
	                            </button>
	                            <button
	                                type="button"
	                                class="btn btn-tool"
	                                data-card-widget="collapse"
	                                title="Collapse"
	                            >
	                                <i class="fas fa-minus"></i>
	                            </button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	            <!-- 카드 본문 : 테이블 -->
	            <div class="card-body p-0">
	                <table class="table table-striped projects text-center">
	                    <thead>
	                        <tr>
	                            <th style="width: 8%">상품 번호</th>
	                            <th style="width: 16%">상품명</th>
	                            <th style="width: 9%">카테고리</th>
	                            <th style="width: 9%">브랜드</th>
	                            <th style="width: 9%">가격</th>
	                            <th style="width: 9%">판매 건수</th>
	                            <th style="width: 9%">재고</th>
	                            <th style="width: 8%" class="text-center">상품 상태</th>
	                            <th style="width: 20%"></th>
	                        </tr>
	                    </thead>
	
	                    <!-- 레코드 반복 시작 -->
	                    <tbody>
	                        <% for (int a = 1; a < 6; a++) { %>
	                            <tr>
	                                <td><%= i %></td>
	                                <td>
	                                    <a href="#">써큘레이터</a><br />
	                                </td>
	                                <td>가전제품</td>
	                                <td>삼성</td>
	                                <td>18,000</td>
	                                <td>19</td>
	                                <td>150</td>
	                                <td class="project-state">
	                                    <span class="badge badge-success">활성화</span>
	                                </td>
	                                <td class="project-actions text-right">
	                                    <a class="btn btn-primary btn-sm" href="#">
	                                        <i class="fas fa-folder"></i> 상세
	                                    </a>
	                                    <a class="btn btn-info btn-sm" href="#">
	                                        <i class="fas fa-pencil-alt"></i> 수정
	                                    </a>
	                                    <a class="btn btn-danger btn-sm" href="#">
	                                        <i class="fas fa-trash"></i> 삭제
	                                    </a>
	                                </td>
	                            </tr>
	                        <% } %>
	                    </tbody>
	                    <!-- 레코드 반복 끝 -->
	
	                </table>
	            </div>
	        </div>
	    <% } %>
	    <!-- 상위 카테고리 카드 반복 끝 -->
	</section>
</div>