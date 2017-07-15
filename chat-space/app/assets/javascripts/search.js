$(function() {
  var search_list = $("#user-search-result");

  function appendUser(user) {
    var html = `<div class='chat-group-user' id='user-${user.id}'>
                  ${user.name}
                  <a class="chat-group-user__btn chat-group-user__btn--add" title='${user.name}' id='${user.id}' >
                    追加
                  <a/>
                </div>`
    search_list.append(html);
  }

  function appendNoUser(user) {
    var html = `<div class='chat-group-user'>そのユーザーは存在しません</div>`
    search_list.append(html);
  }

  function appendGroup(name, id) {
    var html =`
                <div class='chat-group-user clearfix js-chat-member'>
                  <input name='group[user_ids][]' type='hidden' value='${id}'>
                  <p class='chat-group-user__name'>${name}</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn' id='${id}'>削除</a>
                </div>
              `
    $(".append-group-member").append(html);
  }

  $('.chat-group-form__input').change(function() {
    isChange = true;
    var input = $(".chat-group-form__input").val();

    $.ajax({
      type: 'GET',
      url: "/users/search",
      data: { name: input },
      dataType: 'json'
    })

    .done(function(users) {
      $("#user-search-result").empty();
      if (users.length != 0) {
        users.forEach(function(user){
          appendUser(user);
        });
      }
      else {
        $("#user-search-result").empty();
        appendNoUser(users);
      }
    })

    .fail(function(users) {
      alert('ユーザー検索に失敗しました');
    })
  })

  $('#user-search-result').on('click','.chat-group-user__btn--add',function() {
    var name = $(this).attr("title");
    var id = $(this).attr("id");
    appendGroup(name, id)
    $(this).parent(".chat-group-user").remove()
  })

  $('.append-group-member').on('click','.chat-group-user__btn--remove', function() {
    $(this).parent(".chat-group-user").remove()
  })
})
