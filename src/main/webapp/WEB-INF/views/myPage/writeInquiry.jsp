<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/includes/loginHeader.jsp"%>
<%@ include file="/WEB-INF/views/includes/myPageTop.jsp"%>

<div class="sub_cnts">
	<div class="title_wrap mt30 clearfix">
		<h4 class="float_left">1:1 문의 등록</h4>
		<p class="reqd_txt"><strong class="reqd">*</strong> 표시는 필수항목입니다.</p>
	</div>
	<form id="manToManInquiryForm" name="manToManInquiryForm" action="/myPage/writeInquiry?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="UTF-8">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<fieldset>
			<legend>1:1 문의 입력</legend>
			<div class="tblwrap">
				<table class="tbl_wtype1">
					<caption>1:1 문의 입력</caption>
					<colgroup>
						<col style="width:140px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><strong class="reqd">*</strong>문의 항목</th>
							<td class="storeQue">
								<p>더한섬닷컴 문의</p>
							</td>
						</tr>					
						<tr>
							<th scope="row"><strong class="reqd">*</strong>문의제목</th>
							<td>
								<input type="text" id="subject" name="qtitle" title="문의제목" class="w_all">
							</td>
						</tr>
						<tr>
							<th scope="row">
								<strong class="reqd">*</strong>문의 내용<span class="com_txt_p">(2000자 이하)</span>
							</th>
							<td>
								<textarea id="contents" name="qcontent" title="문의내용" cols="30" rows="10"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btnwrap">
				<input type="button" id="cancleBtn" value="취소" class="btn wt">
				<input type="button" id="registerBtn" value="등록" class="btn gray mr0">
			</div>
		</fieldset>
	</form>
	<ul class="bul_sty01_li mt60">
		<li>문의하신 내용에 대한 답변은 이메일 또는 <a href="/myPage/myInquiry"><em class="ft_point01">마이페이지 &gt; 1:1 문의내역</em></a>에서 확인하실 수 있습니다. </li>
		<li>SMS 문자와 이메일로 답변 완료 알림을 받아보실 수 있습니다.</li>
	</ul>
</div>
<script>
$("#cancleBtn").click(function(){
	var lc = new layerConfirm("문의 내용 작성을 취소하시겠습니까?");
	lc.confirmAction = function(){
		if("" == "mypage") {
			location.href="/myPage/writeInquiry";
		} else {
			location.href="/myPage/myInquiry";
		}
	};
});

$("#registerBtn").click(function(){
	var lc = new layerConfirm("문의를 등록하시겠습니까?");
	lc.confirmAction = function(){
		if("" == "mypage") {
			location.href="/myPage/writeInquiry";
		} else {
			var form = document.manToManInquiryForm;
		    form.submit();
		}
	};
});

</script>
<%@ include file="/WEB-INF/views/includes/myPageBottom.jsp"%>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>