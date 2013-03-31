$(document).ready(function () {
	$('#antigas, #resolvidas').click(function (e) {
		$(this).closest('form').submit();
	});
});