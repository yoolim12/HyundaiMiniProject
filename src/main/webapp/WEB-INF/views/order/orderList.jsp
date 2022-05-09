<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index Page</title>
<link rel="stylesheet" type="text/css" href="http://www.thehandsome.com/_ui/desktop/common/css/font_80.css" media="all" />
<link rel="stylesheet" type="text/css"
	href="/resources/_ui/desktop/common/css/common.css?20220401" media="all">
<link rel="stylesheet" type="text/css"
	href="/resources/_ui/desktop/common/css/layout.css?20220331" media="all">
<link rel="stylesheet" type="text/css" href="http://www.thehandsome.com/_ui/desktop/common/css/popup.css?20210225" media="all" />
<link rel="stylesheet" type="text/css" href="http://www.thehandsome.com/_ui/desktop/common/css/jquery-ui.min.css" media="all" />

<link rel="stylesheet" type="text/css" href="http://www.thehandsome.com/_ui/desktop/common/css/brand.css" media="all" />
<link rel="stylesheet" type="text/css" href="http://www.thehandsome.com/_ui/desktop/common/css/footer.css?20220406" media="all" />
<link rel="stylesheet" type="text/css" href="http://www.thehandsome.com/_ui/desktop/common/css/contents.css?20220221" media="all" />
<style type="text/css" media="print">
	@IMPORT url("http://www.thehandsome.com/_ui/desktop/common/blueprint/print.css");
</style>
<script type="text/javascript" src="http://www.thehandsome.com/_ui/desktop/common/js/jquery.vticker.js"></script>
</head>
<body>
<div id="headerWrap">
	<div class="header header_fixed header_main1903">
		<div class="gnbwarp new201608 clearfix">
        <h1 class="logo logo1903">
            <a href="/mainpage" onclick="GA_Event('공통', '로고', '상단');">thehandsome.com</a>
        </h1>
        <!-- 첫번째 c:if -->

    
    <div id="transparent_mask"></div>
    <!-- 201803 util menu -->
    <div class="util_menu util_menu1803">
        <ul class="clearfix">
            <li><a href="javascript:void(0);"><span class="ico_sh">search</span></a></li>
            <li><a href="/ko/mypage/myWish" onclick="GA_Event('공통','유틸_메뉴','위시리스트');"><span class="ico wishlist">wish list</span> <span class="count">(<span id="wishlistCount">0</span>)</span></a></li>
            <c:forEach items="${countlist}" var="countlist_item">
            <li><a href="/order/orderList" onclick="GA_Event('공통','유틸_메뉴','쇼핑백');"><span class="ico cart">장바구니</span> <span class="count">(<span id="cartCount">${countlist_item.cnt}</span>)</span></a></li>
            </c:forEach>
            </ul>
    </div>
  </div>
	
	
	</div>



  </div>
<!-- bodyWrap -->
<div id="bodyWrap">
    <!--title-->
    <h3 class="cnts_title cnts_tlt1807">
        <span>쇼핑백</span>
    </h3>
    <!--//title-->

    <!-- 장바구니개편 -->
    <span id="shoppingbagCartView">
        <script type="text/javascript">

            if (typeof kakaoPixel !== 'undefined') {
                var kakaoTrackId = '3482319208237780781'; //개발
                if (location.href.indexOf("www.thehandsome.com") > -1) kakaoTrackId = '7855119525940511046'; //운영
                kakaoPixel(kakaoTrackId).pageView();
                kakaoPixel(kakaoTrackId).viewCart();
            }

            $(document).ready(function () {
                var athomeAlertYn = "false";
                var todayDate = new Date();
                var startDate1 = new Date('2021/02/23 00:00:00'), endDate1 = new Date('2021/03/12 08:59:59');
                if (todayDate.getTime() >= startDate1.getTime() && todayDate.getTime() <= endDate1.getTime()) {
                    if (athomeAlertYn == "true") {
                        var la = new layerAlert("앳홈 딜리버리 서비스가 <br>'한섬 케어 플러스(앳홈 클리닝 서비스)'로 <br> 변경 됨에 따라 기존 쇼핑백 내 [앳홈]에 <br> 담아 두셨던 상품은[택배]로 이동하였습니다. 택배 탭을 확인해 주세요.");
                    }
                }

                // 재입고 알림 신청 취소
                $("#rewareHousingCancel").on('click', function () {
                    var lc = new customLayerConfirm("취소하시겠습니까?", "확인", "취소");

                    lc.confirmAction = function () {
                        $(".btn_close").trigger("click");
                    };
                });

                // 재입고 알림 신청
                $("#rewareHousingApply").on('click', function () {
                    var clc = new customLayerConfirm("재입고 알림을 신청하시겠습니까?", "확인", "취소");
                    clc.confirmAction = function () {
                        reqRewarehousingAlram();
                    };
                });

                if ("" == "") {
                    $.ajax({
                        type: "GET",
                        url: "/ko/shoppingbag/isBuyOneclick",
                        dataType: "json",
                        success: function (data) {
                            var isOneclickUser = data.isOneclickUser;

                            if (isOneclickUser == "true" && "" == "") {
                                var html = "<a href='#;' onclick='checkoutOneClick();'><input type='button' value='1 CLICK 결제' class='one_click_pay1910 btn gray mr0'></a>";
                                /** var html = "<a href='#;' onclick='notiAlert();'><input type='button' value='1 CLICK 결제' class='one_click_pay1910 btn gray mr0'></a>";*/
                                $("#checkout_btn_wrap").append(html);
                            }
                        },
                        error: function (xhr, Status, error) {
                            alert('sendRequest error : ' + xhr.status + " ( " + error + " ) ");
                        }
                    });
                }

                /** 2019.11.07 쇼핑백 최초 진입 시 선택 상품 없도록 수정 - 하단 합계 금액 계산 */
                $("#cartDataSubtotal").text("₩" + 0);
                $("#cartDataDeliveryCost").text("₩" + 0);
                $("#cartDataTotalPrice").text("₩" + 0);
            });

            //재입고 완료 신청
            function reqRewarehousingAlram() {

                //로그인체크


                //신청
                $.ajax({
                    url: '/ko/p/setRewareHousing',
                    type: 'GET',
                    datatype: 'json',
                    data:
                    {
                        'code': $('#popupHProduct').val(),
                        'emailAddress': $('#email_address').val() + '@' + $('#email_domain').val(),
                        'CSRFToken': "7a56f3e1-c969-421c-a4ca-faa5d4abcaf5"
                    },
                    success: function (data) {
                        if (data.rsltCd == 'E1') {
                            var clc = new customLayerConfirm("장시간 사용하지 않아 로그아웃 되었습니다.", "확인", "취소");
                            clc.confirmAction = function () {
                                location.href = '/ko/member/login';
                            };
                        } else {
                            var msg = '';
                            if (data.rsltCd == 'S') {
                                msg = "재입고 알림 신청을 완료하였습니다.";
                            } else if (data.rsltCd == 'E2') {
                                msg = "등록된 이메일 정보와 다릅니다.<br />확인 후 다시 시도하여 주세요.";
                            } else if (data.rsltCd == 'E3') {
                                msg = "" + data.userID + "(ID) 로<br/>이미 재입고 알림 신청 이력이 있습니다.<br/>(동일 e-mail)";
                            } else if (data.rsltCd == 'E4') {
                                msg = "이미 신청을 완료하였습니다.";
                            }
                            var cla = new customLayerAlert(msg);
                            cla.confirmAction = function () {
                                hideProductLayer();
                                $(".popwrap").hide();
                            };
                        }
                    },
                    error: function (xhr, Status, error) {
                        var cla = new customLayerAlert("[Error] " + error);
                        return;
                    }
                });

                function hideProductLayer() {
                    $("#productLayer .layerBg").removeClass("white");
                    $("#productLayer").hide();
                }

            }

            function setEcommerceData(idx, action) {

                if (action == "Remove From Cart" || action == "Checkout1(원클릭결제)" || action == "Checkout2(원클릭결제)") {
                    var checkIdx = ",".concat(idx).concat(",");
                    var productData = [];


                    var currentIdx = ",".concat("5").concat(",");

                    if (checkIdx.indexOf(currentIdx) > -1) {
                        /* 상품 정상이월세일 */

                        /*  */


                        if (action == "Remove From Cart") {
                            productData.push({
                                "id": "LP2C1102144QFR_XX_FR2".indexOf("_") > -1 ? "LP2C1102144QFR_XX_FR2".split("_")[0] : "LP2C1102144QFR_XX_FR2", //상품코드
                                "name": "[FRAPIN] 체크메이트 오드퍼퓸 100ml", //상품명
                                "brand": "Liquides Perfume Bar", //상품 브랜드
                                "category": decodeURIComponent("BEAUTY") + "/" + decodeURIComponent("PERFUME") + "/" + decodeURIComponent("PERFUME"), //상품 카테고리
                                "dimension19": "정상상품_정상가" //상품 정상이월세일
                            });
                            var thisCd = "LP2C1102144QFR_XX_FR2";
                            brazeCustomAttribute("Cart", thisCd);
                        } else if (action == "Checkout1(원클릭결제)" || action == "Checkout2(원클릭결제)") {
                            productData.push({
                                "id": "LP2C1102144QFR_XX_FR2".indexOf("_") > -1 ? "LP2C1102144QFR_XX_FR2".split("_")[0] : "LP2C1102144QFR_XX_FR2", //상품코드
                                "name": "[FRAPIN] 체크메이트 오드퍼퓸 100ml", //상품명
                                "brand": "Liquides Perfume Bar", //상품 브랜드
                                "category": decodeURIComponent("BEAUTY") + "/" + decodeURIComponent("PERFUME") + "/" + decodeURIComponent("PERFUME"), //상품 카테고리
                                "variant": "MULTI_FR2", //변형 제품(옵션)
                                "quantity": "1", //상품 수량
                                "dimension19": "정상상품_정상가" //상품 정상이월세일
                            });
                        }
                    }

                    var currentIdx = ",".concat("4").concat(",");

                    if (checkIdx.indexOf(currentIdx) > -1) {
                        /* 상품 정상이월세일 */

                        /*  */


                        if (action == "Remove From Cart") {
                            productData.push({
                                "id": "LP2C1102007QOB_XX_FR1".indexOf("_") > -1 ? "LP2C1102007QOB_XX_FR1".split("_")[0] : "LP2C1102007QOB_XX_FR1", //상품코드
                                "name": "[OBVIOUS] 프와브르 오드퍼퓸 100ml", //상품명
                                "brand": "Liquides Perfume Bar", //상품 브랜드
                                "category": decodeURIComponent("BEAUTY") + "/" + decodeURIComponent("PERFUME") + "/" + decodeURIComponent("PERFUME"), //상품 카테고리
                                "dimension19": "정상상품_정상가" //상품 정상이월세일
                            });
                            var thisCd = "LP2C1102007QOB_XX_FR1";
                            brazeCustomAttribute("Cart", thisCd);
                        } else if (action == "Checkout1(원클릭결제)" || action == "Checkout2(원클릭결제)") {
                            productData.push({
                                "id": "LP2C1102007QOB_XX_FR1".indexOf("_") > -1 ? "LP2C1102007QOB_XX_FR1".split("_")[0] : "LP2C1102007QOB_XX_FR1", //상품코드
                                "name": "[OBVIOUS] 프와브르 오드퍼퓸 100ml", //상품명
                                "brand": "Liquides Perfume Bar", //상품 브랜드
                                "category": decodeURIComponent("BEAUTY") + "/" + decodeURIComponent("PERFUME") + "/" + decodeURIComponent("PERFUME"), //상품 카테고리
                                "variant": "MULTI_FR1", //변형 제품(옵션)
                                "quantity": "1", //상품 수량
                                "dimension19": "정상상품_정상가" //상품 정상이월세일
                            });
                        }
                    }

                    var currentIdx = ",".concat("3").concat(",");

                    if (checkIdx.indexOf(currentIdx) > -1) {
                        /* 상품 정상이월세일 */

                        /*  */


                        if (action == "Remove From Cart") {
                            productData.push({
                                "id": "LP2C1102118QCR_XX_FR1".indexOf("_") > -1 ? "LP2C1102118QCR_XX_FR1".split("_")[0] : "LP2C1102118QCR_XX_FR1", //상품코드
                                "name": "[Carine Roitfeld] 칼-와이 오드퍼퓸 90ml", //상품명
                                "brand": "Liquides Perfume Bar", //상품 브랜드
                                "category": decodeURIComponent("BEAUTY") + "/" + decodeURIComponent("PERFUME") + "/" + decodeURIComponent("PERFUME"), //상품 카테고리
                                "dimension19": "정상상품_정상가" //상품 정상이월세일
                            });
                            var thisCd = "LP2C1102118QCR_XX_FR1";
                            brazeCustomAttribute("Cart", thisCd);
                        } else if (action == "Checkout1(원클릭결제)" || action == "Checkout2(원클릭결제)") {
                            productData.push({
                                "id": "LP2C1102118QCR_XX_FR1".indexOf("_") > -1 ? "LP2C1102118QCR_XX_FR1".split("_")[0] : "LP2C1102118QCR_XX_FR1", //상품코드
                                "name": "[Carine Roitfeld] 칼-와이 오드퍼퓸 90ml", //상품명
                                "brand": "Liquides Perfume Bar", //상품 브랜드
                                "category": decodeURIComponent("BEAUTY") + "/" + decodeURIComponent("PERFUME") + "/" + decodeURIComponent("PERFUME"), //상품 카테고리
                                "variant": "MULTI_FR1", //변형 제품(옵션)
                                "quantity": "1", //상품 수량
                                "dimension19": "정상상품_정상가" //상품 정상이월세일
                            });
                        }
                    }

                    var currentIdx = ",".concat("2").concat(",");

                    if (checkIdx.indexOf(currentIdx) > -1) {
                        /* 상품 정상이월세일 */

                        /*  */


                        if (action == "Remove From Cart") {
                            productData.push({
                                "id": "101110025_MU_FR".indexOf("_") > -1 ? "101110025_MU_FR".split("_")[0] : "101110025_MU_FR", //상품코드
                                "name": "[5월스페셜세트] 시그니처 프레스티지 크림 30ml", //상품명
                                "brand": "oera", //상품 브랜드
                                "category": decodeURIComponent("BEAUTY") + "/" + decodeURIComponent("SKINCARE") + "/" + decodeURIComponent("TONER-EMULSION-CREAM"), //상품 카테고리
                                "dimension19": "정상상품_정상가" //상품 정상이월세일
                            });
                            var thisCd = "101110025_MU_FR";
                            brazeCustomAttribute("Cart", thisCd);
                        } else if (action == "Checkout1(원클릭결제)" || action == "Checkout2(원클릭결제)") {
                            productData.push({
                                "id": "101110025_MU_FR".indexOf("_") > -1 ? "101110025_MU_FR".split("_")[0] : "101110025_MU_FR", //상품코드
                                "name": "[5월스페셜세트] 시그니처 프레스티지 크림 30ml", //상품명
                                "brand": "oera", //상품 브랜드
                                "category": decodeURIComponent("BEAUTY") + "/" + decodeURIComponent("SKINCARE") + "/" + decodeURIComponent("TONER-EMULSION-CREAM"), //상품 카테고리
                                "variant": "MULTI_FR", //변형 제품(옵션)
                                "quantity": "1", //상품 수량
                                "dimension19": "정상상품_정상가" //상품 정상이월세일
                            });
                        }
                    }

                    var currentIdx = ",".concat("1").concat(",");

                    if (checkIdx.indexOf(currentIdx) > -1) {
                        /* 상품 정상이월세일 */

                        /*  */


                        if (action == "Remove From Cart") {
                            productData.push({
                                "id": "101110021_MU_FR".indexOf("_") > -1 ? "101110021_MU_FR".split("_")[0] : "101110021_MU_FR", //상품코드
                                "name": "[5월스페셜세트] 블루 미네랄 선 크림 SPF30", //상품명
                                "brand": "oera", //상품 브랜드
                                "category": decodeURIComponent("BEAUTY") + "/" + decodeURIComponent("SKINCARE") + "/" + decodeURIComponent("TONER-EMULSION-CREAM"), //상품 카테고리
                                "dimension19": "정상상품_정상가" //상품 정상이월세일
                            });
                            var thisCd = "101110021_MU_FR";
                            brazeCustomAttribute("Cart", thisCd);
                        } else if (action == "Checkout1(원클릭결제)" || action == "Checkout2(원클릭결제)") {
                            productData.push({
                                "id": "101110021_MU_FR".indexOf("_") > -1 ? "101110021_MU_FR".split("_")[0] : "101110021_MU_FR", //상품코드
                                "name": "[5월스페셜세트] 블루 미네랄 선 크림 SPF30", //상품명
                                "brand": "oera", //상품 브랜드
                                "category": decodeURIComponent("BEAUTY") + "/" + decodeURIComponent("SKINCARE") + "/" + decodeURIComponent("TONER-EMULSION-CREAM"), //상품 카테고리
                                "variant": "MULTI_FR", //변형 제품(옵션)
                                "quantity": "1", //상품 수량
                                "dimension19": "정상상품_정상가" //상품 정상이월세일
                            });
                        }
                    }

                    var currentIdx = ",".concat("0").concat(",");

                    if (checkIdx.indexOf(currentIdx) > -1) {
                        /* 상품 정상이월세일 */

                        /*  */


                        if (action == "Remove From Cart") {
                            productData.push({
                                "id": "CM2C4TTO340WP2_SG_82".indexOf("_") > -1 ? "CM2C4TTO340WP2_SG_82".split("_")[0] : "CM2C4TTO340WP2_SG_82", //상품코드
                                "name": "슬리브리스 티셔츠", //상품명
                                "brand": "the CASHMERE", //상품 브랜드
                                "category": decodeURIComponent("WOMEN") + "/" + decodeURIComponent("TOP") + "/" + decodeURIComponent("T-SHIRTS"), //상품 카테고리
                                "dimension19": "정상상품_정상가" //상품 정상이월세일
                            });
                            var thisCd = "CM2C4TTO340WP2_SG_82";
                            brazeCustomAttribute("Cart", thisCd);
                        } else if (action == "Checkout1(원클릭결제)" || action == "Checkout2(원클릭결제)") {
                            productData.push({
                                "id": "CM2C4TTO340WP2_SG_82".indexOf("_") > -1 ? "CM2C4TTO340WP2_SG_82".split("_")[0] : "CM2C4TTO340WP2_SG_82", //상품코드
                                "name": "슬리브리스 티셔츠", //상품명
                                "brand": "the CASHMERE", //상품 브랜드
                                "category": decodeURIComponent("WOMEN") + "/" + decodeURIComponent("TOP") + "/" + decodeURIComponent("T-SHIRTS"), //상품 카테고리
                                "variant": "GREY_82", //변형 제품(옵션)
                                "quantity": "1", //상품 수량
                                "dimension19": "정상상품_정상가" //상품 정상이월세일
                            });
                        }
                    }


                    if (productData.length > 0) {
                        if (action == "Remove From Cart") {
                            dataLayer.push({
                                'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Remove From Cart', 'layerLabel': undefined,
                                'ecommerce': {
                                    'currencyCode': 'KRW', //통화
                                    'remove': {
                                        'products': productData
                                    }
                                }
                            });
                        } else if (action == "Checkout1(원클릭결제)") {
                            dataLayer.push({
                                'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Checkout', 'layerLabel': '원클릭결제',
                                'ecommerce': {
                                    'currencyCode': 'KRW', //통화
                                    'checkout': {
                                        'actionField': { 'step': 1 }, //결제단계
                                        'products': productData
                                    }
                                }
                            });
                        } else if (action == "Checkout2(원클릭결제)") {
                            dataLayer.push({
                                'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Checkout', 'layerLabel': '원클릭결제',
                                'ecommerce': {
                                    'currencyCode': 'KRW', //통화
                                    'checkout': {
                                        'actionField': { 'step': 2, 'option': '1CLICK 결제' }, //결제단계 및 결제수단
                                        'products': productData
                                    }
                                }
                            });
                        }
                    }
                } else if (action == "Click ADD") {

                    if ("0" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_담은 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "LP2C1102144QFR_XX_FR2".indexOf("_") > -1 ? "LP2C1102144QFR_XX_FR2".split("_")[0] : "LP2C1102144QFR_XX_FR2", //상품코드
                                            "name": "[FRAPIN] 체크메이트 오드퍼퓸 100ml", //상품명
                                            "brand": "Liquides Perfume Bar", //상품 브랜드

                                            "category": decodeURIComponent("BEAUTY") + "/" + decodeURIComponent("PERFUME") + "/" + decodeURIComponent("PERFUME"), //상품 카테고리

                                            "position": 9 //상품 위치

                                        }]
                                }
                            }
                        });
                    }

                    if ("1" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_담은 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "LP2C1102007QOB_XX_FR1".indexOf("_") > -1 ? "LP2C1102007QOB_XX_FR1".split("_")[0] : "LP2C1102007QOB_XX_FR1", //상품코드
                                            "name": "[OBVIOUS] 프와브르 오드퍼퓸 100ml", //상품명
                                            "brand": "Liquides Perfume Bar", //상품 브랜드

                                            "category": decodeURIComponent("BEAUTY") + "/" + decodeURIComponent("PERFUME") + "/" + decodeURIComponent("PERFUME"), //상품 카테고리

                                            "position": 9 //상품 위치

                                        }]
                                }
                            }
                        });
                    }

                    if ("2" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_담은 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "LP2C1102118QCR_XX_FR1".indexOf("_") > -1 ? "LP2C1102118QCR_XX_FR1".split("_")[0] : "LP2C1102118QCR_XX_FR1", //상품코드
                                            "name": "[Carine Roitfeld] 칼-와이 오드퍼퓸 90ml", //상품명
                                            "brand": "Liquides Perfume Bar", //상품 브랜드

                                            "category": decodeURIComponent("BEAUTY") + "/" + decodeURIComponent("PERFUME") + "/" + decodeURIComponent("PERFUME"), //상품 카테고리

                                            "position": 9 //상품 위치

                                        }]
                                }
                            }
                        });
                    }

                    if ("3" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_담은 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "101110025_MU_FR".indexOf("_") > -1 ? "101110025_MU_FR".split("_")[0] : "101110025_MU_FR", //상품코드
                                            "name": "[5월스페셜세트] 시그니처 프레스티지 크림 30ml", //상품명
                                            "brand": "oera", //상품 브랜드

                                            "category": decodeURIComponent("BEAUTY") + "/" + decodeURIComponent("SKINCARE") + "/" + decodeURIComponent("TONER-EMULSION-CREAM"), //상품 카테고리

                                            "position": 9 //상품 위치

                                        }]
                                }
                            }
                        });
                    }

                    if ("4" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_담은 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "101110021_MU_FR".indexOf("_") > -1 ? "101110021_MU_FR".split("_")[0] : "101110021_MU_FR", //상품코드
                                            "name": "[5월스페셜세트] 블루 미네랄 선 크림 SPF30", //상품명
                                            "brand": "oera", //상품 브랜드

                                            "category": decodeURIComponent("BEAUTY") + "/" + decodeURIComponent("SKINCARE") + "/" + decodeURIComponent("TONER-EMULSION-CREAM"), //상품 카테고리

                                            "position": 9 //상품 위치

                                        }]
                                }
                            }
                        });
                    }

                    if ("5" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_담은 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "CM2C4TTO340WP2_SG_82".indexOf("_") > -1 ? "CM2C4TTO340WP2_SG_82".split("_")[0] : "CM2C4TTO340WP2_SG_82", //상품코드
                                            "name": "슬리브리스 티셔츠", //상품명
                                            "brand": "the CASHMERE", //상품 브랜드

                                            "category": decodeURIComponent("WOMEN") + "/" + decodeURIComponent("TOP") + "/" + decodeURIComponent("T-SHIRTS"), //상품 카테고리

                                            "position": 9 //상품 위치

                                        }]
                                }
                            }
                        });
                    }

                } else if (action == "Click RECOMMEND") {

                    if ("0" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "CM2C4WSC361WM3".indexOf("_") > -1 ? "CM2C4WSC361WM3".split("_")[0] : "CM2C4WSC361WM3", //상품코드
                                            "name": "스티치 라인 밴딩 플레어 스커트", //상품명
                                            "brand": "the CASHMERE", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("1" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "CM2C4WJC168WM1".indexOf("_") > -1 ? "CM2C4WJC168WM1".split("_")[0] : "CM2C4WJC168WM1", //상품코드
                                            "name": "린넨 블렌드 칼라리스 재킷", //상품명
                                            "brand": "the CASHMERE", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("2" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "FL2C7HSY017LVV".indexOf("_") > -1 ? "FL2C7HSY017LVV".split("_")[0] : "FL2C7HSY017LVV", //상품코드
                                            "name": "[VACAVALIENTE] 더블 홀더 카드지갑", //상품명
                                            "brand": "the CASHMERE", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("3" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "101110009".indexOf("_") > -1 ? "101110009".split("_")[0] : "101110009", //상품코드
                                            "name": "하이드라리프트 에센스-인-워터", //상품명
                                            "brand": "oera", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("4" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "LP2C1102146QFR".indexOf("_") > -1 ? "LP2C1102146QFR".split("_")[0] : "LP2C1102146QFR", //상품코드
                                            "name": "[FRAPIN] 이프 바이 알케이 오드퍼퓸 100ml", //상품명
                                            "brand": "Liquides Perfume Bar", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("5" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "101110026".indexOf("_") > -1 ? "101110026".split("_")[0] : "101110026", //상품코드
                                            "name": "[5월스페셜세트] 멀티-베네핏 캘리브레이터", //상품명
                                            "brand": "oera", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("6" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "LP2C1102150QFR".indexOf("_") > -1 ? "LP2C1102150QFR".split("_")[0] : "LP2C1102150QFR", //상품코드
                                            "name": "[FRAPIN] 휴머니스트 오드퍼퓸 100ml", //상품명
                                            "brand": "Liquides Perfume Bar", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("7" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "101110010".indexOf("_") > -1 ? "101110010".split("_")[0] : "101110010", //상품코드
                                            "name": "하이드라리프트 에센스-인-로션", //상품명
                                            "brand": "oera", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("8" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "LP2C1102149QFR".indexOf("_") > -1 ? "LP2C1102149QFR".split("_")[0] : "LP2C1102149QFR", //상품코드
                                            "name": "[FRAPIN] 디 오키드 맨 오드퍼퓸 100ml", //상품명
                                            "brand": "Liquides Perfume Bar", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("9" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "LP2C1102151QFR".indexOf("_") > -1 ? "LP2C1102151QFR".split("_")[0] : "LP2C1102151QFR", //상품코드
                                            "name": "[FRAPIN] 일이칠공 오드퍼퓸 100ml", //상품명
                                            "brand": "Liquides Perfume Bar", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("10" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "101110018".indexOf("_") > -1 ? "101110018".split("_")[0] : "101110018", //상품코드
                                            "name": "레질리언스 아이크림", //상품명
                                            "brand": "oera", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("11" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "LP2C1102071QBD".indexOf("_") > -1 ? "LP2C1102071QBD".split("_")[0] : "LP2C1102071QBD", //상품코드
                                            "name": "[BDK] 타박 로즈 오드퍼퓸 100ml", //상품명
                                            "brand": "Liquides Perfume Bar", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("12" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "LP2C1102068QBD".indexOf("_") > -1 ? "LP2C1102068QBD".split("_")[0] : "LP2C1102068QBD", //상품코드
                                            "name": "[BDK] 벨벳 통카 오드퍼퓸 100ml", //상품명
                                            "brand": "Liquides Perfume Bar", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("13" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "101110024".indexOf("_") > -1 ? "101110024".split("_")[0] : "101110024", //상품코드
                                            "name": "시그니처 프레스티지 크림", //상품명
                                            "brand": "oera", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("14" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "LP2C1102114QCR".indexOf("_") > -1 ? "LP2C1102114QCR".split("_")[0] : "LP2C1102114QCR", //상품코드
                                            "name": "[Carine Roitfeld] 오렐리앙 오드퍼퓸 90ml", //상품명
                                            "brand": "Liquides Perfume Bar", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("15" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "101110023".indexOf("_") > -1 ? "101110023".split("_")[0] : "101110023", //상품코드
                                            "name": "시그니처 프레스티지 앰플", //상품명
                                            "brand": "oera", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("16" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "101110007".indexOf("_") > -1 ? "101110007".split("_")[0] : "101110007", //상품코드
                                            "name": "컴포트 클렌징 밀크", //상품명
                                            "brand": "oera", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("17" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "LP2C1102064QBD".indexOf("_") > -1 ? "LP2C1102064QBD".split("_")[0] : "LP2C1102064QBD", //상품코드
                                            "name": "[BDK] 우드 자스민 오드퍼퓸 100ml", //상품명
                                            "brand": "Liquides Perfume Bar", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("18" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "LC2C3KTO248W".indexOf("_") > -1 ? "LC2C3KTO248W".split("_")[0] : "LC2C3KTO248W", //상품코드
                                            "name": "글리터 컬러 라인 슬리브리스 탑", //상품명
                                            "brand": "LANVIN COLLECTION", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("19" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "FL2C1HCO025LBG".indexOf("_") > -1 ? "FL2C1HCO025LBG".split("_")[0] : "FL2C1HCO025LBG", //상품코드
                                            "name": "[BEIGIC] 컴포팅 크림", //상품명
                                            "brand": "the CASHMERE", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                    if ("20" == idx) {
                        dataLayer.push({
                            'event': 'ga_event', 'layerCategory': 'Ecommerce', 'layerAction': 'Click', 'layerLabel': undefined,
                            'ecommerce': {
                                'currencyCode': 'KRW', //통화
                                'click': {
                                    'actionField': { 'list': '쇼핑백_추천 상품' }, //상품 리스트명
                                    'products':
                                        [{
                                            "id": "LP2C1102072QBD".indexOf("_") > -1 ? "LP2C1102072QBD".split("_")[0] : "LP2C1102072QBD", //상품코드
                                            "name": "[BDK] 프렌치 부케 오드퍼퓸 100ml", //상품명
                                            "brand": "Liquides Perfume Bar", //상품 브랜드
                                            "category": "", //상품 카테고리

                                            "position": 10 //상품 위치

                                        }]
                                }
                            }
                        });

                        brazeLogCustomEvent(idx, "RECOMMEND");
                    }

                }
                /* Ecommerce data 초기화
                        dataLayer에 남아 있는 경우에는 전자상거래 단계만을 위해 사용하는
                        필드들이 세팅되어 있으므로 undefined를 통해 초기화합니다. */
                dataLayer.push({
                    'layerCategory': undefined,
                    'layerAction': undefined,
                    'nonInteraction': false,
                    'ecommerce': undefined
                });

            }

            function notiAlert() {
                var msg = "원클릭결제  서비스가 원활하지 않습니다. <br><br>모바일앱을 이용하시거나 <br>'일반결제' 또는 '주문서 내 원클릭결제'를<br>이용해주시길 바랍니다.<br><br> 빠른 시일내에 원활한 서비스를 위해<br> 최선을 다하겠습니다.<br> 이용에 불편을 드려 죄송합니다.";
                var cla = new customLayerAlert(msg);
                cla.confirmAction = function () {
                    $("#productLayer .layerBg").removeClass("white");
                    $("#productLayer").hide();
                    $(".popwrap").hide();
                };
            }

        </script>
        <!--sub_container-->
        <div class="sub_container ">
            <!--order wrap-->
            <div class="shopping_cart_tab1807 tab_a">
                <!-- 장바구니개편 -->
                <ul class="tab3">
                    <c:forEach items="${countlist}" var="countlist_item">
                        <li>
                            <a href="#;" name="cartDivision" data-division=""
                                onclick="GA_Event('쇼핑백', '탭', '택배');"><span class="delt_ico"></span>택배
                                (${countlist_item.cnt})</a>
                        </li>
                        <li>
                        <a href="#;" name="cartDivision" data-division="store" onclick="GA_Event('쇼핑백', '탭', '매장수령');" ><span class="spt_ico"></span>매장수령 (0)</a>
                        </li>
                    <li>
                        <a href="#;" name="cartDivision" data-division="quick" onclick="GA_Event('쇼핑백', '탭', '퀵배송                                           ');" ><span class="quk_ico"></span>퀵배송                                            (0)</a>
                    </li>
                        
                    </c:forEach>
                </ul>
                <!-- //장바구니개편 -->
            </div>

            <div class="orderwrap1807">
                <div class="tbl_info_wrap">
                    <p class="cart_top_text">
                    </p>

                    <div class="fourpm_pd_ck">
                        <div class="input_wrap">
                        </div>
                    </div>
                </div>
                <!--shoppingback table-->
                <div class="tblwrap">
                    <table class="tbl_ltype">
                        <caption>
                            쇼핑백</caption>
                        <colgroup>
                            <!-- <col style="width: 10px;" /> -->
                            <col />
                            <col style="width: 120px" />
                            <col style="width: 105px" />
                            <!-- <col style="width: 140px" /> -->
                            <col style="width: 110px" />
                        </colgroup>
                        <thead>
                            <tr>
                                
                                <th scope="col">상품정보</th>
                                <th scope="col">수량</th>
                                <th scope="col">판매가</th>
                                <!-- <th scope="col">적립율</th> -->
                                <th scope="col">선택</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="list_item">
                                <tr name="entryProductInfo" data-pk="10683150630956" data-deliverykind=""
                                    data-outofstock="false" data-category="BE041">
                                    
                                    <td class="pt_list_wrap">
                                        <!-- pt_list_all -->
                                        <div class="pt_list_all">
                                            <a href="">
                                                <img src="${list_item.image_url}" alt=""
                                                    style="width: 100px; height: 100px;" />
                                            </a>
                                            <div class="tlt_wrap">
                                                <a href="" class="basket_tlt">
                                                    <span class="tlt">${list_item.bname}</span>
                                                    <span class="sb_tlt">
                                                        ${list_item.pname}</span>
                                                </a>

                                                <!-- <p class="color_op">

                                                    color : MULTI<span class="and_line">/</span>

                                                    size : FR2</p> -->


                                                <!-- <div class="option_wrap">
                                                    <div class="oera_shipping_guide1">
                                                        <span>리퀴드 퍼퓸바 상품은 전용 박스로 배송</span>됩니다.<br>(다른 브랜드와 함께 주문 시, 리퀴드
                                                        퍼퓸바는 별도 배송)
                                                    </div>
                                                    <a href="#none" class="btn_option"
                                                        id="optOpenLayer^5^LP2C1102144QFR_XX"
                                                        onclick="GA_Event('쇼핑백','옵션변경', '[FRAPIN] 체크메이트 오드퍼퓸 100ml')">옵션변경</a>
                                                </div> -->
                                            </div>
                                        </div>
                                        <!-- //pt_list_all-->
                                    </td>
                                    <td class="al_middle">
                                        <!-- <form id="updateCartForm5"
                                            data-cart="{&quot;cartCode&quot; : &quot;370021693&quot;,&quot;productPostPrice&quot;:&quot;239000.0&quot;,&quot;productName&quot;:&quot;[FRAPIN] 체크메이트 오드퍼퓸 100ml&quot;}"
                                            action="/ko/shoppingbag/update" method="post"> -->
                                        <!-- <input type="hidden"
                                                name="entryNumber" value="5" />
                                            <input type="hidden" name="productCode" value="LP2C1102144QFR_XX_FR2" />
                                            <input type="hidden" name="initialQuantity" value="1" />
                                            <input type="hidden" name="chgProductCode" value="" />
                                            <input type="hidden" name="curSize" value="FR2" />
                                            <input type="hidden" name="storeId" value="" />
                                            <input type="hidden" name="storePickupDate" value="" />
                                            <input type="hidden" name="deliveryKind" value="" />
                                            <input type="hidden" name="cartDivision" value="" /> -->
                                        <!-- qty_sel -->
                                        <span class="qty_sel num">
                                            ${list_item.oamount}
                                            <!-- <a href="#none"
                                                    onMouseDown="javascript:AEC_F_D('LP2C1102144QFR_XX_FR2','o',1);"
                                                    class="left" onclick="GA_Event('쇼핑백', '수량', '-');">이전 버튼</a>
                                                <input id="quantity5" name="quantity" type="text" class="mr0" value="1"
                                                    size="1" maxlength="3" /><a href="#none"
                                                    onMouseDown="javascript:AEC_F_D('LP2C1102144QFR_XX_FR2','i',1);"
                                                    class="right" onclick="GA_Event('쇼핑백', '수량', '+');">다음 버튼</a> -->
                                        </span>
                                        <!-- //qty_sel -->
                                        <!-- <a href="#none" id="QuantityProduct_5" class="btn wt_ss qty_w mr0">변경</a> -->
                                        <!-- <div>
                                                <input type="hidden" name="CSRFToken"
                                                    value="7a56f3e1-c969-421c-a4ca-faa5d4abcaf5" />
                                            </div> -->
                                        <!-- </form> -->
                                    </td>
                                    <td class="al_middle">
                                        <!-- Price -->
                                        <div class="price_wrap">
                                            <span>₩${list_item.pprice}</span>
                                            <!-- <input type="hidden" name="checkZeroPrice"
                                                value="239000.0" /> -->
                                        </div> <!-- //Price -->
                                    </td>
                                    <!-- <td class="al_middle">
                                        <span class="earn">5% (한섬마일리지)</span>
                                        <br>
                                        <span class="earn">0.1% (H.Point)</span>
                                    </td> -->
                                    <td class="al_middle">
                                        <!-- Button size -->
                                        <div class="btn_wrap">
                                            <a href="/order/delete?param1=${list_item.pid}&param2=mid" id="RemoveProduct_5" class="btn wt_ss">삭제</a>
                                        </div> <!-- //Button size -->
                                    </td>
                                </tr>
                                <!-- Info wrap -->
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--// shoppingback table-->
                <!--Total wrap-->
                <div class="total_wrap">
                    <!-- total -->
                    <div class="total_price_wrap">
                        <dl>
                            <dt>
                                상품 합계</dt>
                            <dd>
                                <c:forEach items="${pricelist}" var="pricelist_item">
                                    <span id="cartDataSubtotal">₩${pricelist_item.total}</span>
                                </c:forEach>
                            </dd>
                            <dt class="delch_wrap">
                                <p class="tlt_ship">배송비</p>
                                <!--delivery charge layer popup-->
                                <div class="delch_box" style="display: none;">
                                    <span class="arr">위치아이콘</span>
                                    <ul class="bul_sty01_li">
                                        <li>쿠폰/바우처 할인금액 및 한섬마일리지/H.Point 사용을 제외한 실 결제금액 기준 <strong>3만원 미만 결제 시 2,500원
                                                배송비가 부과</strong> 됩니다.(3만원 이상 구매 시 무료배송)</li>
                                        <li>도서산간 지역은 배송비가 추가 될 수 있습니다.</li>
                                        <li>한섬마일리지, H.Point, e-money로 배송비 결제가 불가합니다.</li>
                                    </ul>
                                </div>
                                <!--//delivery charge layer popup-->
                            </dt>
                            <dd>
                                <span id="cartDataDeliveryCost">₩ 0</span>
                            </dd>
                        </dl>
                        <dl class="total ">
                            <dt>
                                합계</dt>
                            <dd>
                                <c:forEach items="${pricelist}" var="pricelist_item">
                                    <span id="cartDataTotalPrice">₩${pricelist_item.total}</span>
                                </c:forEach>
                            </dd>
                        </dl>
                    </div>
                    <div class="total_count1807">
                        <c:forEach items="${countlist}" var="countlist_item">
                            <p>총 <span id="selectProductCount">${countlist_item.cnt}</span>개 상품</p>
                        </c:forEach>
                    </div>
                    <!-- //total -->
                </div>
                <!--//Total wrap-->
                <!--button wrap-->
                
                <div class="promotion_wrap mt60" id="freeGiftPromotion">
                    <dl class="promotion_list" style="border-top:1px solid #ebebeb; padding:60px 20px 18px 20px">
                        <dt class="promotion_tit">PROMOTION 혜택</dt>
                        <dd class="promotion_con1">
                            <strong>혜택 1 /

                                구매하신 고객님께 사은품을 드립니다.
                            </strong>
                            <ul class="bul_sty01_li promotion_img">
                                <li class="img"><img
                                        src="http://www.thehandsome.com/medias/2022-04-12-mine0408-copy-2-1.jpg?context=bWFzdGVyfHJvb3R8MTM4NzE1NjR8aW1hZ2UvanBlZ3xoMjIvaDk5LzkyOTYyNzI2MjE1OTguanBnfGZkNDMxMGJjNjcyODY3ZmVmYWM3ZWIxN2VmOTg0NzkxMzUzYTllM2UzMjdkZTU0NTZhNmQ3OWY3MzRkNmEyNWQ" />
                                </li>
                                <li>사은품 : 마인뷰티_캔버스립파우치</li>
                                <li>기간 내 마인 립제품 (MN2C5HCO002W) 구매 고객에게 캔버스 립 파우치를 1개를 드립니다. <BR /> 사은품은 주문하신 배송지로 상품과 함께
                                    발송됩니다.<BR />기간 : 5월 3일~ 5월31일 (소진 시 종료), 반품 시 사은품 동봉 필수<BR />사은품은 주문 당 1 개 제공</li>
                            </ul>
                        </dd>
                        <dd class="promotion_con2">
                            <strong>혜택 2 /

                                구매하신 고객님께 사은품을 드립니다.
                            </strong>
                            <ul class="bul_sty01_li promotion_img">
                                <li class="img"><img
                                        src="http://www.thehandsome.com/medias/0414-01273-2000.jpg?context=bWFzdGVyfHJvb3R8OTA1OTMyfGltYWdlL2pwZWd8aDE2L2hlMS85Mjk2MjcwNTI0NDQ2LmpwZ3w5ZDc5NGMzMGMxNGIyNTdmNWQwOWMzMDIxNzI5MDZjNDM4YzBiOTljOWUyYzAzNWM5OGVhZjA4OTYxNDIzMzZi" />
                                </li>
                                <li>사은품 : 마인 뷰티_블리스터</li>
                                <li>마인 비건 뷰티 아이템 첫 런칭 기념, 기간 내 마인 정상 구매 고객에게 뷰티 체험 가능한 "블리스터"를 드립니다. (쿠션 21호 와 레브르 듀 마뜨
                                    4컬러)<BR /> 블리스터 내 QR을 스캔하면 배우 박규영과 함께한 마인 뷰티 화보를 볼 수 있습니다. <BR /> 기간 :05/03~ 05/31
                                    (소진 시 종료)<BR /> 블리스터는 주문 1 건 당 1 개 증정, 반품 시 사은품 동봉 필수</li>
                            </ul>
                        </dd>
                        <dd class="promotion_con1">
                            <strong>혜택 3 /

                                구매하신 고객님께 사은품을 드립니다.
                            </strong>
                            <ul class="bul_sty01_li promotion_img">
                                <li class="img"><img
                                        src="http://www.thehandsome.com/medias/-.jpg?context=bWFzdGVyfHJvb3R8NTI3OTMwfGltYWdlL2pwZWd8aGNiL2hhMS85Mjk2MjcwMTMxMjMwLmpwZ3wwMjcyOTU4ZWIwNDk4ZjBlYTkxYzYwYTE2ZWFlMzZlNTJmNTdhZDdhMDgwMDlkYzI3NzkwMjk3YmRmYjk2OGIz" />
                                </li>
                                <li>사은품 : 오에라_쇼핑백, 감사카드</li>
                                <li>가정의 달을 맞아 기간 내 오에라 [5월 스페셜세트] 구매 고객님께 "오에라 쇼핑백 & 감사카드"를 드립니다.<BR>사은품은 주문하신 배송지로 상품과
                                    함께 발송됩니다. <BR>기간 : 5월 1일 ~ 5월 31일까지 (선착순 증정)</li>
                            </ul>
                        </dd>
                        <dd class="promotion_con2">
                            <strong>혜택 4 /

                                구매하신 고객님께 사은품을 드립니다.
                            </strong>
                            <ul class="bul_sty01_li promotion_img">
                                <li class="img"><img
                                        src="http://www.thehandsome.com/medias/KakaoTalk-20220421-111328678.jpg?context=bWFzdGVyfHJvb3R8MTMyNzU3MHxpbWFnZS9qcGVnfGhhOS9oMzcvOTI5NTc2NjU1MjYwNi5qcGd8YzNlZjk4ZjRkMWVkNTA1MTlkNGJiMmU4NGRhZTY2MmM2ZDgzMmU5MmY4MzU4YzY3NzRhNDI2OWJmNjMxMDkyOQ" />
                                </li>
                                <li>사은품 : Liquides 시그니처 기프트 박스</li>
                                <li>기간 내 리퀴드 퍼퓸바 향수 구매 고객님께 시그니처 기프트 박스를 사은품으로 드립니다.<BR>주문 1건당 박스는 1개 제공되며, 사이즈는 구매하신 향수
                                    갯수에 따라 제공됩니다. (S/M/L 선택 불가) 사은품은 주문하신 배송지로 상품과 함께 발송됩니다. <BR>- 기간 : 5월 2일 ~ 5월 20일까지
                                    (선착순 증정)</li>
                            </ul>
                        </dd>
                        <dd class="promotion_con1">
                            <strong>혜택 5 /
                                400,000원 이상

                                구매하신 고객님께 사은품을 드립니다.
                            </strong>
                            <ul class="bul_sty01_li promotion_img">
                                <li class="img"><img
                                        src="http://www.thehandsome.com/medias/GIFT.jpg?context=bWFzdGVyfHJvb3R8MTIxMzc4fGltYWdlL2pwZWd8aDcxL2g0YS85Mjk1NTI4MTY1NDA2LmpwZ3xlMjY3YjJlNWVhYWM3NzNhZGY2ZTQxYzA5MTFmYTRlMGY3MjcwMWIzNTIzZmY4NTNiZjAzMjU4NjgzOTEyMTUz" />
                                </li>
                                <li>사은품 : 더한섬닷컴 GIFT_켈리박 3단 우산</li>
                                <li>기간 내 정상 40만원 이상 구매 고객님께 구매 사은품으로 더한섬닷컴 X</BR>켈리박 작가와 함께한 3단 우산을 드립니다.</BR>추가로 해당 기간
                                    내 선착순 1명에게는 직접 드로잉 한 양산, 구매금액 BEST 고객 1명에게는 레더백이 함께 발송될 예정입니다. (실 결제금액 기준, 아울렛 상품 구매
                                    금액 제외)</BR>
                                    - 기간 : 5월 2일 ~ 소진시 까지 (선착순 증정)</BR>사은품은 이벤트 종료 후, 취소 및 반품을 고려하여 5월 31일 이후 일괄 발송
                                    예정입니다. (1~3일 지연 가능)</li>
                            </ul>
                        </dd>
                    </dl>
                </div>
            </div>
            <!--//order wrap-->
        </div>
        <!--//sub_container-->
    </span>
    <!-- // 장바구니개편 -->

    <!--Guide table-->
    <div class="gd_wrap mt60">
        <dl class="shoppingbag_list">
            <dt>
                쇼핑백 이용안내</dt>
            <dd class="shoppingbag_list_text">
                <ul class="bul_sty01_li">
                    <li>쇼핑백에 담긴 상품은 30일 동안 보관됩니다. 30일이 지난 상품 자동 삭제됩니다.<br />더 오래 보관하고 싶은 상품은 위시리스트에 담아주세요.</li>
                    <li>쇼핑백에 최대 50개까지 상품 보관이 가능하며, 실제 구매 시에는 가격이나 혜택이 변동될 수 있습니다.</li>

                    <li>쇼핑백에 담은 상품이 판매종료가 되었을 경우 자동 삭제 됩니다.</li>
                    <li>쿠폰은 배송&결제정보 화면에서 입력 할 수 있습니다.</li>
                    <li>상품별 지급율에 따라 한섬마일리지 및 H.POINT가 적립됩니다. 배송완료 10일 이후 적립되며 실 결제금액기준입니다.</li>
                    <li>해외 배송을 원할 경우 더한섬닷컴의 영문 혹은 중문 서비스를 이용해 주시기 바랍니다.</li>
                </ul>
            </dd>
        </dl>
    </div>
    <!--//Guide table-->
</div>
</body>
</html>