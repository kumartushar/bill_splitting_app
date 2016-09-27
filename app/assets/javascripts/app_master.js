$(document).ready(function(e) {
	$(document).on("click", "#add_bill", function(e) {
		sendAjaxWithCustomData("bill_events/new", {}, "GET");
	});
});