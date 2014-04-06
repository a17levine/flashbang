var tags = [];

var updateHiddenInputWithTagChange = function (event, ui) {
  var tags = [];
  $(".tagit-label").each(function(i,v){tags.push($(v).text())})
  $("#post_tag_list").attr("value", tags.toString());
  console.log($("#post_tag_list").attr("value"))
};


$("#mytags").ready(function() {
  $("#mytags").tagit({
    afterTagRemoved: updateHiddenInputWithTagChange,
    afterTagAdded: updateHiddenInputWithTagChange
  });
});