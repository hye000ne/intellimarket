/* ===================== 쇼핑몰 로딩바 제어 ===================== */
function showLoading() {
  $('#preloader-active').show();
  $('body').css('overflow', 'hidden');
}

function hideLoading() {
  $('#preloader-active').fadeOut(300, function () {
    $(this).css('display', 'none');
    $('body').css('overflow', 'visible');
  });
}
