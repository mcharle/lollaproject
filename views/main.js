:javascript
  $('.band .vote').click(function(event) {
    $button = $(event.currentTarget);
    $voteCount = $button.siblings('.votes');
    $bandName = $button.siblings('.name');
    
    $.post('/post', {band_name: $bandName}, function(data) {
      $voteCount.text(data.votes);
    });
  });