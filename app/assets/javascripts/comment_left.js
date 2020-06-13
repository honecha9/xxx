$(function(){
  function buildHTML(comment){
    var html = `
      <div class="text_chat_left">
        ${comment.textb}
      </div>`
    return html;
  }
  $('.new_comment2').on('submit', function(e){
      e.preventDefault()
      var formData = new FormData(this);
      var url = $(this).attr('action');
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType:  false
     })
     .done(function(left){
      var html = buildHTML(left);
      $('.text_chat').append(html);
      $('.text').animate({ scrollTop: $('.text')[0].scrollHeight});
      $('.new_comment2')[0].reset();
    })
    .fail(function(){
      alert("メッセージ送信に失敗しました。");
    })
    .always(function(){
      $('.form_in_left_submit').prop('disabled', false);
    });

  });
});