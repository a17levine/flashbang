$(".new_post").ready(function() {
  $("#mytags").tagit({
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