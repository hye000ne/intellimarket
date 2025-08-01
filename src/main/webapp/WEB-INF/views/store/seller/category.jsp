<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>

<!-- Content -->
<div class="content-wrapper">
	<!-- Content Header -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">카테고리 선택</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">
							<a href="#">Home</a>
						</li>
						<li class="breadcrumb-item active">상품 관리 > 카테고리 연결</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!-- /.content-header -->

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid d-flex justify-content-center">
			<div class="card card-outline card-primary" style="width: 800px;">
				<div class="card-header">
					<h3 class="card-title">
						<i class="fas fa-tags"></i> 상품 카테고리 선택
					</h3>
				</div>

				<!-- 카테고리 선택 폼 -->
				<form id="categoryForm">
					<div class="card-body">
						<!-- 선택된 상품 카테고리 중복 메시지 (상단에 표시) -->
						<div class="form-group row">
							<div class="col-sm-12">
								<div class="alert alert-info" role="alert">
									<i class="fas fa-info-circle"></i> <strong>선택된 카테고리:</strong> 상품 카테고리 연결을 위해 최대 00개 까지 지정할 수 있습니다.
								</div>
							</div>
						</div>

						<!-- 대분류 선택 -->
						<div class="form-group row">
							<label class="col-sm-3 col-form-label" for="rootCategory"> <i class="fas fa-layer-group"></i> 대분류
							</label>
							<div class="col-sm-9">
								<select class="form-control" id="rootCategory" name="rootCategory" required>
									<option value="">대분류를 선택하세요</option>
									<!-- DB에서 가져온 대분류 목록이 여기에 동적으로 추가됩니다 -->
									<c:forEach items="${rootCategories}" var="rootCategory">
										<option value="${rootCategory.rootCategoryId}">${rootCategory.categoryName}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<!-- 중분류 선택 -->
						<div class="form-group row">
							<label class="col-sm-3 col-form-label" for="topCategory"> <i class="fas fa-list-ul"></i> 중분류
							</label>
							<div class="col-sm-9">
								<select class="form-control" id="topCategory" name="topCategory" disabled required>
									<option value="">중분류를 선택하세요</option>
									<!-- 대분류 선택 후 동적으로 옵션이 추가됩니다 -->
								</select>
							</div>
						</div>

						<!-- 소분류 선택 -->
						<div class="form-group row">
							<label class="col-sm-3 col-form-label" for="subCategory"> <i class="fas fa-tags"></i> 소분류
							</label>
							<div class="col-sm-9">
								<select class="form-control" id="subCategory" name="subCategory" disabled required>
									<option value="">소분류를 선택하세요</option>
									<!-- 중분류 선택 후 동적으로 옵션이 추가됩니다 -->
								</select>
							</div>
						</div>

						<!-- 선택된 카테고리 표시 영역 -->
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">선택된 카테고리</label>
							<div class="col-sm-9">
								<div id="selectedCategoriesDisplay" class="border rounded p-3" style="min-height: 100px; background-color: #f8f9fa;">
									<small class="text-muted">선택된 카테고리가 여기에 표시됩니다.</small>
									<!-- 선택된 카테고리들이 태그 형태로 표시 -->
									<div id="categoryTags"></div>
								</div>
							</div>
						</div>

						<!-- 카테고리 추가 버튼 -->
						<div class="form-group row">
							<div class="col-sm-12 text-center">
								<button type="button" id="addCategoryBtn" class="btn btn-success btn-sm" disabled>
									<i class="fas fa-plus"></i> 카테고리 추가
								</button>
							</div>
						</div>
					</div>

					<!-- 폼 하단 버튼 -->
					<div class="card-footer text-center">
						<button type="button" onclick="handleActionBtnClick('save')" class="btn btn-primary">
							<i class="fas fa-save"></i> 저장
						</button>
						<button type="button" onclick="handleActionBtnClick('cancel')" class="btn btn-secondary">
							<i class="fas fa-times"></i> 취소
						</button>
					</div>
				</form>
			</div>
		</div>
	</section>
</div>

<script>
// 전역 변수 선언
let selectedCategories = []; // 선택된 카테고리들을 저장하는 배열

$(document).ready(function() {
    // 페이지 로드 시 기존 선택된 카테고리가 있다면 표시
    loadExistingCategories();
    
    // 대분류 변경 이벤트
    $('#rootCategory').on('change', function() {
        const rootCategoryId = $(this).val();
        
        // 중분류, 소분류 초기화
        resetCategory('topCategory');
        
        
        resetCategory('subCategory');
        
        if (rootCategoryId) {
            // 대분류가 선택되면 중분류 목록을 가져옴
            loadtopCategories(rootCategoryId);
        }
    });
    
    // 중분류 변경 이벤트
    $('#topCategory').on('change', function() { 
        const topCategoryId = $(this).val();
        
        // 소분류 초기화
        resetCategory('subCategory');
        
        if (topCategoryId) {
            // 중분류가 선택되면 소분류 목록을 가져옴
            loadSubCategories(topCategoryId);
        }
    });
    
    // 소분류 변경 이벤트
    $('#subCategory').on('change', function() {
        const subCategoryId = $(this).val();
        
        if (subCategoryId) {
            // 모든 카테고리가 선택되면 추가 버튼 활성화
            $('#addCategoryBtn').prop('disabled', false);
        } else {
            $('#addCategoryBtn').prop('disabled', true);
        }
    });
    
    // 카테고리 추가 버튼 클릭 이벤트
    $('#addCategoryBtn').on('click', function() {
        addSelectedCategory();
    });
});

/**
 * 기존에 선택된 카테고리들을 로드하여 표시
 */
function loadExistingCategories() {
    // 서버에서 기존 선택된 카테고리 정보를 가져와서 표시
    // 예: AJAX로 기존 카테고리 정보 로드
    <c:if test="${not empty existingCategories}">
        <c:forEach items="${existingCategories}" var="category">
            selectedCategories.push({
                rootId: '${category.rootCategoryId}',
                rootName: '${category.rootCategoryName}',
                topId: '${category.topCategoryId}',
                topName: '${category.topCategoryName}',
                subId: '${category.subCategoryId}',
                subName: '${category.subCategoryName}'
            });
        </c:forEach>
        updateCategoryDisplay();
    </c:if>
}

/**
 * 선택박스 초기화 및 비활성화
 * @param {string} categoryType - 초기화할 카테고리 타입
 */
 function resetCategory(categoryType) {
	    let selector = '';

	    if (categoryType === 'topCategory') {
	        selector = '#topCategory';
	    } else if (categoryType === 'subCategory') {
	        selector = '#subCategory';
	    } else if (categoryType === 'rootCategory') {
	        selector = '#rootCategory';
	    } else {
	        // 필요에 따라 추가
	        console.warn('Unknown categoryType:', categoryType);
	        return; // 예외 처리
	    }

	    $(selector)
	        .empty()
	        .append('<option value="">선택하세요</option>')
	        .prop('disabled', true);

	    $('#addCategoryBtn').prop('disabled', true);
	}

/**
 * 대분류 선택에 따른 중분류 목록 로드
 * @param {string} rootCategoryId - 선택된 대분류 ID
 */
function loadtopCategories(rootCategoryId) {
    $.ajax({
        type: 'GET',
        url: '/store/seller/manage/editstore/category/top',
        data: { rootCategoryId: rootCategoryId },
        success: function(response) {
            if (response.status === 'ok' && response.topCategories.length > 0) {
                const topSelect = $('#topCategory');
                topSelect.empty().append('<option value="">중분류를 선택하세요</option>');
                
                // 중분류 옵션 추가
               $.each(response.topCategories, function(index, category) {
			    var option = document.createElement('option');
			    option.value = category.topCategoryId;
			    option.text = category.categoryName;
			    $('#topCategory').append(option);
			});
                topSelect.prop('disabled', false);
            } else {
                alert('중분류 정보를 불러오는데 실패했습니다.');
            }
        },
        error: function() {
            alert('서버 통신 중 오류가 발생했습니다.');
        }
    });
}

/**
 * 중분류 선택에 따른 소분류 목록 로드
 * @param {string} topCategoryId - 선택된 중분류 ID
 */
function loadSubCategories(topCategoryId) {
    $.ajax({
        type: 'GET',
        url: '/store/seller/manage/editstore/category/sub',
        data: { topCategoryId: topCategoryId },
        success: function(response) {
            if (response.status === 'ok' && response.subCategories.length > 0) {
                const subSelect = $('#subCategory');
                subSelect.empty().append('<option value="">소분류를 선택하세요</option>');
                
                // 소분류 옵션 추가
                $.each(response.subCategories, function(index, category) {
					var option = document.createElement('option');
					option.value = category.subCategoryId;
					option.text = category.categoryName;
					$('#subCategory').append(option);
                });
                subSelect.prop('disabled', false);
            } else {
                alert('소분류 정보를 불러오는데 실패했습니다.');
            }
        },
        error: function() {
            alert('서버 통신 중 오류가 발생했습니다.');
        }
    });
}

/**
 * 선택된 카테고리를 배열에 추가
 */
function addSelectedCategory() {
    const rootCategoryId = $('#rootCategory').val();
    const rootCategoryName = $('#rootCategory option:selected').text();
    const topCategoryId = $('#topCategory').val();
    const topCategoryName = $('#topCategory option:selected').text();
    const subCategoryId = $('#subCategory').val();
    const subCategoryName = $('#subCategory option:selected').text();
    
    // 유효성 검사
    if (!rootCategoryId || !topCategoryId || !subCategoryId) {
        alert('모든 카테고리를 선택해주세요.');
        return;
    }
    
    // 최대 개수 제한 체크
    if (selectedCategories.length >= 20) {
        alert('최대 20개의 카테고리까지만 선택할 수 있습니다.');
        return;
    }
    
    // 중복 체크
    const isDuplicate = selectedCategories.some(category => 
        category.subId === subCategoryId
    );
    
    if (isDuplicate) {
        alert('이미 선택된 카테고리입니다.');
        return;
    }
    
    // 선택된 카테고리 배열에 추가
    selectedCategories.push({
        rootId: rootCategoryId,
        rootName: rootCategoryName,
        topId: topCategoryId,  
        topName: topCategoryName,
        subId: subCategoryId,
        subName: subCategoryName
    });
    
    // 화면 업데이트
    updateCategoryDisplay();
    
    // 폼 초기화
    resetForm();
    
    alert('카테고리가 추가되었습니다.');
}

 /**
  * 선택된 카테고리 표시 영역 업데이트
  */
  function updateCategoryDisplay() {
	    const selectedCategoriesDisplay = $('#selectedCategoriesDisplay');

	    if (selectedCategories.length === 0) {
	        selectedCategoriesDisplay.html('<small class="text-muted">선택된 카테고리가 여기에 표시됩니다.</small>');
	        return;
	    }

	    selectedCategoriesDisplay.html('<div id="categoryTags"></div>');
	    const freshCategoryTags = $('#categoryTags');

	    selectedCategories.forEach(function(category, index) {
	        var categoryTag = '<span class="badge badge-primary mr-2 mb-2" style="font-size: 0.9em;">' +
	            category.rootName + ' &gt; ' + category.topName + ' &gt; ' + category.subName +
	            '<button type="button" class="btn btn-sm ml-1" onclick="removeCategory(' + index + ')" style="border:none; background:none; color:white; padding:0;">' +
	            '<i class="fas fa-times"></i>' +
	            '</button>' +
	            '</span>';
	        freshCategoryTags.append(categoryTag);
	    });

	}



 /**
  * 선택된 카테고리 제거
  * @param {number} index - 제거할 카테고리의 인덱스
  */
 function removeCategory(index) {
     if (confirm('선택된 카테고리를 제거하시겠습니까?')) {
         selectedCategories.splice(index, 1);
         updateCategoryDisplay();
     }
 }


/**
 * 카테고리 선택 폼 초기화
 */
function resetForm() {
    $('#rootCategory').val('');
    resetCategory('topCategory');
    resetCategory('subCategory');
}

/**
 * 폼 유효성 검사
 */
function validateCategoryForm() {
    if (selectedCategories.length === 0) {
        alert('최소 하나의 카테고리를 선택해주세요.');
        return false;
    }
    
    return true;
}

/**
 * 액션 버튼 클릭 처리
 * @param {string} action - 수행할 액션 ('save' 또는 'cancel')
 */
function handleActionBtnClick(action) {
    if (action === 'save') {
        // 저장 처리
        if (!validateCategoryForm()) return;
        
        submitCategoryForm();
    } else if (action === 'cancel') {
        // 취소 처리
        if (confirm('작업을 취소하시겠습니까? 변경사항이 저장되지 않습니다.')) {
            // 이전 페이지로 이동 또는 목록 페이지로 이동
            location.href = '#';
        }
    }
}

/**
 * 카테고리 정보 저장
 */
 function submitCategoryForm() {
	    if (!validateCategoryForm()) return;

	    // 선택된 카테고리 배열에서 subId만 뽑아서 새로운 배열 생성
	    const subCategoryIds = selectedCategories.map(function(category) {
	        return category.subId;
	    });

	    $.ajax({
	        type: 'POST',
	        url: '/store/seller/manage/editstore/category/apply',
	        contentType: 'application/json',
	        dataType: 'json', // 서버가 JSON을 반환한다고 명시
	        data: JSON.stringify({
	            subCategories: subCategoryIds
	        }),
	        success: function(response) {
	            if (response.status === 'ok') {
	                alert('카테고리 정보가 성공적으로 저장되었습니다.');
	                // location.href = '/admin/product/list'; // 필요시 이동
	            } else {
	                alert('저장 중 오류가 발생했습니다: ' + response.message);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("AJAX Error:", status, error);
	            alert("서버 통신 중 오류가 발생했습니다.");
	        }
	    });
}
</script>
