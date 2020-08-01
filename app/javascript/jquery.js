$(function(){
  
  $('#flash').hide().slideDown("slow");
  setTimeout(function(){
    $('#flash').slideUp();
},2000);
  $('.top1').hide().fadeIn(2000);
  

  $('.tab').click(function(){
    $('.is-active').removeClass('is-active');
    $(this).addClass('is-active');
    $('.is-show').removeClass('is-show');
        // クリックしたタブからインデックス番号を取得
    const index = $(this).index();
        // クリックしたタブと同じインデックス番号をもつコンテンツを表示
    $('.follow-tweet').eq(index).addClass('is-show');
  });




  
  
  
});

