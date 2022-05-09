<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/includes/mainHeader.jsp"%>
<!-- bodyWrap -->
   	<div id="bodyWrap" style="padding-bottom:0;">
		<h3 class="cnts_title ou1804">
	        <span><!-- 정상 브랜드 카테고리 목록 -->
	           <a href="/product/productList?pageNum=${1}&amount=${pageMaker.cri.amount}" >뷰티</a>
	        	<img src="http://cdn.thehandsome.com/_ui/desktop/common/images/products/ou_location_arr.png" alt="location arr">
	           <a href="/product/productMList?category=${category}&pageNum=${1}&amount=${pageMaker.cri.amount}">${category}</a>
	        </span>
         </h3>
	<div class="adaptive_wrap">
       	<form id="categoryListForm" action="/ko/c/categoryList">
	        <!-- sort wrap -->
	        <div class="filterWrap hsDelivery1902">
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
           			<a class="prev2" href="/product/productMList?category=${category}&pageNum=${1}&amount=${pageMaker.cri.amount}">처음 페이지로 이동</a>
           			<a href="/product/productMList?category=${category }&pageNum=${pageMaker.cri.pageNum-1}&amount=${pageMaker.cri.amount}" class="prev">이전 페이지로 이동</a>
           		</c:if>
	           	<span class="num">
	            	<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
	            		<a href="/product/productMList?category=${category }&pageNum=${num}&amount=${pageMaker.cri.amount}" id="page_button" class="pageBtn ${pageMaker.cri.pageNum == num ? 'on':'' }">${ num}</a>
	  					<!-- 현재 페이지 class: pageBtn on -->
	            	</c:forEach>
	           	</span>
	           	<c:if test="${pageMaker.cri.pageNum != pageMaker.realEnd}">
	           		<a href="/product/productMList?category=${category }&pageNum=${pageMaker.cri.pageNum + 1}&amount=${pageMaker.cri.amount}" class="next">다음 페이지로 이동</a>          	
	           		<a href="/product/productMList?category=${category }&pageNum=${pageMaker.realEnd}&amount=${pageMaker.cri.amount}" class="next2">마지막 페이지로 이동</a>
	           	</c:if>
           	</div>
   	</div><!-- END adaptive_wrap -->
</div><!-- end bodyWrap -->   	
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>