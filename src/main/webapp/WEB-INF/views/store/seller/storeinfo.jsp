<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>

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
						<li class="breadcrumb-item"><a href="#">Home</a></li>
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
										<label for="storeName">스토어 이름</label> <input type="text"
											class="form-control" id="storeName" name="storeName"
											value="${storeInfo.storeName}" placeholder="스토어 이름을 입력하세요" />
									</div>
									<div class="form-group col-md-6">
										<label for="storeTel">스토어 연락처(고객센터)</label> <input type="text"
											class="form-control" id="storeTel" name="storeTel"
											value="${storeInfo.storeTel}" placeholder="스토어 연락처를 입력하세요" />
									</div>
									<div class="form-group col-12">
										<label for="storeIntroduce">스토어 간단소개</label>
										<textarea class="form-control" id="storeIntroduce"
											name="storeIntroduce" rows="2" placeholder="50자 이내로 입력해주세요">${storeInfo.storeIntroduce}</textarea>
									</div>
								</div>
								<div class="form-group text-right">
									<button type="button" class="btn btn-primary"
										onclick="applyEditForm()">적용</button>
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
								<div
									class="preview-wrapper border rounded mb-3 d-flex justify-content-center align-items-center flex-column"
									style="min-width: auto; max-width: 100%">
									<img id="logoPreview" class="img-fluid mb-2" alt="로고 이미지"
										src="${empty storeInfo.logoPath ? '' : storeInfo.logoPath}"
										style="${empty storeInfo.logoPath ? 'display:none;' : ''}" />
									<p id="logoPlaceholder" class="text-muted"
										style="${empty storeInfo.logoPath ? '' : 'display:none;'}">이미지
										미리보기</p>

								</div>
								<div>
									<input type="file" id="imageFile" name="imageFile"
										accept="image/*" class="d-none"
										onchange="onLogoImageChange(this)" />
									<button type="button" class="btn btn-outline-primary"
										onclick="openImageFile()">이미지 선택</button>
								</div>
								<div class="text-right mt-3">
									<button type="button" class="btn btn-primary"
										onclick="submitBanner()">등록</button>
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

	// 이미지 선택 트리거
	function openImageFile() {
		$('#imageFile').click();
	}

	function onLogoImageChange(input) {
		  const file = input.files[0];
		  if (!file) return;

		  const reader = new FileReader();
		  reader.onload = function(e) {
		    const img = new Image();
		    img.onload = function() {
		      // 최소 / 최대 가로 세로 크기 설정 (원하는 값으로 수정하세요)
		      const minWidth = 100;   // 최소 너비(px)
		      const minHeight = 100;  // 최소 높이(px)
		      const maxWidth = 1000;  // 최대 너비(px)
		      const maxHeight = 1000; // 최대 높이(px)

		      if (
		        img.width < minWidth ||
		        img.height < minHeight ||
		        img.width > maxWidth ||
		        img.height > maxHeight
		      ) {
	    	  alert("이미지 크기는 최소 " + minWidth + "x" + minHeight + "px, 최대 " + maxWidth + "x" + maxHeight + "px 이어야 합니다.\n현재 이미지 크기: " + img.width + "x" + img.height + "px");
		        // 파일 선택 초기화
		        $(input).val('');
		        // 미리보기 초기화
		        $('#logoPreview').attr('src', '').hide();
		        $('#logoPlaceholder').show();
		        return;
		      }

		      // 크기 조건 만족 시 미리보기 출력
		      $('#logoPreview')
		        .attr('src', e.target.result)
		        .removeClass('d-none')
		        .css('display', 'block');
		      $('#logoPlaceholder').hide();
		    };
		    img.src = e.target.result;
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
