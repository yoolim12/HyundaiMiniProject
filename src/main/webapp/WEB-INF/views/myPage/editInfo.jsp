<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/includes/loginHeader.jsp"%>
<%@ include file="/WEB-INF/views/includes/myPageTop.jsp"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!--  회원 정보 수정 페이지   -->
<div class="sub_cnts">

<script>
    function member_form_edit() {
		
    	if(document.updateMemberForm.emailDomainSel.value == ""){
    		document.updateMemberForm.emailDomainSel.value = document.updateMemberForm.emailDomainTemp.value;
    	}
    	document.updateMemberForm.mEmail.value = document.updateMemberForm.email.value + "@"+ document.updateMemberForm.emailDomainSel.value;    		
    	
    	 //빈 값일 경우 
		 if(!(document.updateMemberForm.mPassword.value == "" && document.updateMemberForm.mPassword2.value == "")){
	    	 if (document.updateMemberForm.mPassword.value != document.updateMemberForm.mPassword2.value) {
	             alert("비밀번호가 일치하지 않습니다.");
	             document.updateMemberForm.mPassword.focus();
	             return false;
	         }	    	 
		 }   	
    	
        return true;
    }
</script>

	<form id="updateProfileForm" action="/member/edit"
		method="post" name="updateMemberForm" onsubmit="return member_form_edit();">
		<input type="hidden" name="prk" id="prk" value="8929858060292">
		<input type="hidden" name="emailDuplChk" id="emailDuplChk" value=""
			title="이메일 중복"> <input type="hidden" id="emailAddress"
			name="emailAddress" value=""> <input type="hidden"
			id="sBirthday" name="sBirthday" value="">
		<!-- //lnbWrap -->
		<div>
			<div class="title_wrap mt30">
				<h4 class="float_left">개인정보 변경</h4>
				<p class="txt_line">회원정보를 확인하고, 변경할 수 있습니다.</p>
				<p class="reqd_txt">
					<strong class="reqd">*</strong> 표시는 필수항목입니다.
				</p>
			</div>

			<fieldset>
				<legend>회원정보입력</legend>
				<div class="tblwrap">
					<table class="tbl_wtype1">
						<caption>회원가입 입력항목</caption>
						<colgroup>
							<col style="width: 140px">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="th_space">아이디</th>
								<td><c:out value="${member.mid}"/></td>
							</tr>
							<tr>
								<th scope="row" class="th_space">
									새 비밀번호</th>
								<td><input type="password" style="width: 150px" id="mPassword"
									name="mPassword">									
								</td>
							</tr>
							<tr>
								<th scope="row" class="th_space">
									새 비밀번호 확인</th>
								<td><input type="password" style="width: 150px" id="mPassword2"
									name="mPassword2"></td>
							</tr>
							<tr>
								<th scope="row"><strong class="reqd">*</strong> <label
									for="inforcvemail">E-mail(정보수신용)</label></th>
								<td><input type="text" style="width: 120px" title="이메일아이디"
									id="email" value="${prefixEmail}"
									 name="email"> <span class="andmail">@</span>
									<select id="emailDomainSel" style="width: 120px" title="이메일계정" name="emailDomainSel">
										<option value="" selected="selected">직접입력</option>
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
								</select> <input type="text" id="emailDomain"
									style="width: 120px; display: none;" value="gmail.com"
									title="이메일 도메인"> <span
									class="guide_comment" id="emailMsg">
										<input type="hidden" name="mEmail">	
										<input type="hidden" name="emailDomainTemp" value="${suffixEmail}">								
									</span>
									<div class="wtype_comment pt10">
										<span>정확한 이메일 정보를 입력하셔야 주문/배송 및 서비스정보를 받아 보실 수 있습니다.</span>
									</div></td>
							</tr>
							<tr>
								<th scope="row" class="th_space"><strong class="reqd">*</strong>
									이름</th>
								<td><input type="text" style="width: 120px" id="mName"
									name="mName" value="${member.getMName()}" ></td>
							</tr>
							<tr>
								<th scope="row"><strong class="reqd">*</strong><label
									for="tel">전화번호</label></th>
								<td><input type="text" style="width: 200px" id="mTel"
									value="${member.getMTel()}" name="mTel"></td>
							</tr>
							<tr>
								<th scope="row"><label
									for="zipcode">우편번호</label></th>
								<td><input type="text" style="width: 110px" id="mZipcode"
									value="${member.getMZipcode()}" name="mZipcode"></td>
							</tr>
							<tr>
								<th scope="row"><label
									for="address">주소</label></th>
								<td><input type="text" style="width: 200px" id="mAddress1"
									value="${member.getMAddress1()}" name="mAddress1"></td>
							</tr>
							<tr>
								<th scope="row"><label
									for="address">상세 주소</label></th>
								<td><input type="text" style="width: 200px" id="mAddress2"
									value="${member.getMAddress2()}" name="mAddress2"></td>
							</tr>														
						</tbody>
					</table>
				</div>
			</fieldset>

			<!-- btn_btwrap -->
			<div class="btn_btwrap">
				<input type="button" class="btn wt_ss" value="회원탈퇴"
					id="memberSecessionBtn" action="">
			</div>
			<div class="btnwrap mypage2">
<!-- 				<input type="button" class="btn wt" value="취소" id="cancleBtn">
 -->
 				<a href="/myPage/main" type="button" class="btn wt" id="cancleBtn">취소</a>
				<input type="submit" class="btn gray" value="변경사항 저장" id="saveBtn">
			</div>
			<!-- //btn_btwrap -->
		</div>
		<div>
	 	    <input type="hidden" name="${_csrf.parameterName}"
		    value="${_csrf.token}" />
		</div>
	</form>
	<!-- 다국어 한국 이외의 언어에서 사용 -->
</div>

<%@ include file="/WEB-INF/views/includes/myPageBottom.jsp"%>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>