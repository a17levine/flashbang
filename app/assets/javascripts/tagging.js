var tags = [];

var updateHiddenInputWithTagChange = function (event, ui) {
  var tags = [];
  $(".tagit-label").each(function(i,v){tags.push($(v).text())})

  if (tags.length > 0){
    $("#post_tags").attr("value", JSON.stringify(tags));
  }
};


$("#mytags").ready(function() {
  $("#mytags").tagit({
    afterTagRemoved: updateHiddenInputWithTagChange,
    afterTagAdded: updateHiddenInputWithTagChange
  });
});