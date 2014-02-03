$( window ).load(function() {
  var m_length = $('#micropost_content').val().length;
  $(".char_left").html((140-m_length)+" characters left");
  $('#micropost_content').keydown(function(e) {
      var $this = $(this);
      setTimeout(function() {
          var text = $this.val();
          if (text.length != 140){
            $(".char_left").html((140-text.length)+" characters left");
          }else {
            $(".char_left").html("0 characters left");
          }
          
      }, 0);
  });
});

