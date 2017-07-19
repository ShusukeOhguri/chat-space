$(function(){
  function buildHTML(message){
    var text = ""
    if (message.text !== ""){ var text = `${message.text}` }

    var image = ""
    if (message.image.url !== null){ var image = `<img src ="${message.image.url}">` }

    var html = `<div class = "message_box clearfix">
                  <div class = "speakers_box">
                    <div class = "speaker">
                      ${message.user_name}
                    </div>
                    <div class = "when_speaking">
                      ${message.created_at}
                    </div>
                  </div>
                    <span class = "message">
                      ${image}
                    </span>
                    <span class = "message">
                      ${text}
                    </span>
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


