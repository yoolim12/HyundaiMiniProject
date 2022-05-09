<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/includes/loginHeader.jsp"%>

<script>
    function member_form_save() {
    	if (document.memberJoin.mid.value == "") {
            alert("아이디를 입력해 주세요.");
            document.memberJoin.email.focus();
            return false;
        } else if (document.memberJoin.mPassword.value == "") {
            alert("비밀번호를 입력해 주세요.");
            document.memberJoin.mPassword.focus();
            return false;
        } else if (document.memberJoin.mPassword.value != document.memberJoin.mPassword2.value) {
            alert("비밀번호가 일치하지 않습니다.");
            document.memberJoin.mPassword.focus();
            return false;
        } else if (document.memberJoin.mName.value == "") {
            alert("이름을 입력해 주세요.");
            document.memberJoin.mName.focus();
            return false;
        } else if (document.memberJoin.mTel.value == "") {
            alert("전화번호를 입력해 주세요.");
            document.memberJoin.mTel.focus();
            return false;
        }
    	
    	if(document.memberJoin.emailDomainSel.value == "" && document.memberJoin.emailDomain.value != ""){
    		document.memberJoin.mEmail.value = document.memberJoin.email.value + "@"+ document.memberJoin.emailDomain.value;
    	}else{
    		document.memberJoin.mEmail.value = document.memberJoin.email.value + "@"+ document.memberJoin.emailDomainSel.value;    		
    	}
    	
        return true;
    }
        
</script>

<form id="memberJoinForm" action="/member/join" method="POST" name="memberJoin" onsubmit="return member_form_save();">

	<div id="bodyWrap">
		<!--title-->
		<h3 class="cnts_title">
			<span>회원가입</span>
		</h3>
		<!--//title-->

 		<!--//join step-->
		<!--sub container-->
		<div class="sub_container">
			<div class="join_title">
				<p class="title">고객님의 회원정보를 입력해주세요.</p>
			</div>
			<fieldset>
				<legend>회원정보입력</legend>
				<div class="box_type_1">
					<div class="title_wrap clearfix">
						<h4 class="float_left">회원정보</h4>
						<p class="reqd_txt float_right">
							<strong class="reqd">*</strong> 표시는 필수항목입니다.
						</p>
					</div>
					<div class="tblwrap">
						<table class="tbl_wtype1">
							<caption>회원가입 입력항목</caption>
							<colgroup>
								<col style="width: 160px">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><strong class="reqd">*</strong><label for="mid">아이디</label></th>
									<td>
										<input type="text" style="width: 120px" id="mid" name="mid">	
										<input type="button"
										class="btn add_s" id="midDubChkBtn" value="중복확인">								
									</td>
								</tr>
								<tr>
									<th scope="row"><strong class="reqd">*</strong><label
										for="pw">비밀번호</label></th>
									<td><input type="password" id="pw" name="mPassword"
										style="width: 150px" title="비밀번호"> <span
										class="guide_comment lh_30" id="pwMsg"></span> <span
										class="guide_comment lh_30" id="pwcapsLockMsg"></span></td>
								</tr>
								<tr>
									<th scope="row"><strong class="reqd">*</strong> <label
										for="pw2">비밀번호 확인</label></th>
									<td><input type="password" id="pwc" style="width: 150px"
										title="비밀번호 확인" name="mPassword2"> <span class="guide_comment"
										id="pwcMsg"></span> <span class="guide_comment"
										id="pwcCapsLockMsg"></span></td>
								</tr>
								<tr>
									<th scope="row"><label for="email">E-mail (정보수신용)</label></th>
									<td><input type="text" style="width: 120px" title="이메일"
										id="email" name="email"> <span class="andmail">@</span> <select
										id="emailDomainSel" name="emailDomainSel" style="width: 120px" title="이메일">
											<option value="">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="daum.net">daum.net</option>
											<option value="gmail.com">gmail.com</option>
											<option value="yahoo.co.kr">yahoo.co.kr</option>
											<option value="lycos.co.kr">lycos.co.kr</option>
											<option value="nate.com">nate.com</option>
											<option value="empas.com">empas.com</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="msn.com">msn.com</option>
											<option value="hanmir.com">hanmir.com</option>
											<option value="chol.net">chol.net</option>
											<option value="korea.com">korea.com</option>
											<option value="netsgo.com">netsgo.com</option>
											<option value="dreamwiz.com">dreamwiz.com</option>
											<option value="hanafos.com">hanafos.com</option>
											<option value="freechal.com">freechal.com</option>
											<option value="hitel.net">hitel.net</option>
									</select> <input type="text" id="emailDomain" style="width: 120px"
										value="" title="이메일 도메인" name="emailDomain">
										<input type="hidden" name=mEmail>
 								</tr>
								<tr>
									<th scope="row"><strong class="reqd">*</strong><label
										for="name">이름</label></th>
									<td><input type="text" style="width: 120px" id="name"
										name="mName"></td>
								</tr>
								<tr>
									<th scope="row"><strong class="reqd">*</strong><label
										for="tel">전화번호</label></th>
									<td><input type="text" style="width: 200px" id="name"
										name="mTel"></td>
								</tr>
								<tr>
									<th scope="row"><label
										for="zipcode">우편번호</label></th>
									<td><input type="text" style="width: 110px" id="name"
										name="mZipcode"></td>
								</tr>
								<tr>
									<th scope="row"><label
										for="address">주소</label></th>
									<td><input type="text" style="width: 200px" id="name"
										name="mAddress1"></td>
								</tr>
								<tr>
									<th scope="row"><label
										for="address">상세 주소</label></th>
									<td><input type="text" style="width: 200px" id="name"
										name="mAddress2"></td>
								</tr>
							</tbody>
						</table>
					</div>


					<div class="btnwrap">
						<input type="button" value="취소" class="btn wt" id="cancleBtn">
						<input type="submit" value="회원가입" class="btn gray mr0"
							id="joinBtn">
					</div>
				</div>
			</fieldset>
		</div>
		<!--//sub container-->
	</div>

	<div>
 	    <input type="hidden" name="${_csrf.parameterName}"
	    value="${_csrf.token}" />

	</div>
</form>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
