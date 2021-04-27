/**
 * 
 */
function frmSend() {
			if (document.getElementById('sitterPw').value.trim() == "") {
				alert('비밀번호를 입력하세요.');
				document.getElementById('sitterPw').focus();
				return false;
			}
		}

function sitterDelete(){
	if (confirm('정말 탈퇴하시겠습니까?')) {
		if (document.getElementById('sitterPw').value.trim() == "") {
			alert('비밀번호를 입력하세요.');
			document.getElementById('sitterPw').focus();
			return false;
		}
		document.frm.action = "/hotel/sitterDel";
		frm.submit();
	}
}