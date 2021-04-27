// window.onload = function(){ sumAllPrice(); }

	function checkAllPro() { // 전체선택 또는 해제
		var checkLength = document.getElementsByName("check").length;
		var isChecked = document.getElementById('checkAll').checked; // 전체선택 박스의 체크 여부
		for (var i = 0; i < checkLength; i++) {
			if (document.getElementsByName("check")[i].checked != isChecked) {
				document.getElementsByName("check")[i].checked = isChecked;
			}
		}
		// sumAllPrice(); // 함수 호출해 제품 가격 sum
	}

	// function qtyAdd(proCode) {
	// 	location.href = "cartQtyUp.cng?proCode=" + proCode;
	// }
	// function qtyMin(proCode, cartQty) {
	// 	if (cartQty > 1) {
	// 		console.log("수량감소");
	// 		location.href = "cartQtyDown.cng?proCode=" + proCode;
	// 	} else {
	// 		alert("주문 가능한 최소 수량은 1개 입니다.");
	// 	}
	// }

	// function productDel() { // 선택상품 제거
	// 	var checkCount = document.getElementsByName("check").length; // 배열의 크기
	// 	var check = "";
	// 	for (var i = 0; i < checkCount; i++) {
	// 		if (document.getElementsByName("check")[i].checked) {
	// 			// 선택되었다면 목록에 추가
	// 			check += document.getElementsByName("check")[i].value + ",";
	// 		}
	// 	}
		
	// 	document.frm.action = "cartListDel.cng?check=" + check;
	// 	document.frm.submit();
	// }
	
	function allProductDel() { // 장바구니 비우기
		var checkCount = document.getElementsByName("check").length; // 배열의 크기
		for (var i = 0; i < checkCount; i++) {
			document.getElementsByName("check")[i].checked = true;
		}
		// productDel();
	}
	
	// function sumAllPrice() {
	// 	var sumPrice = 0;
	// 	var checkCount = document.getElementsByName("check").length;
	// 	for (var i = 0; i < checkCount; i++) {
	// 		if (document.getElementsByName("check")[i].checked) {
	// 			sumPrice += parseInt(document.getElementsByName("sumPrice")[i].value);
	// 		} else {
	// 			document.getElementById('checkAll').checked = false;
	// 		}
	// 	}

	// 	var totalSize = document.getElementsByClassName("total").length;
	// 	for (var i = 0; i < totalSize; i++) {
	// 		document.getElementsByClassName("total")[i].innerHTML = sumPrice;
	// 	}

	// }
	
	// function checkOrder() {
	// 	var checkCount = document.getElementsByName("check").length; // 배열의 크기
	// 	var check = "";
	// 	for (var i = 0; i < checkCount; i++) {
	// 		if (document.getElementsByName("check")[i].checked) {
	// 			check += document.getElementsByName("check")[i].value + ",";
	// 		}
	// 	}
	// 	var selectOrder = confirm("선택상품을 구매하시겠습니까?");
	// 	if (selectOrder) {
	// 		document.frm.action = "proOrder.cng?check=" + check;
	// 		document.frm.submit();
	// 		//location.href = "proOrder.cng?check=" + check;
	// 	} else {
	// 		return false;
	// 	}
	// }
	
	// function orderThis(cartNum){	// 한개 상품 주문
	// 	var check = cartNum;
	// 	document.frm.action = "proOrder.cng?check=" + check;
	// 	document.frm.submit();
	// }
	
	// function deleteThis(cartNum) {	// 한개 상품 삭제
	// 	var check = cartNum;
	// 	document.frm.action = "cartListDel.cng?check=" + check;
	// 	document.frm.submit();
	// }
	
	// function orderAllPro() {
	// 	var check = "";
	// 	for(var i=0; i < document.getElementsByName("check").length ; i++) {
	// 		check += document.getElementsByName("check")[i].value + ",";
	// 	}
		
	// 	var question = confirm("전체 상품을 구매하시겠습니까?");
	// 	if (question) {
	// 		document.frm.action = "proOrder.cng?check=" + check;
	// 		document.frm.submit();
	// 	}
	// }