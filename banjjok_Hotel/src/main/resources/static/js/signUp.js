/**
 * 
 */
function chkNum() {
	var number = {
		"number" : $('input[name="ctfNum"]').val()
	}
	if (document.getElementById('memMobile').value == "") {
		alert('핸드폰 번호를 입력해주세요.');
	} else {
		isEqual = {
			type : "post",
			url : "checkNum",
			dataType : "text",
			data : number,
			success : function(result) {
				// 0 일치 1 불일치
//				console.log(result);
				if (result == 0) {
					document.getElementsByClassName('certificate')[0].style.display = 'none';
					document.getElementById('isMChecked').value = 'y';
					alert('문자인증이 완료되었습니다.');
				} else if (result == 1) {
					document.getElementById('mobile-err').text('인증번호가 일치하지 않습니다.');
					alert('인증번호가 일치하지 않습니다.\n 다시 시도해주세요.');
				}
			},
			errors : function() {
				alert('ERROR: 다시 시도해주세요.');
			}
		};
		$.ajax(isEqual);
	}
}

function chkMobile() {
	// 문자 인증 번호 전송
	var message = {
		"mobile" : $("input[name='memMobile']").val()
	}
	sendSMS = {
		type : "post",
		url : "chkSMS",
		dataType : "text",
		data : message,
		success : function(result) {
			console.log(result);
			alert('문자가 전송되었습니다.\n 인증번호를 입력해주세요.');
		},
		errors : function() {
			alert('ERROR: 다시 시도해주세요.');
		}
	};
	$.ajax(sendSMS);
	document.getElementsByClassName('certificate')[0].style.display = 'block';
}
function isDuplicate() {
	var id = {
		userId : $("input[name='memId']").val()
	}
	if ($("input[name='memId']").val() == "") {
		alert('아이디를 입력하세요.');
	} else {
		checkId = {
			type : "post",
			url : "checkId",
			dataType : "text",
			data : id,
			success : function(isDuplicate) {
				if (isDuplicate == 0) {
					alert('사용가능한 아이디입니다.');
					$('input[name="idBtn"]').val('ok');
					$('input[name="duplicate"]').val('false');
				} else {
					alert('이미 사용중인 아이디입니다.');
					$('input[name="duplicate"]').val('true');
				}
			},
			errors : function() {
				console.log("에러");
			}
		};
		$.ajax(checkId);
	}
}

function block() {
	alert('중성화 하지 않은 반려동물은 등록할 수 없습니다.');
	document.getElementById('noNeutral').checked = false;
}

function prevPage() {
	document.getElementById('member-info').style.display = 'block';
	document.getElementById('pet-info').style.display = 'none';
	document.getElementsByClassName('pennant-pet')[0].style.color = '#e1e1e1';
	document.getElementsByClassName('pennant')[0].style.color = '#333';
}

function nextPage() {
	document.getElementById('member-info').style.display = 'none';
	document.getElementById('pet-info').style.display = 'block';
	document.getElementsByClassName('pennant-pet')[0].style.color = '#333';
	document.getElementsByClassName('pennant')[0].style.color = '#e1e1e1';
}

function cancle() {
	if (confirm('입력한 데이터는 저장되지 않습니다. \n 취소하시겠습니까?')) {
		location.href = '/';
	}
}

function init() {
	document.getElementById('pet-info').style.display = 'none';
	document.getElementsByClassName('pennant-pet')[0].style.color = '#e1e1e1';
	document.getElementsByName('duplicate')[0].value = 'true';
}

init();