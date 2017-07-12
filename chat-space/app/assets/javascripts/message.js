$(function(){
  function buildHTML(message){
    if (message.text !== ""){
      var text = `<span class = "message">
                    ${message.text}
                  </span>`
    } else {var text = ""}

    if (message.image.url !== null){
      var image = `<span class = "message">
                    <img src ="${message.image.url}">
                  </span>`
    } else{var image = ""}

    var html = `<div class = "message_box clearfix">
                  <div class = "speakers_box">
                    <div class = "speaker">
                      ${message.user_name}
                    </div>
                    <div class = "when_speaking">
                      ${message.created_at}
                    </div>
                  </div>
                    ${image}
                    ${text}
                </div>`
    return html;
  }

  $('#new_message').on('submit',function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = window.location;


    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
      })

      .done(function(data){
        var html = buildHTML(data);
        $('.message_box_area').append(html);
        $('.messagebox').val('');
        $(".send_bottun").prop("disabled", false);
      })

      .fail(function(){
        alert('error');
        $(".send_bottun").prop("disabled", false);
      })
    })
  })


