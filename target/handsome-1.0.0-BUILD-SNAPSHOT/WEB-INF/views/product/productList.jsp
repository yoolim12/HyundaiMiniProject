<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/includes/mainHeader.jsp"%>
<!-- bodyWrap -->
   	<div id="bodyWrap" style="padding-bottom:0;">
		<h3 class="cnts_title ou1804" style="border-top:1px solid #e3e3e3;">
        	<span><!-- 브랜드 카테고리 목록 -->
            	<a href="/product/productList?pageNum=${1}&amount=${pageMaker.cri.amount}">뷰티</a>
            </span>
       	</h3>
	<div class="adaptive_wrap">
       	<form id="categoryListForm" action="/ko/c/categoryList">
	        <!-- sort wrap -->
	        <div class="filterWrap hsDelivery1902">
	            <ul class="clearfix float_left">
	            <!-- 브랜드 정렬 -->
	            	<li class="brand"><a href="javascript:void(0);" class="select" onclick="GA_Event('카테고리_리스트','정렬','브랜드');">브랜드<span class="ico_arr">arrow</span></a>
	                	<div class="list" style="display: none;">
	                    	<ul id="category_brand_chip">
	                        	<li><input type="checkbox" id="brand_ck1" onclick="GA_Event('카테고리_리스트','정렬','TIME');setOnlineShopBrand(this, 'BR01');"><label for="brand_ck1" id="BR01">TIME</label></li>
								<li><input type="checkbox" id="brand_ck2" onclick="GA_Event('카테고리_리스트','정렬','MINE');setOnlineShopBrand(this, 'BR02');"><label for="brand_ck2" id="BR02">MINE</label></li>
								<li><input type="checkbox" id="brand_ck3" onclick="GA_Event('카테고리_리스트','정렬','LANVIN COLLECTION');setOnlineShopBrand(this, 'BR19');"><label for="brand_ck3" id="BR19">LANVIN COLLECTION</label></li>
								<li><input type="checkbox" id="brand_ck4" onclick="GA_Event('카테고리_리스트','정렬','SYSTEM');setOnlineShopBrand(this, 'BR03');"><label for="brand_ck4" id="BR03">SYSTEM</label></li>
								<li><input type="checkbox" id="brand_ck5" onclick="GA_Event('카테고리_리스트','정렬','SJSJ');setOnlineShopBrand(this, 'BR04');"><label for="brand_ck5" id="BR04">SJSJ</label></li>
								<li><input type="checkbox" id="brand_ck6" onclick="GA_Event('카테고리_리스트','정렬','TIME HOMME');setOnlineShopBrand(this, 'BR06');"><label for="brand_ck6" id="BR06">TIME HOMME</label></li>
								<li><input type="checkbox" id="brand_ck7" onclick="GA_Event('카테고리_리스트','정렬','SYSTEM HOMME');setOnlineShopBrand(this, 'BR07');"><label for="brand_ck7" id="BR07">SYSTEM HOMME</label></li>
								<li><input type="checkbox" id="brand_ck8" onclick="GA_Event('카테고리_리스트','정렬','the CASHMERE');setOnlineShopBrand(this, 'BR08');"><label for="brand_ck8" id="BR08">the CASHMERE</label></li>
								<li><input type="checkbox" id="brand_ck9" onclick="GA_Event('카테고리_리스트','정렬','LÄTT');setOnlineShopBrand(this, 'BR31');"><label for="brand_ck9" id="BR31">LÄTT</label></li>
								<li><input type="checkbox" id="brand_ck10" onclick="GA_Event('카테고리_리스트','정렬','OBZEE');setOnlineShopBrand(this, 'BR43');"><label for="brand_ck10" id="BR43">OBZEE</label></li>
								<li><input type="checkbox" id="brand_ck11" onclick="GA_Event('카테고리_리스트','정렬','O&amp;#039;2nd');setOnlineShopBrand(this, 'BR45');"><label for="brand_ck11" id="BR45">O'2nd</label></li>
								<li><input type="checkbox" id="brand_ck12" onclick="GA_Event('카테고리_리스트','정렬','CLUB MONACO');setOnlineShopBrand(this, 'BR44');"><label for="brand_ck12" id="BR44">CLUB MONACO</label></li>
								<li><input type="checkbox" id="brand_ck13" onclick="GA_Event('카테고리_리스트','정렬','oera');setOnlineShopBrand(this, 'BR61');"><label for="brand_ck13" id="BR61">oera</label></li>
								<li><input type="checkbox" id="brand_ck14" onclick="GA_Event('카테고리_리스트','정렬','BALLY');setOnlineShopBrand(this, 'BR21');"><label for="brand_ck14" id="BR21">BALLY</label></li>
								<li><input type="checkbox" id="brand_ck15" onclick="GA_Event('카테고리_리스트','정렬','LANVIN PARIS');setOnlineShopBrand(this, 'BR20');"><label for="brand_ck15" id="BR20">LANVIN PARIS</label></li>
								<li><input type="checkbox" id="brand_ck16" onclick="GA_Event('카테고리_리스트','정렬','3.1 Phillip Lim');setOnlineShopBrand(this, 'BR41');"><label for="brand_ck16" id="BR41">3.1 Phillip Lim</label></li>
								<li><input type="checkbox" id="brand_ck17" onclick="GA_Event('카테고리_리스트','정렬','ROCHAS');setOnlineShopBrand(this, 'BR37');"><label for="brand_ck17" id="BR37">ROCHAS</label></li>
								<li><input type="checkbox" id="brand_ck18" onclick="GA_Event('카테고리_리스트','정렬','TOM GREYHOUND');setOnlineShopBrand(this, 'BR15');"><label for="brand_ck18" id="BR15">TOM GREYHOUND</label></li>
								<li><input type="checkbox" id="brand_ck19" onclick="GA_Event('카테고리_리스트','정렬','FOURM THE STORE');setOnlineShopBrand(this, 'BR35');"><label for="brand_ck19" id="BR35">FOURM THE STORE</label></li>
								<li><input type="checkbox" id="brand_ck20" onclick="GA_Event('카테고리_리스트','정렬','FOURM STUDIO');setOnlineShopBrand(this, 'BR30');"><label for="brand_ck20" id="BR30">FOURM STUDIO</label></li>
								<li><input type="checkbox" id="brand_ck21" onclick="GA_Event('카테고리_리스트','정렬','FOURM MEN&amp;#039;S LOUNGE');setOnlineShopBrand(this, 'BR32');"><label for="brand_ck21" id="BR32">FOURM MEN'S LOUNGE</label></li>
								<li><input type="checkbox" id="brand_ck22" onclick="GA_Event('카테고리_리스트','정렬','MUE');setOnlineShopBrand(this, 'BR16');"><label for="brand_ck22" id="BR16">MUE</label></li>
								<li><input type="checkbox" id="brand_ck23" onclick="GA_Event('카테고리_리스트','정렬','H : SCENE');setOnlineShopBrand(this, 'BR47');"><label for="brand_ck23" id="BR47">H : SCENE</label></li>
								<li><input type="checkbox" id="brand_ck24" onclick="GA_Event('카테고리_리스트','정렬','Liquides Perfume Bar');setOnlineShopBrand(this, 'BR62');"><label for="brand_ck24" id="BR62">Liquides Perfume Bar</label></li>
							</ul>
	                	</div>
	             	</li>
                   	<!-- 색상 정렬 -->
					<li class="color"><a href="#" class="select" onclick="GA_Event('카테고리_리스트','정렬','색상');">색상<span class="ico_arr">arrow</span></a>
						<div class="list list_item4" style="display: none;">
					    	<ul class="color_chip clearfix" id="category_color_chip">
					        	<li><a href="javascript:setRepProdColorCode('BEIGE')" style="background:#fae7c4;" onclick="GA_Event('카테고리_리스트','정렬','BEIGE');">BEIGE</a></li>
					            <li><a href="javascript:setRepProdColorCode('BLACK')" style="background:#000000;" onclick="GA_Event('카테고리_리스트','정렬','BLACK');">BLACK</a></li>
					            <li><a href="javascript:setRepProdColorCode('BLUE')" style="background:#0f45bc;" onclick="GA_Event('카테고리_리스트','정렬','BLUE');">BLUE</a></li>
					            <li class="mr0"><a href="javascript:setRepProdColorCode('BROWN')" style="background:#673915;" onclick="GA_Event('카테고리_리스트','정렬','BROWN');">BROWN</a></li>
					            <li><a href="javascript:setRepProdColorCode('BURGUNDY')" style="background:#741313;" onclick="GA_Event('카테고리_리스트','정렬','BURGUNDY');">BURGUNDY</a></li>
					            <li><a href="javascript:setRepProdColorCode('CAMEL')" style="background:#876c41;" onclick="GA_Event('카테고리_리스트','정렬','CAMEL');">CAMEL</a></li>
					            <li><a href="javascript:setRepProdColorCode('GOLD')" style="background:#ffc733;" onclick="GA_Event('카테고리_리스트','정렬','GOLD');">GOLD</a></li>
					            <li class="mr0"><a href="javascript:setRepProdColorCode('GREEN')" style="background:#0f6f0e;" onclick="GA_Event('카테고리_리스트','정렬','GREEN');">GREEN</a></li>
					            <li><a href="javascript:setRepProdColorCode('GREY')" style="background:#444445;" onclick="GA_Event('카테고리_리스트','정렬','GREY');">GREY</a></li>
					            <li><a href="javascript:setRepProdColorCode('IVORY')" style="background:#fff8d9;" onclick="GA_Event('카테고리_리스트','정렬','IVORY');">IVORY</a></li>
					            <li><a href="javascript:setRepProdColorCode('KHAKI')" style="background:#465626;" onclick="GA_Event('카테고리_리스트','정렬','KHAKI');">KHAKI</a></li>
					            <li class="mr0"><a href="javascript:setRepProdColorCode('LAVENDER')" style="background:#9c81bb;" onclick="GA_Event('카테고리_리스트','정렬','LAVENDER');">LAVENDER</a></li>
					            <li><a href="javascript:setRepProdColorCode('METAL')" style="background:#9d9fa2;" onclick="GA_Event('카테고리_리스트','정렬','METAL');">METAL</a></li>
					            <li><a href="javascript:setRepProdColorCode('MINT')" style="background:#95d0ab;" onclick="GA_Event('카테고리_리스트','정렬','MINT');">MINT</a></li>
					            <li><a href="javascript:setRepProdColorCode('MULTI')" style="background:#534741;" onclick="GA_Event('카테고리_리스트','정렬','MULTI');">MULTI</a></li>
					            <li class="mr0"><a href="javascript:setRepProdColorCode('NAVY')" style="background:#061836;" onclick="GA_Event('카테고리_리스트','정렬','NAVY');">NAVY</a></li>
					            <li><a href="javascript:setRepProdColorCode('OLIVE')" style="background:#5d682d;" onclick="GA_Event('카테고리_리스트','정렬','OLIVE');">OLIVE</a></li>
					            <li><a href="javascript:setRepProdColorCode('ORANGE')" style="background:#ee6423;" onclick="GA_Event('카테고리_리스트','정렬','ORANGE');">ORANGE</a></li>
					            <li><a href="javascript:setRepProdColorCode('PINK')" style="background:#ea589b;" onclick="GA_Event('카테고리_리스트','정렬','PINK');">PINK</a></li>
					            <li class="mr0"><a href="javascript:setRepProdColorCode('PURPLE')" style="background:#833b95;" onclick="GA_Event('카테고리_리스트','정렬','PURPLE');">PURPLE</a></li>
					            <li><a href="javascript:setRepProdColorCode('RED')" style="background:#ec1e24;" onclick="GA_Event('카테고리_리스트','정렬','RED');">RED</a></li>
					            <li><a href="javascript:setRepProdColorCode('SILVER')" style="background:#c0c0c0;" onclick="GA_Event('카테고리_리스트','정렬','SILVER');">SILVER</a></li>
					            <li><a href="javascript:setRepProdColorCode('SKY')" style="background:#a2d6f3;" onclick="GA_Event('카테고리_리스트','정렬','SKY');">SKY</a></li>
					            <li class="mr0"><a href="javascript:setRepProdColorCode('VIOLET')" style="background:#4c2b7b;" onclick="GA_Event('카테고리_리스트','정렬','VIOLET');">VIOLET</a></li>
					            <li><a href="javascript:setRepProdColorCode('WHITE')" class="wt" style="background:#ffffff;" onclick="GA_Event('카테고리_리스트','정렬','WHITE');">WHITE</a></li>
					            <li><a href="javascript:setRepProdColorCode('YELLOW')" style="background:#ffea0a;" onclick="GA_Event('카테고리_리스트','정렬','YELLOW');">YELLOW</a></li>
					       	</ul>
					   	</div>
					</li>
					<!-- 가격 정렬 -->
					<li class="price"><a href="#" class="select" onclick="GA_Event('카테고리_리스트','정렬','가격');">가격<span class="ico_arr">arrow</span></a>
					    <div class="list" style="display: none;">
					        <ul>
					            <li><input type="checkbox" id="price_ck1" onclick="GA_Event('카테고리_리스트','정렬','￦100,000 이하');setPriceOrderCode(this, '1')"> <label for="price_ck1" id="lable_ck1"> ￦100,000 이하</label></li>
					            <li><input type="checkbox" id="price_ck2" onclick="GA_Event('카테고리_리스트','정렬','￦100,000 ~ ￦300,000');setPriceOrderCode(this, '2')"> <label for="price_ck2" id="lable_ck2">￦100,000 ~ ￦300,000</label></li>
					            <li><input type="checkbox" id="price_ck3" onclick="GA_Event('카테고리_리스트','정렬','￦300,000 ~ ￦500,000');setPriceOrderCode(this, '3')"> <label for="price_ck3" id="lable_ck3">￦300,000 ~ ￦500,000</label></li>
					            <li><input type="checkbox" id="price_ck4" onclick="GA_Event('카테고리_리스트','정렬','￦500,000 ~ ￦1,000,000');setPriceOrderCode(this, '4')"> <label for="price_ck4" id="lable_ck4">￦500,000 ~ ￦1,000,000</label></li>
					            <li><input type="checkbox" id="price_ck5" onclick="GA_Event('카테고리_리스트','정렬','￦1,000,000 이상');setPriceOrderCode(this, '5')"> <label for="price_ck5" id="lable_ck5">￦1,000,000 이상</label></li>
					        </ul>
					    </div>
					</li>
                    <!-- 정렬 초기화 버튼 -->
					<li class="btn"><a href="javascript:reset();" onclick="GA_Event('카테고리_리스트','정렬','초기화');">초기화</a><a href="javascript:gubunSearch(1);" onclick="GA_Event('카테고리_리스트','정렬','적용');">적용</a></li>
				</ul>
                <!-- 전체 제품 수 -->
                <div class="items_count float_right">
                	<span class="num">${pageMaker.total}</span> <span>전체</span>
                </div>
			</div>
		</form>
		<div class="items_list cate_item4" id="listContent" style="display: block;">
			<ul class="clearfix" id="listBody">
				<c:forEach items="${product_list }" var="product">
					<li style="margin-right:5px!important;">
						<div class='item_box'>
							<a href="/product/productDetail?pid=<c:out value='${product.pid }'/>" class='item_info1'>
								<span class='item_img'>
									<c:choose>
										<c:when test="${empty product.image_url }" >
											<li><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg" class="respon_image" alt="${product.pname}" ></li>
										</c:when>
										<c:when test="${!empty product.image_url }" >
											<c:forEach  var="thumb_image" items="${product.image_url }">
										<img src="${thumb_image }" class="respon_image" alt="${product.pname}">
										 	</c:forEach>
										</c:when>
									</c:choose>
								</span>
							</a>
							<a href="/product/productDetail?pid=<c:out value='${product.pid }'/>" class='item_info2'>
		   						<span class='brand'>${product.bname }</span>
								<span class='title'>${product.pname }</span>
								<span class='price'>₩<fmt:formatNumber value="${product.pprice }" pattern="#,###" /></span>
							</a>
							<div class='color_more_wrap'></div>
						</li>
					</c:forEach>
				</ul>
	       	</div>
           	<!-- paging -->
           	<div class="paging" style="display: block;">
           		<c:if test="${pageMaker.cri.pageNum != 1}">
           			<a class="prev2" href="/product/productList?pageNum=${1}&amount=${pageMaker.cri.amount}">처음 페이지로 이동</a>
           			<a href="/product/productList?pageNum=${pageMaker.cri.pageNum-1}&amount=${pageMaker.cri.amount}" class="prev">이전 페이지로 이동</a>
           		</c:if>
	           	<span class="num">
	            	<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
	            		<a href="/product/productList?pageNum=${num}&amount=${pageMaker.cri.amount}" id="page_button" class="pageBtn ${pageMaker.cri.pageNum == num ? 'on':'' }">${ num}</a>
	  					<!-- 현재 페이지 class: pageBtn on -->
	            	</c:forEach>
	           	</span>
	           	<c:if test="${pageMaker.cri.pageNum != pageMaker.realEnd}">
	           		<a href="/product/productList?pageNum=${pageMaker.cri.pageNum + 1}&amount=${pageMaker.cri.amount}" class="next">다음 페이지로 이동</a>          	
	           		<a href="/product/productList?pageNum=${pageMaker.realEnd}&amount=${pageMaker.cri.amount}" class="next2">마지막 페이지로 이동</a>
	           	</c:if>
           	</div>
   	</div><!-- END adaptive_wrap -->
</div><!-- end bodyWrap -->   	
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>