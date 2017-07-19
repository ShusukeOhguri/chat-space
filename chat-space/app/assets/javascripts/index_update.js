$(function(){
  function buildHTML(message){
    if (message.text !== ""){
      var text = `<span class = "message">
                    ${message.text}
                  </span>`
    }
    else {
      var text = ""
    }

    if (message.image.url !== null){
      var image = `<span class = "message">
                    <img src ="${message.image.url}">
                   </span>`
    }
    else {
      var image = ""
    }

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
      console.log("自動更新成功")
    })

    .fail(function(){
      console.log("自動更新失敗")
      console.log("自動更新停止")
      clearInterval(intervalID)
    })
  }

  function check_URL(intervaltime){
    var url = window.location.href
    if (url.match(/messages/)){
      console.log("自動更新します")
      update(intervaltime)
    }
    else{
      console.log("自動更新しませんでした")
    }
  }

  var intervaltime_second = 5
  var intervalID = setInterval(function(){check_URL(intervaltime_second)}, intervaltime_second*1000)

})

