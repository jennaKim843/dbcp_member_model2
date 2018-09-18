/**
 * plugin 사용하여 joinForm.jsp 폼 검증하기
 */
$(function() {
	$("#register").validate(
			{
				errorPlacement : function(error, element) {
					$(element).closest("form").find(
							"small[id='" + element.attr("id") + "']").append(
							error);
				},
				rules : {
					userid : {
						required : true,
						validId : true, // 여기의 validId는 아래의 검증 메소드의 값 과 같아야한다.
						minlength : 5,
						remote: {
							url:"checkId.do",
							type:"post",
							data:{
								userid:function(){
									return $("#userid").val();
								}
							}
						}
					},
					password : {
						required : true,
						validPwd : true,
						minlength : 8
					},
					name : {
						required : true,
						minlenth : 2
					},
					email : {
						required : true,
						validEmail : true
					},
					gender : "required",
				},

				messages : {
					userid : {
						required : "아이디는 필수 요소 입니다.",
						minlenth : "아이디는 최소 5자리 이상 입니다.",
						remote : "아이디가 중복 되었습니다."

					},
					password : {
						required : "비밀번호는 필수요소 입니다.",
						minlenth : "비밀번호는최소 8자리 이상입니다."
					},
					name : {
						required : "이름은 필수요소 입니다.",
						minlenth : "이름은 최소 2자리 이상 입니다."
					},
					email : {
						required : "이메일은 필수요소 입니다."
					},

					gender : "성별은 필수요소 입니다."
				}

			});
});

// 검증 메소드
$.validator.addMethod("validId", function(value) {
	var regId = /^(?=.*?[A-Za-z])(?=.*\d)([A-Za-z\d]){5,12}$/;
	return regId.test(value);
}, "아이디는 영문 소문자,대문자,숫자를 포함하여 5~12자리 사이로 입력해야 합니다.");
$.validator.addMethod("validPwd", function(value) {
	var regPwd = /^(?=.*\d)(?=.*?[A-Za-z])(?=.*?[#?!@$%^&*-]).{8,15}$/;
	return regPwd.test(value);
}, "비밀번호는 (대소문자 상관 없음)문자,숫자,특수문자 8~15");

$.validator.addMethod("validpwdLetters", function(value) {
	var regPwd = /(\w)\1\1\1/;
	return !regPwd.test(value);
}, "동일한 숫자와 문자를 연속으로 사용할 수 없습니다.");

$.validator
		.addMethod(
				"validEmail",
				function(value) {
					var regEmail = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
					return regEmail.test(value);
				}, "이메일 형식을 확인해 주세요");