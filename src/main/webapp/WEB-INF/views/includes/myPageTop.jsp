<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="bodyWrap">
	<h3 class="cnts_title">
		<span id="menuTitle">마이페이지</span>
	</h3>
	<div class=""
		style="position: relative; width: 834px; height: 0; display: block; left: 50%; margin-left: -338px;">
		<div class="delch_box tooltip1907" id="store_delbox"
			style="display: none;">
			<span class="arr">위치아이콘</span> 작성 가능한 상품평 확인하시고,<br> 상품평 작성해서 추가
			마일리지 적립하세요.
		</div>
	</div>
	<div class="sub_container">
		<!-- lnb -->
		<div class="lnb_wrap">
			<h4>
				<a href="/member/myPage">마이페이지<!-- 마이페이지 --></a>
			</h4>
			<div class="lnb">
				<dl>
					<dt>주문조회</dt>
					<dd>
						<a href="/ko/mypage/order/myorders"
							onclick="GA_Event('마이페이지','LNB','주문/배송/반품/취소');">주문/배송/반품/취소</a>
					</dd>
				</dl>
				<dl>
					<dt>혜택관리</dt>
					<dd>
						<a href="/ko/mypage/voucher"
							onclick="GA_Event('마이페이지','LNB','나의 쿠폰');">나의 쿠폰<!-- 쿠폰함 --></a>
					</dd>
				</dl>
				<dl>
					<dt>나의 상품관리</dt>
					<dd>
						<a href="/ko/mypage/myWish"
							onclick="GA_Event('마이페이지','LNB','위시리스트');">위시리스트<!-- 위시리스트 --></a>
					</dd>
					<dd>
						<a href="/ko/mypage/rsalarm"
							onclick="GA_Event('마이페이지','LNB','재입고 알림');">재입고 알림<!-- 재입고알림 --></a>
					</dd>
				</dl>
				<dl>
					<dt>나의 정보관리</dt>
					<dd>
						<a href="/ko/mypage/personInfomationChangePWCheck"
							onclick="GA_Event('마이페이지','LNB','개인정보 변경/탈퇴');">개인정보 변경/탈퇴</a>
					</dd>
					<dd>
						<a href="/ko/mypage/shoppingAddressPWCheck"
							onclick="GA_Event('마이페이지','LNB','배송지 관리');">배송지 관리</a>
					</dd>
					<dd>
						<a href="/ko/mypage/oneClick"
							onclick="GA_Event('마이페이지','LNB','원클릭 결제 관리');">원클릭 결제 관리</a>
					</dd>
				</dl>
				<dl>
					<dt>나의 활동관리</dt>
					<!-- <dd><a href="#">회원등급</a></dd> -->
					<dd>
						<a href="/ko/mypage/myreview"
							onclick="GA_Event('마이페이지','LNB','내 상품평');">내 상품평</a>
					</dd>
					<dd>
						<a href="/ko/mypage/myqna"
							onclick="GA_Event('마이페이지','LNB','상품 Q&amp;A');">상품 Q&amp;A</a>
					</dd>
					<dd>
						<a href="/ko/mypage/mymantomaninquiry"
							onclick="GA_Event('마이페이지','LNB','1:1 문의');">1:1 문의</a>
					</dd>
					<!-- <dd><a href="#">이벤트 참여현황</a></dd> -->
				</dl>
			</div>
			<!-- ph_guide -->
			<div class="ph_guide">
				<p class="tlt">고객센터 운영 안내</p>
				<p class="phone">
					1800-5700<span style="color: #c69c6d;" class="txt">(유료)</span>
				</p>
				<p class="txt">
					평일(월~금)<br>am 09:00 ~ pm 18:00<span>토/일, 공휴일 휴무</span>
				</p>
				<a href="mailto:shophelp@thehandsome.com">shophelp<br>@thehandsome.com
				</a>
			</div>
			<!-- //ph_guide -->
		</div>
		<!-- //lnb -->
