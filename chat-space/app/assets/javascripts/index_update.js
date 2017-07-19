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

  function update(intervaltime){
    var URL = $('#new_message').attr('action')
    var routes = URL + "/index_update"
    var group_id = URL.replace("/groups/", "").replace("/messages", "")
    var acquisition_start_time = (new Date().getTime() / 1000) - intervaltime

    $.ajax({
      url: routes,
      type: "GET",
      data: {update_time: acquisition_start_time, group_id: group_id},
      dataType: 'json',
      })

    .done(function(data){
      $.each(data, function(index, message) {
        var html = buildHTML(message);
      $('.message_box_area').append(html);
      })
    })

    .fail(function(){
      clearInterval(intervalID)
    })
  }

  function check_URL(intervaltime){
    var url = window.location.href
    if (url.match(/messages/)){
      update(intervaltime)
    }
    else{
    }
  }

  var intervaltime_second = 5
  var intervalID = setInterval(function(){check_URL(intervaltime_second)}, intervaltime_second*1000)

})

