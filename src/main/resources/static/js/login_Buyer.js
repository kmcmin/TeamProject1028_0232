//jquery 통한 이벤트 처리
//MemberAddController와 연결

$(function() {
////////////변수 선언/////////////
	//dom을 변수에 저장
	var name = $("#name");
	var id = $("#id");
	var password = $("#password");
	var password2 = $("#passwordCheck");
	var nickname = $("#nickname");
	var phone = $("#phoneNumber");
	var email1 = $("#email1");
	var email2 = $("#email2");
	var selectEmail = $("#selectEmail");
	var post = $("#sample4_postcode");
	var ref = $("#user_ref");
	var agmAllChk = $("#agmAllChk");
	var agm1 = $("#provisionYn");
	var agm2 = $("#memberInfoYn");
	
	//이메일 인증했는지 확인하는 변수
	var EmailVerification = false;
	
///////////이벤트 처리 //////////////
	
	
	//submit 시 이메일 본인인증 하지 않으면 false 나온다.
	$("#userForm").submit(function(){
		emailValCheck();
		EmailVerification = $("#tf").val();
		if(EmailVerification=='false'){
			$("#email_message").text("이메일 인증을 확인해주세요.");
			return false;
		}
	});//submit
	
	//이메일 내용 변경 시 이메일 인증 다시 해야함
	$("#email1").keydown(function(){
		$("#tf").val(false);
	});
	$("#email2").keydown(function(){
		$("#tf").val(false);
	});
	
	//이메일 본인인증 클릭시 
	$("#buttonEmail").click(EmailVerificationClick);	
	
		//각 태그에서 submit 또는 blur 할 때  유효성 검사
		  validateField(name, nameCheck);
		  validateField(id, idCheck);
		  validateField(password, pwCheck);
		  validateField(password2, pw2Check); 
		  validateField(nickname, nicknameCheck); 
		  validateField(phone, phoneCheck); 
		  validateField(ref, refCheck); 
		  
		//submit할 때만 체크
			$("#userForm").submit(addressCheck);//submit
			$("#userForm").submit(agmSubmitChk);//submit
				
		  //유효성 검사 함수 
			//- field: 선택된 html 요소
			//- validationFunction: 
			// 각 입력 필드에 유효성 검사 함수 등록
		  function validateField(field, validationFunction) {
			  field.blur(validationFunction);
			  $("#userForm").submit(validationFunction);
			}//fuction

			$(selectEmail).change(function(){
				console.log("login_Buyer.js:selectEmail작동확인");
				//1.email 선택지 바뀔때마다 값 출력
				email2.val(selectEmail.val());
				$("#email_message").text("");
				//2.change했을 때 직접입력이 아니라면, 입력 못하게
				if(email2.val().length!=0){
					email2.attr('readonly',"readonly");
				}//if
				else{	
					email2.removeAttr('readonly');
				}
			});//change이벤트
			
/////////유효성 검사 함수 시작//////////
	//이름 검사 - 필수 입력/2글자 이상 한글 이름
	function nameCheck(){
		const namePattern = /^[가-힣]{2,}$/;
		if(name.val().length==0){ //이름 미입력
			$("#name_message").text("이름을 입력하세요.");
			return false;
		}else{//이름 입력, 정규식에 맞을 때
			if(namePattern.test(name.val())){
				$("#name_message").text("");
				return true;
			}else{//이름 입력, 정규식에 맞지 않을 때
				$("#name_message").text("이름을 확인해주세요");
				return false;
			}//else
		}//else
	}//name이벤트
		
	
	
	//id 검사 - 포커스 벗어날 때 검사
	function idCheck(){	
	//사용가능한 아이디입니다/ 중복된 아이디입니다/6~14자의 영문/숫자만 입력하세요/ 아이디를 입력하세요 
		const idPattern = /^(?=.*[a-z])[a-z\d]{6,14}$/;
		if(id.val().length==0){
			$("#id_message").text("아이디를 입력하세요.");
			return false;
		}
		else if(!idPattern.test(id.val())){
			$("#id_message").text("6~14자의 영문 소문자와 숫자만 입력하세요(한 개 이상의 영문자를 포함해야합니다.)");
			return false;
		}//else if
		else{//길이 0 이 아니고 패턴도 맞을 때
			$("#id_message").text("");
				$.ajax({
					type : "POST",
					url : "add_idCheck",
					dataType : "json",
					data : {
						user_id : id.val()
					},
					success : function(rdata, status, xhr) {
						$("#id_message").html(rdata.str);
						//중복 결과에 따라 t/f 값 반환
						return rdata.result;
					}, 
					error : function(xhr, status, error) {
						console.log("error");
						return false;
					}//error
				});//ajax
		}//else
}//id 이벤트
	
	
	//비밀번호 검사 - 필수 입력 / 영문, 숫자, 특수문자 8자리 이상
		function pwCheck(){
		
		var p1 = password.val();
		var p2 = password2.val();
		
		//정규표현식: const 이름 = /패턴/
		const pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@#$%^&+=!])[A-Za-z\d@#$%^&+=!]{8,}$/;
		if(p1.length==0){//1-1.길이 0인지 아닌지 비교
			$("#pw_message1").text("비밀번호는 필수 입력사항입니다.");
			return false;
			}//if
		else{//1-2.길이 0 아님 +
			if(pwPattern.test(p1)){//2-1. 정규식이 맞음 +
				if(p1==p2){ //3-1. 비밀번호와 확인이 일치(길이 0일 수 없음)
					$("#pw_message1").text("");
					$("#pw_message2").html("<span style='color:blue'>사용 가능한 비밀번호 입니다.</span>");
					return true;
			
				}else{//3-2. 비밀번호와 확인 불일치(비밀번호 확인의 길이가 0일 수 있음)+
					if(p2.length!=0){ //4-1. 비밀번호 확인의 길이가 0이 아닐 떄
						$("#pw_message1").text("");
						$("#pw_message2").text("비밀번호가 일치 하지 않습니다. 다시 확인해 주세요.");
						return false;
					}else{ //4-2. 비밀번호 확인의 길이가 0일 때 
						$("#pw_message1").text("");
						$("#pw_message2").text("비밀번호 확인은 필수 입력사항입니다.");
						return false;
					}//else
				}//else
				
			}//if
			else{// 2-2. 정규식이 틀림 
				$("#pw_message1").text("8~20자 영문 대소문자, 숫자, 특수문자를 사용하세요.(공백 불가)");
				return false;
			}//else
		}//else
	}//password이벤트
	
	//비밀번호 대조 검사
		function pw2Check(){
		var p1 = password.val();
		var p2 = password2.val();
		const pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@#$%^&+=!])[A-Za-z\d@#$%^&+=!]{8,}$/;
		//1. 비밀번호 확인 미입력
		if(p2.length==0){
			$("#pw_message2").text("비밀번호 확인은 필수 입력사항입니다.");
			return false;
		}else{ //2. 길이 0 아님 
			if(p1.length==0){//2-1.비밀번호 미입력
				$("#pw_message1").text("비밀번호가 입력되지 않았습니다. 먼저 비밀번호를 입력해주세요.");
				return false;
			}//if. 
			else if(p1!=p2){//2-2. 비밀번호 입력 + 비밀번호 불일치
				$("#pw_message2").text("비밀번호가 일치하지 않습니다. 다시 확인해 주세요.");
				return false;
			}//else if.  2-3.비밀번호 입력 + 비밀번호 일치
			else if((p1==p2)&&pwPattern.test(p1)){
				$("#pw_message1").text("");
				$("#pw_message2").html("<span style='color:blue'>사용 가능한 비밀번호 입니다.</span>");
				return true;
			}//if
		}//else
	}//password2이벤트
	
	//닉네임 검사.특수문자만 사용할 수는 없도록 하자. 
	function nicknameCheck(){
		if(nickname.val().length==0){
			$("#nickname_message").html("<span style='color:gray'>미입력 시 자동 생성됩니다.</span>");
			return true;
		}//if
		else{//길이가 조건에 맞을 때
			//추후 지우기 필요
			$("#nickname_message").text("");
//	모음/자음도 허용	const nicknamePattern  = /^[가-힣ㄱ-ㅎ\u314F-\u3163A-Za-z0-9]{1,}$/;
			const nicknamePattern  = /^[가-힣a-zA-Z0-9]+$/;
			const ForbiddenNickPattern = /^user.*/;
			if(nicknamePattern.test(nickname.val())&&!(ForbiddenNickPattern.test(nickname.val()))){
			$.ajax({
				type : "POST",
				url : "add_nicknameCheck",
				dataType : "json",
				data : {
					user_nickname : nickname.val()
					},
				success : function(rdata, status, xhr) {
					$("#nickname_message").html(rdata.str);
					return rdata.result;
					}, 
				error : function(xhr, status, error) {
					console.log("error");
					return false;
					}//error
				});//ajax
			}//if
			else if(!nicknamePattern.test(nickname.val())){
				$("#nickname_message").text("별명 입력이 잘못되었습니다. 다시 확인해 주세요. (공백 불가)");
				return false;
			}//else if
			else if(ForbiddenNickPattern.test(nickname.val())){
				$("#nickname_message").text("이 별명은 사용할 수 없습니다. (user~불가)");
				return false;
			}//else if
		}//else
	}//nickname이벤트
	function addressCheck(){
		//Buyer.jsp 의 주소 추가 버튼-인라인 함수 확인하기
		if(post.val().length==0){
			$("#address_message").text("주소를 입력하세요");
			return false;
		}else{
			$("#address_message").text("");
			return true;
		}
	}//addressCheckFunction
	
	//휴대폰 유효성 검사
	function phoneCheck(){
		if(phone.val().length==0){ //길이가 0일 때
			$("#phone_message").text("휴대폰 번호를 입력하세요.");
			return false;
		}else{//길이가 0이 아닐 때 
			//01로 시작하는 번호만 가능
			const phonePattern = /^01\d{8,9}$/;
			if(phonePattern.test(phone.val())){
			$.ajax({ //길이가 0이 아닐 때
				type : "POST",
				url : "add_phoneCheck",
				dataType : "json",
				data : {
					user_phone : phone.val()
					},
				success : function(rdata, status, xhr) {
					$("#phone_message").html(rdata.str);
					return rdata.result;
					}, 
				error : function(xhr, status, error) {
					console.log("error");
					return false;
					}//error
				});//ajax
			}//if
			else{
				$("#phone_message").text("번호 입력이 잘못되었습니다. 다시 확인해 주세요.");
				return false;
			}//else
			
		}//else
	}//phone이벤트 function
	//이메일 통한 유효성과 db검사
	function emailValCheck(){
		var e1Pattern = /^[a-zA-Z0-9._%+-]+$/; 
		var e2Pattern = /^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; 
		//1. 만약에 email1이나 2를 안씀
		if(email1.val().length==0||email1.val().length==0){
			$("#email_message").text("이메일을 입력하세요.");
			return false;
		}
		//2 email1과 2 모두 입력했는데
		// email1이 정규식이 안맞거나 email2 가 정규식이 안맞으면
		else if((!e1Pattern.test(email1.val()))||(!e2Pattern.test(email2.val()))){
			$("#email_message").text("이메일 형식을 확인하세요.(공백 불가)");
			return false;
			//3. 둘 다 정규식이 맞음
		}else if(e1Pattern.test(email1.val())&&e2Pattern.test(email2.val())){
			//그러면 db검사 - 중복확인
			var emailValue = email1.val()+"@"+email2.val();
			$.ajax({
				type : "POST",
				url : "add_emailCheck",
				dataType : "json",
				data : {
					user_email : emailValue
					},
				success : function(rdata, status, xhr) {
					console.log("login_Buyer.js:"+emailValue);
					$("#email_message").html(rdata.str);
					//결과가 올바르면 email에 값 넣어준다.
					//console.log(emailValue);	
					if(rdata.result==true){$("#user_email").val(emailValue);}
					else{
						$("#email_message").text("중복된 이메일입니다.");
					}
					//$("#tf").val(rdata.result);
					return rdata.result;
					}, 
				error : function(xhr, status, error) {
					console.log("error");
					return false;
					}//error
				});//ajax
		}//elseif
	}//emailValCheckFunction
	
	//이메일 본인인증
	
	function EmailVerificationClick(){
		$("#email_message").text("");

		//이메일 체크 시 기본적으로 유효성 검사는 하고 넘어가야 진행
		if(emailValCheck()==false){
			EmailVerification = false;
			return false;
		}else{
			//이메일 인증 전 false로 두고 
			EmailVerification = false;
			
		//비동기로 안해도됨. 이메일 인증번호만 받아오면 되는데 암튼 수정하기
			//console.log(rdata);
		$.ajax({
			type : "POST",
			url : "../mailConfirm",
			dataType : "text",
			data : {
				user_email : email1.val()+"@"+email2.val()
				},
			success : function(rdata, status, xhr) {
				//코드 
				var emailcode = rdata.substring(rdata.length-8);
				window.open('/app/childEmail_verification?emailcode='+emailcode,'target=_blank','width=400,height=300,location=no,status=no,scrollbars=yes');
				//responseentity를 통해서 받아오는 값을 인증코드만 뽑은 후 window.open에 넘겨준다.
			//	EmailVerification = <%=session.get%>;
				//boolean값인 EmailVerification이 true/false
				//자식창의 값을 받아서 그걸로 t/f
				//console.log("EmailVerification"+EmailVerification);
				EmailVerification = $("#tf").val();
				//console.log("EmailVerification"+EmailVerification);
				return EmailVerification;
				}, 
			error : function(xhr, status, error) {
				
				console.log("error");
				$("#email_message").text("이메일을 확인하세요.");
				return false;
				}//error
			});//ajax
		}//else
	}
	function refCheck(){//추천인 검사
		if(ref.val().length==0){
			$("#ref_message").text("");
			return true;

		}else{
			//기존에 없던 닉네임을 쓰면 걸러지도록.
			const refPattern  = /^[가-힣a-zA-Z0-9]+$/;
			if(refPattern.test(ref.val())){
			$.ajax({
				type : "POST",
				url : "add_refCheck",
				dataType : "json",
				data : {
					user_nickname : ref.val()
					},
				success : function(rdata, status, xhr) {
					$("#ref_message").text(rdata.str);
					return rdata.result;
					}, 
				error : function(xhr, status, error) {
					console.log("error");
					return false;
					}//error
				});//ajax
			}//if
			else{
				$("#ref_message").text("추천인 입력이 잘못되었습니다. 다시 확인해 주세요.(공백 불가)");
				return false;
			}//else
		}//else
	}//method
	//이메일 클릭 이벤트
	//클릭 시 이메일 인증하고 맞을 경우 값을 form으로 넘겨줌
	
	
	//체크 박스 관련 이벤트
	
	//전체선택 클릭 시 
	agmAllChk.click(function(){
		$(".agm").prop('checked',agmAllChk.is(':checked'));
	});
	//두 체크 박스의 t/f값 확인해 하나라도 해제되면 전체선택도 해제되는 함수
	function agmChk(){
		if(agm1.is(":checked")&&agm2.is(":checked")){
			agmAllChk.prop('checked',true);
		}else{
			agmAllChk.prop('checked',false);
		}
	}//agmChk
	
	//위의 agmChk를 각 태그의 클릭 시 호출
	agm1.click(agmChk);
	agm2.click(agmChk);
	
	//전체 동의되었다면 넘어가고 아니라면 경고
	function agmSubmitChk(){ 
		if(agm1.is(":checked")&&agm2.is(":checked")){
			$("#chk_message").text("");
		}else{
			$("#chk_message").text("필수 약관 동의가 필요합니다.");
			return false;
		}
	}//agmSubmitChk
	
		
	});//read