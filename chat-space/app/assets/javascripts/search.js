$(function() {

  var search_list = $("#user-search-result");

  function appendUser(user) {
     var html = `<div class='chat-group-user'>${user.name}</div>`
     search_list.append(html);
    }

  function appendNoUser(user) {
    var html = `<div class='chat-group-user'>そのユーザーは存在しません</div>`
    search_list.append(html);
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
      if (users.length !== 0) {
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
});
