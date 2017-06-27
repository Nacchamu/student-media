$(function() {
  function buildHTML(data){
    var thumbnail = $('<a href="/articles/' + data.id + '"><img class="article__image" src="' + data.thumbnail.url + '">');
    var title = $('<div class="article__texts">').append('<div class="article__texts__title-box">').append('<a href="/articles/' + data.id + '" class="article__texts__title-link"><p class="article__texts__title">' + data.title);
    var text = $(title).append('<div class="article__texts__text">' + data.text).append('<a href="/mypages/' + data.userid + '">').append('<p class="article__texts__date">' + data.created_at).append('<a href="/articles/' + data.id + '"><p class="article__texts__readmore">READ MORE');
    var article = $('<div class="article">').append(thumbnail).append(text);
    $('.body__left').append(article);
  }
  $('.search').keypress(function(e){
    var input = $('.search').val();
    if ( e.which == 13 ) {
      $.ajax({
        type:'GET',
        url: '/search',
        data: {
          title: input
        },
        dataType: 'json'
      })
      .done(function(data) {
        $('.body__left').empty();
        $(data).each(function(index, ele){
          buildHTML(ele);
        })
      })
      .fail(function() {
      })
      return false;
    }
  });
});