function checkInputs() {
	// trim to remove the whitespaces
	const loginAccount = document.getElementById('loginAccount');
	if(loginAccount.value.length==0) {
		setErrorFor(loginAccount, '登录账号不能为空');
		return  false;
	} else {
		setSuccessFor(loginAccount);
		// return true;
	}
	const userName = document.getElementById('userName');
	if(userName.value.length==0) {
		setErrorFor(userName, '用户名不能为空');
		return false;
	} else {
		setSuccessFor(userName);
		// return true;
	}
	const phoneNumber = document.getElementById('phoneNumber');
	if(phoneNumber.value.length==0) {
		setErrorFor(phoneNumber, '手机号不能为空');

		return false;
	} else {
		setSuccessFor(phoneNumber);
		// return true;
	}
	const email = document.getElementById('email');
	if(email.value.length==0) {
		setErrorFor(email, '邮箱不能为空');
		return false;
	} else if (!isEmail(email.value)) {
		setErrorFor(email, '邮箱格式不正常');
		return false;
	} else {
		setSuccessFor(email);
		// return true;
	}
	const loginPassword = document.getElementById('loginPassword');
	if(loginPassword.value.length==0) {
		setErrorFor(loginPassword, '密码不能为空');
		return false;
	} else {
		setSuccessFor(loginPassword);
		// return true;
	}



	return true

}

function setErrorFor(input, message) {
	const formControl = input.parentElement;
	const small = formControl.querySelector('small');
	formControl.className = 'form-control error';
	// small.innerText = message;
	layer.msg(message)
}

function setSuccessFor(input) {
	const formControl = input.parentElement;
	formControl.className = 'form-control success';
}
	
function isEmail(email) {
	return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
}