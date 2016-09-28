$(document).ready(function(e) {
	$(document).on("click", "#add_bill", function(e) {
		sendAjaxWithCustomData("bill_events/new", {}, "GET");
	});

	$(document).on("click", "#bill_event_submit_btn", function(e) {
		e.preventDefault();
		validateBillForm();
	});

	$(document).on("click", ".presentee_check_box", function(e){
		var checkbox = $(e.target);
		var userId = checkbox.attr("user_id");
		if (checkbox.prop('checked')) {
			$("#presentee_" + userId + "_contribution").val(0).show();
		} else {
			$("#presentee_" + userId + "_contribution").hide();
		}
	});

	$(document).on("click", "#bill_event_cancel_btn", function(e) {
		$("#bill_event_form").hide();
		$("#add_bill").show();
	});
});

function validateBillForm() {
	var totalBillAmt = $("#total_bill_amt").val();
	if (totalBillAmt == '' || totalBillAmt == 0) {
		alert("Total bill amount is required & should be greater than zero?");
	} else {
		if (($(".presentee_check_box:checked").length) < 2 ) {
			alert("Atleast 2 presentees should be there to add bill event.");
		} else {
			var totalAddedContri = getTotalContri();
			if (parseFloat(totalBillAmt) != parseFloat(totalAddedContri)) {
				alert("Total billing amount should be equal to total contribution from all");
			} else {
				$("#form_bill_event").submit();
			}

		}
	}
}

function getTotalContri() {
	var totalContri = parseFloat($("#presentee_1_contribution").val()) + parseFloat($("#presentee_2_contribution").val()) + parseFloat($("#presentee_3_contribution").val());
	return totalContri;
}