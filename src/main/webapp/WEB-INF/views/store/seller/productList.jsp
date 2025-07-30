<%@page import="java.util.Map"%>
<%@page import="com.intellimarket.store.domain.TopCategory"%>
<%@page import="com.intellimarket.store.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.intellimarket.common.util.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<% 
	Map<TopCategory, List<Product>> productMap = (Map<TopCategory, List<Product>>) request.getAttribute("productMap");
%>
<%
    System.out.println("productMap = " + productMap);
    if (productMap != null) {
        System.out.println("productMap size = " + productMap.size());
    } else {
        System.out.println("productMap is null");
    }
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
		<% for (Map.Entry<TopCategory, List<Product>> entry : productMap.entrySet()) { 
			TopCategory top = entry.getKey();
	    	List<Product> list = entry.getValue();
		%>
	        <div class="card">
	            <div class="card-header">
	                <h3 class="card-title"><%= top.getCategoryName() %></h3>
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
	                        <% for (Product p : list) { %>
	                            <tr>
	                                <td><%= p.getProductId() %></td>
	                                <td>
	                                    <a href="#"><%= p.getProductName()%> </a><br/>
	                                </td>
	                                <td><%= p.getSubCategory().getCategoryName() %></td>
	                                <td><%= p.getBrandName() %></td>
	                                <td><%= p.getPrice() %></td>
	                                <td><%= p.getSalesCount() %></td>
	                                <td><%= p.getProductStock() %></td>
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