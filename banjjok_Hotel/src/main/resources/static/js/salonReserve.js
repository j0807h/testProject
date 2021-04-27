/**
 * 살롱 예약 자바스크립트
 */
var now = new Date();
var nowDate = now.getDate();
var nowDayOfWeek = now.getDay();
var nowMonth = now.getMonth();
var nowYear = now.getYear();

function preMonth(year, month) {
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
	$('#select-date').load('changeMonth', {"year" : year, "month" : month});
	console.log(year, month);
}

function getPetName(petName, weight, optFee) {
	if(4 < weight && weight <= 6) {
		document.getElementsByName('optFee')[0].value = optFee;
	} else if(6 < weight && weight <= 8) {
		document.getElementsByName('optFee')[0].value = optFee * 2;
	} else if(8 < weight && weight <= 10) {
		document.getElementsByName('optFee')[0].value = optFee * 3;
	} else if(10 < weight && weight <= 12) {
		document.getElementsByName('optFee')[0].value = optFee * 4;
	}
	document.getElementsByName('petName')[0].value = petName;
}

function send(){
	if(document.getElementsByName('petName')[0].value.trim() == "") {
		alert('펫을 선택해주세요.');
		return false;
	} 
	if(document.getElementsByName('desnId')[0].value.trim() == "") {
		alert('시간을 선택해주세요.');
		return false;
	} 
}

function getId(desnId, desnName, btn){
	var year = $('input:hidden[name="year"]').val();
	var month = $('input:hidden[name="month"]').val();
	var date = $('input:radio[name="date"]:checked').val();
	var time = $(btn).val();
	var data = {
			"desnId" : desnId
			,"year" : year
			,"month" : month
			,"date" : date
			,"time" : time
		};
	isReserved = {
			type : "post"
			,url : "isReserve"
			,data : data
			,dataType : "text"
			,success : function(result){
				if(result != 0) {
					alert('이미 예약된 시간입니다.\n다른 시간을 선택해주세요.');
					$(btn).attr('checked', false);
				} else {
					document.getElementsByName('desnId')[0].value = desnId;
					document.getElementsByName('desnName')[0].value = desnName;
				}
			}
			,error : function() {}
	};
	$.ajax(isReserved);
}


function init(nowYear, nowMonth){
//	console.log(now.getFullYear());
//	console.log(now.getMonth()+1);
//	document.getElementsByName('petId')[0].checked = 'checked';
//	preMonth();
}

function loadDesn(year, month, date) {
//	month *= 1;
//	month = month + 1;
	$('#reload-area').load('loadDesn', {"year" : year, "month" : month, "date" : date});
}


init();

