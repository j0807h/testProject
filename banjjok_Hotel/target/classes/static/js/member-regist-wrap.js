/* member-regist-wrap.js */
function complete(){
// 		alert('회원가입이 완료되었습니다.\n로그인 후 이용해 주세요.');
	}
function prevPage(){
		 document.getElementById('member-info').style.display='block';
		 document.getElementById('pet-info').style.display='none';
		 document.getElementsByClassName('pennant-pet')[0].style.color='#333';
		 document.getElementsByClassName('pennant')[0].style.color='#e1e1e1';
	}
function cancle() {
		  if(confirm('입력한 데이터는 저장되지 않습니다. \n 취소하시겠습니까?')) {
		    location.href='index.html';
		  }
		}