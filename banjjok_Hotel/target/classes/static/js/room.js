/**
 * 
 */
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

function getPetName(petId) {
	document.getElementsByName('petId')[0].value = petId;
}

function getId(sitterId){
	
	document.getElementsByName('sitterId')[0].value = sitterId;
}

//function getId(sitterId, sitterName, btn){
//	var year = $('input:hidden[name="year"]').val();
//	var month = $('input:hidden[name="month"]').val();
//	var date = $('input:radio[name="date"]:checked').val();
//	var time = $(btn).val();
//	var data = {
//			"desnId" : desnId
//			,"year" : year
//			,"month" : month
//			,"date" : date
//			,"time" : time
//		};
//	isReserved = {
//			type : "post"
//			,url : "isReserve"
//			,data : data
//			,dataType : "text"
//			,success : function(result){
//				if(result != 0) {
//					alert('이미 예약된 시간입니다.\n다른 시간을 선택해주세요.');
//					$(btn).attr('checked', false);
//				} else {
//					document.getElementsByName('desnId')[0].value = desnId;
//					document.getElementsByName('desnName')[0].value = desnName;
//				}
//			}
//			,error : function() {}
//	};
//	$.ajax(isReserved);
//}

function send(){
	if(document.getElementsByName('petId')[0].value.trim() == "") {
		alert('펫을 선택해주세요.');
		return false;
	} 
	if(document.getElementsByName('sitterId')[0].value.trim() == "") {
		alert('펫시터를 선택해주세요.');
		return false;
	} 
	if(document.getElementsByName('chkInDate')[0].value.trim() == "") {
		alert('체크인 날짜를 선택해주세요.');
		return false;
	} 
	if(document.getElementsByName('chkOutDate')[0].value.trim() == "") {
		alert('체크아웃 날짜를 선택해주세요.');
		return false;
	} 
}

function frmSend(){
	if(document.getElementById('roomPw').value.trim() =="" ){
		alert('비밀번호를 입력하세요');
		document.getElementById('roomPw').focus();
		return false;
		
	}
	
}

function roomDelete(){
	if(confirm('객실을 삭제하시겠습니까?')){
		//비밀번호
		if (document.getElementById('roomPw').value.trim() == "") {
			alert('비밀번호를 입력하세요.');
			document.getElementById('roomPw').focus();
			return false;
		}
		document.frm.action = "/hotel/roomDel";
		frm.submit();
	}
}


// Script to open and close sidebar when on tablets and phones
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}

// Slideshow Apartment Images
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
  }
  x[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " w3-opacity-off";
}