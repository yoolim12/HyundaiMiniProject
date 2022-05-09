<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css" media="all">
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" media="all">
<link rel="stylesheet" type="text/css" href="/resources/css/font_80.css" media="all">
<script type="text/javascript">
function GA_Event(Category, Action, Label) {
    
    Label = unescape(Label).replace(/\&#039;/gi,"'");
    var v_Label = Label;
    var v_Category = Category;
    var v_Action = Action;
    
    if(Category != null){
        v_Category = Category.replace(/\s{2,}/gi,' ').trim().replace(/\s/gi,'_');
    }
    if(Action != null){
        v_Action = Action.replace(/\s{2,}/gi,' ').trim().replace(/\s/gi,'_');
    }
    if(Label != null){
        v_Label = Label.replace(/\s{2,}/gi,' ').trim().replace(/\s/gi,'_');
    }
    ga('gp.send','event', v_Category, v_Action, v_Label);
}
</script>
<div id="footerWrap">
	<div id="topBtn">
		<a href="javascript:void(0);" class="viewTopArea"><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/common/top_btn.png" alt="맨 위로" onclick="GA_Event('공통','퀵버튼','TOP');"/></a>
	</div>
	<div class="footer">
		<!--footer_cnts1 -->
		<div class="footer_cnts1 clearfix">
			<!-- footer_menu-->
			<div class="footer_menu cnts1_left">
				<div class="footer_logo"><a href="/ko/main" onclick="GA_Event('공통','로고','하단');"><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/common/footer_logo_renew.png" alt="HANDSOME" /></a></div>
				<div class="footer_link">
					<ul class="clearfix">
					   	<li><a href="/ko/member/login" onclick="GA_Event('공통','푸터_메뉴','로그인');">로그인</a></li>
					   	<li><a href="/ko/mypage/order/myorders" onclick="GA_Event('공통','푸터_메뉴','주문배송조회');">주문배송조회</a></li>
						<li><a href="/ko/mypage/order/myorders" onclick="GA_Event('공통','푸터_메뉴','취소/반품');">취소/반품</a></li>
						<li><a href="/ko/mypage/myWish" onclick="GA_Event('공통','푸터_메뉴','위시리스트');">위시리스트</a></li>
					</ul>
					<ul class="clearfix">
						<li><a href="http://www.handsome.co.kr/ko/company/aboutHandsome.do" target="_blank" onclick="GA_Event('공통','푸터_메뉴','회사소개');">회사소개</a></li>
						<li><a href="http://www.handsome.co.kr/ko/brand/fashion.do" target="_blank" onclick="GA_Event('공통','푸터_메뉴','브랜드소개');">브랜드소개</a></li>
						<li><a href="http://www.handsome.co.kr/ko/ir/governance01.do" target="_blank" onclick="GA_Event('공통','푸터_메뉴','투자정보');">투자정보</a></li>
						<li><a href="https://recruit.ehyundai.com/recruit-info/announcement/list.nhd?pageNo=1&hireGb=01&coCd=HDHAN" target="_blank" onclick="GA_Event('공통','푸터_메뉴','채용정보');">채용정보</a></li>
						<li><a href="http://www.handsome.co.kr/ko/sustainability/sharedGrowth01.do" target="_blank" onclick="GA_Event('공통','푸터_메뉴','동반성장');">동반성장</a></li>
					</ul>
				</div>
			</div>
			<!-- //footer_menu-->
			<div class="footer_apps cnts1_right">
				<!-- APP 다운로드, 딜리버리 서비스 -->
				<div class="cnts1_right_inner">
				    <a href="https://www.thehandsome.com/ko/appDownloadSMS/sendSMSPage" onclick="GA_Event('공통','푸터','APP다운로드');">
				    	<img src="http://cdn.thehandsome.com/_ui/desktop/common/images/common/footer_ico_apps.png" alt="APP 다운로드" style="width:52px;height:71px;">
						<p>APP 다운로드 &gt;</p>
			        </a>
				    <a href="https://www.thehandsome.com/ko/svcenter/footerAthomeInfo" style="margin-right:45px;" onclick="GA_Event('공통','푸터','딜리버리서비스');">
					<img src="http://cdn.thehandsome.com/pc/footer/footer_athome_car.png" alt="딜리버리 서비스" style="width:85px;">
						<p>딜리버리 서비스 &#62;</p>
			        </a>
			    </div>
			</div>
		</div>
	</div><!--//footer_cnts1 끝-->
	<!--footer_cnts2 -->
	<div class="footer_cnts2 clearfix">
		<div class="footer">
			<div class="cnts2_left">
				<p class="top_p"><span style="font-weight:bold; font-size:13px;">[현대IT&E Spring Project 4팀]</span><span style="font-weight:bold; font-size:13px;" >유지훈 · 이지은 · 최유림</span></p>
				<p class="top_p"><span>(주)한섬</span><span>대표이사 : 김민덕</span><span>서울시 강남구 도산대로 523 한섬빌딩</span><span>TEL 1800-5700 (유료)</span><span class="bgnone">FAX 02-6078-2856</span></p>
				<p><span>사업자등록번호 120-81-26337</span><span>통신판매업신고번호 강남 제 00826호</span><span>개인정보관리책임자 윤인수</span><span class="bgnone">호스팅서비스 : (주) 한섬</span></p>
				<p class="copyright">COPYRIGHT © 2017 HANDSOME. ALL RIGHT RESERVED.</p>
			</div>
			<div class="cnts2_right">
				<div class="related_site clearfix">
					<dl class="family">
						<dt><a href="javascript:void(0);" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE');">FAMILY SITE</a></dt>
						<dd style="">
							<ul>
	                            <li class="bold_division1811">쇼핑몰 Site<!-- 쇼핑몰 Site --></li>
	                            <li><a href="https://www.thehyundai.com/Home.html" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_더현대닷컴');">더현대닷컴<!-- 더현대닷컴 --></a></li>
	                            <li><a href="https://www.hddfs.com/shop/dm/main.do?ptnrChlCd=00003014" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대백화점 면세점');">현대백화점 면세점<!-- 현대백화점 DUTY FREE --></a></li>
	                            <li><a href="http://esuper.ehyundai.com/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_e수퍼마켓');">e수퍼마켓<!-- e수퍼마켓 --></a></li>
	                            <li><a href="https://www.hyundaihmall.com/Home.html" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대Hmall');">현대Hmall<!-- 현대 Hmall --></a></li>
	                            <li><a href="http://mall.hyundailivart.co.kr/front/vrStoreList.lv" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대리바트몰');">현대리바트몰<!-- 현대리바트몰 --></a></li>
	                            <li><a href="http://www.hyundairentalcare.co.kr/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대렌탈케어');">현대렌탈케어<!-- 현대렌탈케어 --></a></li>
	                            <li><a href="http://www.hfashionmall.com/sfmweb/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_H패션몰');">H패션몰<!-- H패션몰 --></a></li>
	                            <li><a href="https://www.h-vrstation.com/main" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_VR STATION');">VR STATION<!-- VR STATION --></a></li>
	                            <li class="bold_division1811">관계사 Site<!-- 관계사 Site --></li>
	                            <li><a href="http://www.ehyundai.com/newPortal/ir/main.do" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대백화점그룹');">현대백화점그룹<!-- 현대백화점 그룹 --></a></li>
	                            <li><a href="https://www.ehyundai.com/newPortal/index.do" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대백화점');">현대백화점<!-- 현대백화점 --></a></li>
	                            <li><a href="http://www.hyundaigreenfood.com/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대그린푸드');">현대그린푸드<!-- (주)현대그린푸드 --></a></li>
	                            <li><a href="https://www.hyundaihmall.com/Home.html" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대홈쇼핑');">현대홈쇼핑<!-- (주)현대홈쇼핑 --></a></li>
	                            <li><a href="http://www.hyundailivart.co.kr/ko/intro/index.lvt" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대리바트');">현대리바트<!-- (주)현대 리바트 --></a></li>
	                            <li><a href="http://www.hyundaimedia.com/mpp/index.hcn" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대미디어');">현대미디어<!-- 현대 미디어 --></a></li>
	                            <li><a href="http://www.hyundairentalcare.co.kr/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대렌탈케어');">현대렌탈케어<!-- 현대렌탈케어 --></a></li>
	                            <li><a href="http://www.hyundaidreamtour.com/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대드림투어');">현대드림투어<!-- 현대드림투어 --></a></li>
	                            <li><a href="http://www.everdigm.com/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_에버다임');">에버다임<!-- 에버다임 --></a></li>
	                            <li><a href="http://www.cnsfoodsystem.co.kr/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_씨엔에스푸드시스템');">씨엔에스푸드시스템<!-- 씨엔에스푸드시스템 --></a></li>
	                            <li><a href="http://www.hyundaicatering.co.kr/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대캐터링시스템');">현대캐터링시스템<!-- 현대캐터링시스템 --></a></li>
	                            <li><a href="http://www.hyundai-ite.com/index.jsp" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대IT&amp;E');">현대IT&amp;E<!-- 현대IT&amp;E --></a></li>
	                            <li><a href="http://www.hyundailnc.com/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대L&amp;C');">현대L&amp;C<!-- 현대L&amp;C --></a></li>
	                        </ul>
						</dd>
					</dl>
				</div>
			</div>
		</div>
	</div><!--//footer_cnts2 끝-->
</div>

</body>
</html>