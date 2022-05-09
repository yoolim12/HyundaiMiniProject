<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/includes/mainHeader.jsp"%>
	<div id="bodyWrap" class="item_detail">
		<div id="oneEventLayer"></div>
		<div class="adaptive_wrap">
	    	<div class="clearfix prd_detail1905" id="clearfix">
				<div class="clearfix image_view3">
					<!-- detail_image_small -->
					<div class="image_view1" id="image_view1">
						<div class="item_visual" id="imageDiv" style="margin-top: 20px;">
							<ul>
								<c:choose>
									<c:when test="${empty small_detail_images }" >
					            		<li><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg" class="respon_image" alt="${product.pname}" ></li>
									</c:when>
								  	<c:when test="${!empty small_detail_images }" >
								  		<c:forEach  var="small_detail_image" items="${small_detail_images }">
											<li><img src="${small_detail_image.image_url }" class="respon_image" alt="${product.pname}" ></li>
								    	</c:forEach>
								  	</c:when>
								</c:choose>
							</ul>
						</div>
					</div>
					<!-- detail_image_big -->
					<div class="item_visual" id="imageDivW" style="display:none">
						<ul>
							<c:choose>
								<c:when test="${empty big_detail_images }" >
				            		<li><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg" class="respon_image" alt="${product.pname}" ></li>
								</c:when>
							  	<c:when test="${!empty big_detail_images }" >
							  		<c:forEach  var="big_detail_image" items="${big_detail_images }">
										<li><img src="${big_detail_image.image_url }" class="respon_image" alt="${product.pname}" ></li>
							    	</c:forEach>
							  	</c:when>
							</c:choose>
						</ul>
	    			</div>
	    		</div>
				<!-- product detail -->
				<div class="item_detail_info float_right" id="contentDiv" style="margin-bottom: 400px; top: 0px; left: 638px;">
					<div class="info">							
						<div class="info_sect">
							<!-- 이름 -->					
							<h4 class="item_name">
								<div class="brand-name">
									<a href="javascript:fn_goCategori('br62')" onclick="GA_Detail('brand',$(this))">${product.bname}</a>
								</div>
								<span class="name ko_fir_spel">${product.pname}</span>
							</h4>
							<div class="flag"></div>
							<!-- 가격 -->
							<p class="price">
								<span>
									₩<fmt:formatNumber value="${product.pprice }" pattern="#,###" />
								</span>
							</p>
							<!-- detail -->
							<div class="prod-detail-con-box">
					        	<strong class="number-code">상품품번 : <span>${product.pid }</span></strong>
				            	<div class="round-style">
				                	<p>${product.pdetail }</p>
				                </div>
				            </div>
						</div>
				        <div class="info_sect">
							<ul class="point_delivery">
								<li>
									<span class="title">한섬마일리지</span>
									<span class="txt"><fmt:formatNumber value="${product.pprice * 0.05 }" pattern="#,###" />&nbsp;M&nbsp;(5%)</span>
								</li>
								<li>
				                    <span class="title">H.Point</span>
				                    <span class="txt"><fmt:formatNumber value="${product.pprice * 0.001 }" pattern="#,###" />&nbsp;P&nbsp;(0.1%)</span>
								</li>
								<li>
									<span class="title">배송비</span>
									<span class="txt">30,000원 이상 무료배송 (실결제 기준)</span>
								</li>
							</ul>
						</div>
						<div class="info_sect">
							<ul class="color_size_qty">
								<li>
									<span class="title">색상</span>
									<div class="txt">
										<ul class="color_chip clearfix">
											<li>
												<c:choose>
													<c:when test="${empty color_info }" >
				            							<li><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg" class="respon_image" alt="${product.pname}" ></li>
													</c:when>
							  						<c:when test="${!empty color_info }" >
							  							<c:forEach  var="color" items="${color_info }">
							  								<li><a href="#;" class="beige on" style="background:#534741 url('${color.cimage }')" ></a></li>
												    	</c:forEach>
												  	</c:when>
												</c:choose>
											</li>
										</ul>
									</div>
								</li>
								<li>
								    <span class="title">사이즈<!-- 사이즈 --></span>
									<span class="txt">
										<ul class="size_chip clearfix sizeChipKo1901">
											<li>
												<a>FR1</a>
											</li>
										</ul>
									</span>
		                    	</li>
								<li>
								<span class="title">수량</span>
								<span class="txt">
									<span class="qty_sel num">
										<a href="javascript:fn_qtySubtraction(${product.pprice});" class="left">이전 버튼</a>
										<input type="text" id="txtqty" title="수량" value="1" class="mr0" readonly="readonly">
										<a href="javascript:fn_qtyAdd(${product.pprice});" class="right">다음 버튼</a>
								    </span>
								    <script>
								    function fn_qtyAdd(product_price) {
								    	var qty = $("#txtqty").val();
								    	qty = parseInt(qty);
										qty += 1;
										console.log(qty);
										let total = product_price * qty;
										total = total.toLocaleString();
										$("#sumPrice").html("₩" +total);
										$("#txtqty").val(qty);
									}
								    
								    function fn_qtySubtraction(product_price) {
								    	var qty = $("#txtqty").val();
								    	qty = parseInt(qty);
								    	
								    	if(qty < 2){
								            return;
								        }
										qty -= 1;
										console.log(qty);
										let total = product_price * qty;
										total = total.toLocaleString();
										$("#sumPrice").html("₩" +total);
										$("#txtqty").val(qty);
								    }
								    </script>
								</span>
								</li>
							</ul>
						</div>
						<div class="total_price clearfix">
							<div class="title float_left" style="width:auto;">총 합계</div>
							<div class="pirce float_right">
								<span id="sumPrice">₩<fmt:formatNumber value="${product.pprice }" pattern="#,###" /></span>
							</div>
						</div>
						<script>
				           	function addToCart(pid) {
				           		var product_id = pid;
				           		console.log("hihi");
				           		var qty = $("#txtqty").val();
						    	qty = parseInt(qty);
								if (qty > 0) {
									location.href = "/product/addToCart?pid="
											+ product_id
											+"&oamount="
											+ qty;
								} 
							}
				        </script>
						<div class="btnwrap clearfix" style="position: absolute; width: 473px; margin-top: 0px; margin-bottom: 0px;">
							<input type="button" value="" class="btn wishlist1803 float_left ml0  " onclick="addWishListClick();GA_Event('상품_상세','하단 고정 버튼','좋아요');">
							<form id="addToCartForm" name="addToCartForm" action="/ko/HANDSOME/BEAUTY/Perfume/Perfume/%5BCarine-Roitfeld%5D-%EB%A1%9C%EB%A0%8C%EC%8A%A4-%EC%98%A4%EB%93%9C%ED%8D%BC%ED%93%B8-90ml/p/LP2C1102119QCR_XX?categoryCode=be" method="post"><input type="hidden" maxlength="3" size="1" name="qty" class="qty">
								<input type="button" value="쇼핑백 담기" class="btn cart1803 float_left ml0" id="addToCartButton" onclick="javascript:addToCart('${product.pid}');">
							</form>
							<input type="button" value="바로주문" class="btn order float_right mr0" id="addToCartBuyNowButton" onclick="GA_Event('상품_상세','하단 고정 버튼','바로주문');addToCart(true);">   
			           	</div>
			           	<script>
			           		function doDisplay(){
			           			var con = document.getElementById("toggle_dd");
			           			if(con.style.display=='none'){
			           				con.style.display = 'block';
			           			}
			           			else{
			           				con.style.display = 'none';
			           			}
			           		}
			           	</script>
						<dl class="toggle_type1" style="margin-top:80px;">
							<dt><a href="javascript:doDisplay();" id="DELI_RETURN_EVT">배송 및 교환/반품</a></dt>
							<dd id = "toggle_dd">
					    		<p class="tit">배송안내</p>
					    		<dl class="info_tbl">
					    			<dt>배송방식 :</dt>
					    			<dd>우체국택배, CJ대한통운, 부릉, 굿투럭</dd>
					    			<dt>배송지역 :</dt>
					    			<dd>전국 (일부 지역 제외)</dd>
					    			<dt>배송정보 :</dt>
					    			<dd>평균 입금완료일 기준 2-4일 소요됩니다 (토/일/공휴일 제외)</dd>
					    			<dt>배송비 :</dt>
					    			<dd>실결제금액 기준 30,000원 이상 결제 시 무료배송
					    				<br>30,000원 미만 결제 시 2,500원(기본 배송비)
					    				<br>* 실결제금액이란, 쿠폰/바우처 할인액 및 
					    				<br>&nbsp; 한섬마일리지/H.Point 사용 금액을 제외한 금액입니다. 	
					    				<br> &nbsp;&nbsp;(e-money 사용은 실결제금액에 포함)
					    				<br>* 도서산간 지역은 3,000원의 별도 배송비가 부과됩니다.
					    				<br>* 일부 도서지역은 도선료가 부가될 수 있습니다.
				   					</dd>
				  				</dl>
			  					<p class="tit mt20">교환 및 반품안내</p>
			  					<dl class="info_tbl">
			  						<dt>교환/반품 기간 :</dt>
			  						<dd>상품 수령 후, 7일 이내</dd>
			  						<dt>교환절차 :</dt>
			  						<dd style="letter-spacing: -0.2px;">
			  							사이즈 및 상품불량 교환만 가능(색상교환 불가)하며 교환을 원하실 경우<br>
			  							고객센터로 문의해주시기 바랍니다. (교환 재고가 없을 경우, 환불로 안내예정)<br>
			  							화장품은 상품 불량만 교환 가능하며(상품 개봉 후 교환 불가), 고객센터로<br> 문의해주시기 바랍니다.
			  						</dd>
			  						<dt>반품절차 :</dt>
			  						<dd>[배송완료] 7일 이내에 마이페이지 주문/배송/취소/반품 메뉴에서<br>[반품신청] 버튼을 클릭 시 가능합니다.</dd>
			  						<dt>교환/반품 배송비 :</dt>
			  						<dd style="letter-spacing: -0.4px;">
				   						배송비는 5,000원 이며(반품비는 주문시 배송비 결제 유무에 따라 변동)<br>
				   						상품 불량 등의 이유로 교환/반품하실 경우, 배송비는 무료입니다.
				   					</dd>
				   					<dt>교환/반품 불가사유</dt>
				   					<dd>다음의 경우에는 교환/반품이 불가합니다.
				   						<ol class="numlist">
				   							<li>
				   								<span class="num sum">-</span>
				   								<span class="txt">교환/반품 기간(상품 수령 후 7일 이내)을 초과하였을 경우</span>
				  								</li>
				  								<li>
				  									<span class="num sum">-</span>
				  									<span class="txt">고객님의 요청에 의해 제품 사양이 변경(이니셜 제품, 사이즈 맞춤 제품 등)된 경우</span>
				  								</li>
				  								<li><span class="num sum">-</span>
				  									<span class="txt">제품을 이미 사용하였거나, 제품 일부를 소비하였을 경우</span>
				  								</li> 
				  								<li><span class="num sum">-</span>
				  									<span class="txt">화장품 : 상품 개봉 후 교환/반품 불가. 단 상품 불량(내용물 불량) 혹은 피부 트러블로 인한 반품은 가능(용량 1/3 미만 사용 및 의사소견서 1:1문의 첨부 필수)</span>
				  								</li>
				  								<li><span class="num sum">-</span>
				  									<span class="txt">식기류 : 제품 수령 후, 비닐포장을 개봉한 경우</span>
											</li>
											<li><span class="num sum">-</span>
												<span class="txt">고객님의 귀책사유로 인해 회수가 지연될 경우</span>
											</li>
											<li><span class="num sum">-</span>
												<span class="txt">국내외 환율 변동 등에 의해 가격이 변동되는 제품의 경우</span>
											</li>
											<li><span class="num sum">-</span>
												<span class="txt">문제소지가 있는 제품을 본사가 아닌, 타 업체(일반 수선실 등)에서 선처리가 된 경우</span>
											</li>
										</ol>
									</dd>
									<dt>교환/반품건 배송</dt>
									<dd>교환/반품 시 배송 받으신 박스로 반송하셔야 합니다.
										<br>(한섬/오에라/리퀴드퍼퓸바 상품 함께 주문 후 교환/반품 시 각각의 박스에 나눠서 반송해주세요. 한 박스에 함께 동봉하여 반송 시 교환/반품 처리가 불가할 수 있습니다)
									</dd>
								</dl>
								<p class="tit mt20">환불안내</p>
								<p>환불은 반송제품 확인 후 진행됩니다.</p><br>
							</dd>
							<!-- 상품평  -->
					        <div class="popup_customer_review1807" id="customerReview">
					            <a href="#;" onclick="GA_Event('상품_상세','정보','상품평');">상품평(<span id="customerReviewCnt">0</span>)
					                <div class="star_score1807" id="prodTotalStarScoreWrapper" style="display: none;">
					                    <span class="cmt_star">
					                       <!-- 별점에 따라 class명 변경 (star1, star2 ,star3, star4, star5) -->
					                        <span class="cmt_per" id="prodTotalStarScore">별점</span>
					                    </span>
					                </div>
					            </a>
					        </div>
			        	</dl>
					</div><!-- END INFO -->
					<div class="clearfix mt30">
						<div class="btnwrap float_left">
							<c:forEach items="${countlist }" var="countlist_item">
								<a href="/product/qna?pid=${product.pid }" class="btn arrow mr0" onclick="GA_Event('상품_상세','Q&amp;A','클릭');">Q&amp;A(<span class="data" id="productQnACnt">${countlist_item.cnt}</span>)</a>
							</c:forEach>
						</div>
					</div>
		   		</div><!-- END item_detail_info float_right -->
			</div><!-- ENDprd_detail1905 -->
			<div class="product-detail-img">
				<c:choose>
				  	<c:when test="${!empty huge_detail_image }" >
						<img src="${huge_detail_image.image_url }" class="respon_image" alt="${product.pname}" ></li>
				  	</c:when>
				</c:choose>
			</div>
     	</div>
	</div>
	<script type="text/javascript">
	</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>