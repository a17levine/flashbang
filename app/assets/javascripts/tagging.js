var tags = [];	

var handleHelperText = function (){
	if ($("#post_tag_list").attr("value") == ""){
		$('input.ui-autocomplete-input').attr('placeholder', 'ex. #bike, #schwinn');	
	}else{
		$('input.ui-autocomplete-input').attr('placeholder', "");
	}
	
}

var updateHiddenInputWithTagChange = function (event, ui) {
  tags = [];
  $(".tagit-label").each(function(i,v){tags.push($(v).text())})
  $("#post_tag_list").attr("value", tags.toString());
  handleHelperText();
  // console.log($("#post_tag_list").attr("value"))
};


$("#mytags").ready(function() {
  $("#mytags").tagit({
    afterTagRemoved: updateHiddenInputWithTagChange,
    afterTagAdded: updateHiddenInputWithTagChange
  });
  handleHelperText();
});

