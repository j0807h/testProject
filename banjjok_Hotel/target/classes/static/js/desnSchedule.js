/**
 * 
 */

function otherMonth(year, month) {
	// 문자를 숫자로 변환
	year *= 1;
	month *= 1;
	if(month == 12){
		year = year + 1;
		month = 0;
	}
	if(month == -1) {
		year = year - 1;
		month = 11;
	}
	$('#content-calendar').load('otherMon', {"year" : year, "month" : month});
	console.log(year, month);
}

function change(code, status, year, month, date){
	status = {
			type : "post"
			,url : "changeSt"
			,dataType : "text"
			,data : { "reservCode" : code , "status" : status }
			,success : function(result){
				if(result == 1) alert('처리가 완료되었습니다.');
				getList(year, month, date);
				location.href='/salon/desn/reserveInfo?reservCode=' + code;
			}
			,errors : function(){alert('다시 시도해주세요.');}
	};
	$.ajax(status);
}
function getList(year, month, date) {
	console.log(year, month, date);
	$('#list-area').load('dateReserve', {"year" : year, "month" : month, "date" : date});
//	showList = {
//			type : "post"
//			,url : "dateReserve"
//			,dataType : "html"
//			,data : {
//				"year" : year
//				,"month" : month
//				,"date" : date
//			}
//			,success : function(data) {
//				console.log('실행');
//				$('.list-area').load(data);
//			}
//			,errors : function() {
//				alert('에러');
//			}
//	};
//	$.ajax(showList);
}
function init(){
	
}

init();