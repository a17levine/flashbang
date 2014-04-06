$("#mytags").ready(function() {
  $("#mytags").tagit({

  // // This is for AJAX stuff - not there yet

  //   tagSource: function(search, showChoices) {
  //     var that = this;
  //     $.ajax({
  //       url: "/tags/autocomplete.json",
  //       data: {q: search.term},
  //       success: function(choices) {
  //         showChoices(that._subtractArray(choices, that.assignedTags()));
  //       }
  //     });
  //   },
  //   show_tag_url: "#{tags_path}/",
  //   singleField: true,
  //   singleFieldNode: $('#submit_tag_names')
  });
});