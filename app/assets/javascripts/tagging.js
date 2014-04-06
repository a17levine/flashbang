var tags = [];

var updateHiddenInputWithTagChange = function (event, ui) {
  // console.log(ui.tag.text().slice(0, -1));
  tags.push(ui.tag.text().slice(0, -1))
  console.log("Tags array is:");
  console.log(tags);
  if (tags.length > 0){
    console.log("Post tags are:");
    $("#post_tags").text(JSON.stringify(tags));
    console.log($("#post_tags").text());
  }
};


$("#mytags").ready(function() {
  $("#mytags").tagit({

    afterTagRemoved: updateHiddenInputWithTagChange,
    afterTagAdded: updateHiddenInputWithTagChange

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