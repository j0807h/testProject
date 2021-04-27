/**
 * 
 */
//날짜 선택 표시
function loadDesn(year, month, date) {
	$('#reload-area').load('loadDesn', {"year" : year, "month" : month, "date" : date});
}