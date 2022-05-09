<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"
                integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous">
        </script>
        <link rel="stylesheet" type="text/css" href="http://www.thehandsome.com/_ui/desktop/common/css/font_80.css" media="all" />
	    <link rel="stylesheet" type="text/css" href="http://www.thehandsome.com/_ui/desktop/common/css/common.css?20220401" media="all" />
		<link rel="stylesheet" type="text/css" href="http://www.thehandsome.com/_ui/desktop/common/css/layout.css?20220331" media="all" />
		<link rel="stylesheet" type="text/css" href="http://www.thehandsome.com/_ui/desktop/common/css/popup.css?20210225" media="all" />
		<link rel="stylesheet" type="text/css" href="http://www.thehandsome.com/_ui/desktop/common/css/jquery-ui.min.css" media="all" />
		
		<link rel="stylesheet" type="text/css" href="http://www.thehandsome.com/_ui/desktop/common/css/brand.css" media="all" />
		<link rel="stylesheet" type="text/css" href="http://www.thehandsome.com/_ui/desktop/common/css/footer.css?20220406" media="all" />
		<link rel="stylesheet" type="text/css" href="http://www.thehandsome.com/_ui/desktop/common/css/contents.css?20220221" media="all" />
		<link rel="stylesheet" type="text/css" href="http://www.thehandsome.com/_ui/desktop/common/css/swiper.min.css" media="all" />
		<link rel="stylesheet" type="text/css" href="http://www.thehandsome.com/_ui/desktop/common/css/beauty.css?20211104" />
<style type="text/css" media="print">
	@IMPORT url("http://www.thehandsome.com/_ui/desktop/common/blueprint/print.css");
</style>
    </head>
    <body>
        <div class="popwrap w_type_4" id="productQnADiv" style=" position: absolute; z-index: 101; display: block;">
                <div class="pop_tltwrap2 pb0">
                    <h3>Q&amp;A</h3>
                </div>
                <div class="pop_cnt evaluation_list">
                    <a href="#;" class="btn_evaluation" id="productQnAWrite">상품문의하기</a>
                    <div class="clearfix">
                        <table class="pop_tbl_ltype1">
                            <caption>Q&amp;A</caption>
                            <thead>
                                <tr>
                                    <th scope="col">번호</th>
                                    <th scope="col">Q&amp;A</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list}" var="list_item">
                                    <tr>
                                        <td>${list_item.rno}</td>
                                        <td>
                                            <a href="javascript:displayQNA(${list_item.rno});" >${list_item.rtitle}</a>
                                        </td>
                                        <td>${list_item.mname}</td>
                                        <td>${list_item.rdate}</td>
                                    </tr>
                                    <tr style="display: none;" id="qnaDetail${list_item.rno }" name="qnaDetail">
                                        <td colspan="4" class="evaluation_view">
                                            <p class="txt">${list_item.rcontent}</p>
                                            <!-- <div class="answer_wrap">
                                            </div> -->
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <a href="/product/productDetail?pid=${product_id }" class="btn_close"><img
                        src="http://cdn.thehandsome.com/_ui/desktop/common/images/popup/ico_close.png" alt="닫기"></a>
            </div>
            <script>
            
            function displayQNA(rno){
            	var detail = document.getElementById('qnaDetail'+rno);
            	console.log(detail)
            	if (detail.style.display == 'none') {
                    detail.style.display = 'block';
                }
                else {
                    detail.style.display = 'none';
                }
            	
            }
            </script>
	</body>
</html>