<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/includes/loginHeader.jsp"%>
<%@ include file="/WEB-INF/views/includes/myPageTop.jsp"%>

<div class="sub_cnts">
			
			
			<style type="text/css">
			
tr.hidden {
     display: none;
}

</style>
<script type="text/javascript">

$(document).ready(function(){
    $("#menuTitle").text("1:1 문의");
	   $( "#sterm, #eterm" ).datepicker({
			showOn:"button",
			dateFormat: "yy-mm-dd"
		});

		$('button.ui-datepicker-trigger').addClass('ico_cld');

		$('#setDateBtn1').click(function(){
			var today = new Date();
			var endDate = today.format("yyyy-MM-dd");	
			$('#eterm').val(endDate);
			var startDate = today;
			startDate.setDate(today.getDate()-7);
			startDate = startDate.format("yyyy-MM-dd");
			$('#sterm').val(startDate);
			
		});
		$('#setDateBtn1').click();

		$('#setDateBtn2').click(function(){
			var today = new Date();
			var endDate = today.format("yyyy-MM-dd");
			$('#eterm').val(endDate);
			var startDate = today;
			startDate.setMonth(today.getMonth()-1);
			startDate = startDate.format("yyyy-MM-dd");
			$('#sterm').val(startDate);
			
		});

		$('#setDateBtn3').click(function(){
			var today = new Date();
			var endDate = today.format("yyyy-MM-dd");
			$('#eterm').val(endDate);
			var startDate = today;
			startDate.setMonth(today.getMonth()-3);
			startDate = startDate.format("yyyy-MM-dd");
			$('#sterm').val(startDate);
			
		});


	 var mymantomaninquirylist = new BoardListController('mantomaninquiryListForm', '#listBody', '.paging', 10, 'searchBtn');
	 mymantomaninquirylist.setRowHtml = function(results){
	    
	 	var rows = "";
	 	var currentPage = 0;  
	 	var numberOfPages = 0; 
	 	var pageSize = 0;  
	 	var totalNumberOfResults = 0; 
	 	var pageNum = 0; 
	    var num = 0;
	    var totNum=0;
 	 	
	    currentPage=mymantomaninquirylist.PARAMS.jsonObjectData.pagination.currentPage; 
	 	numberOfPages=mymantomaninquirylist.PARAMS.jsonObjectData.pagination.numberOfPages; 
	 	pageSize=mymantomaninquirylist.PARAMS.jsonObjectData.pagination.pageSize; 
	 	totalNumberOfResults=mymantomaninquirylist.PARAMS.jsonObjectData.pagination.totalNumberOfResults; 
	 	
	 	if(results.length < 1) {
	 	  // totalNumberOfResults--;
           //totNum = (totalNumberOfResults - (currentPage * pageSize )) + 1 ; 
           var listTag = "";  
           listTag += "<tr>";
           listTag +=     "<td colspan='4' class='no_data'>";
           listTag +=     '등록된 게시글이 없습니다.';
           listTag +=     "</td>";
           listTag += "</tr>";
           rows +=listTag;
	 	} else {
	 	   $.each(results, function(){
	 	       var processStatus = this.processStatus;
	 	       if(processStatus=="신청완료"){processStatus = "접수완료";}
	            totalNumberOfResults--;
	            totNum = (totalNumberOfResults - (currentPage * pageSize )) + 1 ; 
	            //console.log("this.pk", this);
	            var listTag = "";
	            if(this.manToManProductInfo != null && this.manToManProductInfo != '') {
	                var cdList = this.productCdList;
                    listTag +=    '<tr class="al_middle" id="clickme'+totNum+'" cdList="'+this.manToManProductInfo+'" pk="'+this.pkInquiry+'" onClick="show1('+totNum+',this)">';
                }else{
		            listTag +=    "<tr class=\"al_middle\" id=\"clickme"+ totNum +  "\" onClick=\"show1("+totNum +")\">";  
                }
	            listTag +=      "<td class=\"frt\">" + this.creationTime + "</td>"; 
	            listTag +=      "<td>"+ this.largeClassificationCode + "</td>";
	            var subject1 = this.subject.replace(/&amp;/g,'&');
	            listTag +=      "<td class=\"al_left\"><a href=\"javascript:void(0);\">" + subject1 + "</a></td>";
	            listTag +=      "<td>[" + processStatus + "]</td>"; 
	            listTag +=    "</tr>";
	            listTag +=    "<tr class=\"info3\" style=\"display:none\" id=\"hideme"+ totNum +  "\">";
	            listTag +=    "Q&A";
	            listTag +=    "<td class=\"qna_wrap\"  colspan=\"4\">";
	            listTag +=    "<div class=\"qna_box ch\">";
	            
	            if (this.attachingImageName == null || this.attachingImage == null) {
                    listTag +=    '<p></p>';
                } else {
                    var imgUrl = this.attachingImageUrl;
                    listTag +=    "<div class=\"qna_thing rev\">";
                    listTag +=    "    <ul>";
                    listTag +=    "        <li>";
                    listTag +=    "            <img src=\""+ this.attachingImage +"\">";
                    listTag +=    "        </li>";
                    listTag +=    "    </ul>";
                    listTag +=    "</div>";
                } 
	            
	            listTag +=    "<div class=\"qt\">"; 
	            listTag +=    "<span class=\"ico\">quest</span>"; 
	            listTag +=    "<div class=\"txt\">"; 
	            if (this.contents == null || this.contents == "") {
	                listTag +=    "<p></p>"; 
	            } else {
	                var contents =  this.contents;
	                var contents1 = contents.replace(/&amp;/g,'&');
	                contents1 = contents1.replace(/&lt;/g,'&lt');
	                contents1 = contents1.replace(/&gt;/g,'&gt');
	                //XSS필터로 인한 특수문자 치환
	                contents1 = contents1.replace(/&#40;/gim,'(');
	                contents1 = contents1.replace(/&#41;/gim,')');
	                contents1 = contents1.replace(/&#39;/gim,'\'');
	                contents1 = contents1.replace(/<script>/gim,'');
	                contents1 = contents1.replace(/<\/script>/gim,'');
	                listTag +=    "<p style=\"word-wrap:break-word\">" + contents1 + "</p>"; 
	            }
	            
	            listTag +=    "</div>"; 
	            listTag +=    "</div>"; 
	            listTag +=    "<div class=\"an\">"; 
	            listTag +=    "<span class=\"ico\">answer</span>"; 
	            listTag +=    "<div class=\"txt\">"; 
	            
	            // 답변 등록 전 수정/삭제 허용
	            if (this.replyContent == null || this.replyContent == "") {
	                listTag += "<div class=\"btnwrap mt40\" style=\"text-align:right\">";
	                listTag += "    <a href=\"javascript:fn_manToManInquiryEdit('E','"+ this.pkInquiry +"');\" id=\"qnaWriteSend\">수정</a> ";
	                listTag += "    <a href=\"javascript:fn_manToManInquiryEdit('D','"+ this.pkInquiry +"');\" id=\"qnaCancle\">삭제</a>";                
	                listTag += "</div>";
	            } else {
	                var replyContext =  this.replyContent;
	                var replyContext1 = replyContext.replace(/&lt;/g,'<').replace(/&gt;/g,'>').replace(/&amp;/g,'&');
	                //XSS필터로 인한 특수문자 치환
	                replyContext1 = replyContext1.replace(/&#40;/gim,'(');
	                replyContext1 = replyContext1.replace(/&#41;/gim,')');
	                replyContext1 = replyContext1.replace(/&#39;/gim,'\'');
	                replyContext1 = replyContext1.replace(/<script>/gim,'');
	                replyContext1 = replyContext1.replace(/<\/script>/gim,'');
	                listTag +=    "<p style=\" word-wrap: break-word\">" +  replyContext1 + "<br/></p>";   
	            }  
	            if (this.replyDate == null || this.replyDate == "") {
	                listTag +=    "<p class=\"date\"></p>";  
	            } else {
	                listTag +=    "<p class=\"date\">답변일 : " + this.replyDate + "</p>";  
	            }  
	            listTag +=    "</div>"; 
	            listTag +=    "</div>"; 
	            listTag +=    "</div>"; 
	            listTag +=    "</td>"; 
	            listTag +=    "</tr>"; 
	            
	            rows +=listTag;
	        });
	 	}
	 	
	 	return rows;
	 };
	 mymantomaninquirylist.doWork();

/* 	 $("#subject").focus();  */
/* 	 $("#sterm").val('');
	 $("#eterm").val(''); */
   });
	
	// 수정/삭제하기
	function fn_manToManInquiryEdit(act, pkInquiry)
	{
		//로그인이 되어 있는지 확인한다.
		
		// 수정하기
		if (act === "E") {
			var lc = new layerConfirm("해당 글을 수정하시겠습니까?", "확인", "취소");
			lc.confirmAction = function() {
				$("#pkInquiry").val(pkInquiry);
				$("#mantomaninquiryForm").submit();
			};
		// 삭제하기
		} else if (act === "D") {
			var lc = new layerConfirm("해당 글을 삭제하시겠습니까?", "확인", "취소");
			lc.confirmAction = function() {
				$.ajax({
					url: '/mypage/manTomanInquiryDelete?pkInquiry='+pkInquiry,
					type: "GET",
					success: function(data){
						location.href = "/ko/mypage/mymantomaninquiry";
					},
					error: function(xhr, Status, error) {
						var la = new layerAlert(error);
						la.confirmAction = function(){
							return;
						};
					}
				});
			};
		}
	}

    /*    $('#subject').keypress(function(event){
     var keycode = (event.keyCode ? event.keyCode : event.which);
     if(keycode == '13'){
     $("#mantomaninquiryListForm").attr("action", "/ko/mypage/mymantomaninquiry");
     $("#mantomaninquiryListForm").submit(); 
     }
     event.stopPropagation();
     }); */
    $(document).keypress(function(event)
    {
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if (keycode == '13') {
            $("#mantomaninquiryListForm").attr("action", "/ko/mypage/mymantomaninquiry");
            $("#mantomaninquiryListForm").submit();
        }
        event.stopPropagation();
    });

    /* 	function show1(id){
     $('#hideme' + id).toggle();
     return false;   
     }  */
    function show1(id,target)
    {
        $('#listBody').each(function()
        {
            $('#listBody').find(".info3").not('#hideme' + id).css("display", "none");
        });
        var $this = $(target);
        var pk = $this.attr("pk");
        if($this.next().find(".prod_list").length > 0 ||  typeof($this.attr("cdList")) == 'undefined'  || pk == "") {
            $('#hideme' + id).slideToggle();
            return;
        } else {
            $.ajax({
                url: '/ko/mypage/mymantomaninquiryProductList.ajax?productListString='+pk,
                type: "GET",
                success: function(data){
                      if (data != null  && data.length > 0) {
                       var prdList = "";
                       prdList +=    "<div class=\"qna_thing prod_list\">";
                       prdList +=    "    <ul>";
                       for(var i=0; i<data.length; i++) {
                           prdList +=    "        <li>";
                           for(j in data[i].productImages) {
                               if(data[i].productImages[j].imageDivisionCode.code == "S01") {
                                   prdList += '<img src="'+data[i].productImages[j].image.url+'" alt="'+data[i].productImages[j].image.altText+'">';
                               }
                           }
                           prdList +=    "            <p>";
                           prdList +=    "                <span>"+data[i].brandName+"</span><br>"+data[i].name+"";
                           prdList +=    "            </p>";
                           prdList +=    "        </li>";
                       }
                       prdList +=    "    </ul>";
                       prdList +=    "</div>";
                   }
                   
                   $this.next().find(".prod_list").remove();
                   $this.next().find(".qt").before(prdList);
                },
                error: function(xhr, Status, error) {
//                     var la = new layerAlert(error);
//                        la.confirmAction = function(){
//                            return;
//                        };
                }
           });
            $('#hideme' + id).slideToggle();
        }
        
       

        return;
    }
    function close1(id)
    {
        $('#hideme' + id).hide();
        return false;
    }
    function close2(id)
    {
        $('#hidemeTop' + id).hide();
        return false;
    }
    function openImgWindows(imgUrl)
    {
        window.open(imgUrl, '첨부파일', 'width=557, height=500');
    }
    function replaceAll(str, target, replacement)
    {
        return str.split(target).join(replacement);
    };
    function convert(str)
    {
        str = str.replace(/&amp/g, "&");
        str = str.replace(/&quot/g, "\"");
        str = str.replace(/&gt/g, ">");
        str = str.replace(/&lt/g, "<");
        return str;
    }
</script>

<!-- //lnbWrap -->

	<form id="mantomaninquiryForm" action="/ko/svcenter/mantomaninquiry">
		<input type="hidden" name="pkInquiry" id="pkInquiry">
		</form>
    <form id="mantomaninquiryListForm" action="/ko/mypage/mymantomaninquirylist">
    	
	    <!-- search1 -->
	    <div class="search_wrap">
		<!-- cnd -->
			<ul>
				<li>
					<p class="bul_sty01"><label for="term">조회기간</label></p>
					<div class="calendar_wrap mr5"> <!-- readonly -->
						<input type="text" class="input_date hasDatepicker" title="기간 입력" id="sterm" name="sterm" value="" readonly=""><button type="button" class="ui-datepicker-trigger ico_cld">...</button>
						<div class="form_hyphen pl5">-</div>
						<input type="text" class="input_date hasDatepicker" title="기간 입력" id="eterm" name="eterm" value="" readonly=""><button type="button" class="ui-datepicker-trigger ico_cld">...</button>
					</div>
					<div class="tab_c">
						<ul class="clearfix">
							<li><a href="javascript:void(0);" id="setDateBtn1" class="on">
							1주일</a>
							</li>
							<li><a href="javascript:void(0);" id="setDateBtn2">
							1개월</a>
							</li>
							<li><a href="javascript:void(0);" id="setDateBtn3">
							3개월</a>
							</li>
						</ul>
					</div>
				</li>
		        </ul>
			<!-- //cnd -->
			<input type="button" class="btn_search none" id="searchBtn" value="조회하기">
		</div>
	</form>
	<!-- //search1 -->
	<div class="title_wrap mt50">
		<h4 class="float_left">나의 1:1 문의</h4>
		<p class="txt_line">고객님의 문의를 등록하시면 빠른 시일 내 답변 드리겠습니다.</p>
		<div class="btn_wrap">
			<a href="/myPage/writeInquiry" class="btn add_ss mr0">문의하기</a>
		</div>
	</div>
	<!-- Table -->
	<div class="tblwrap">
		<table class="tbl_ltype">
		<caption>&gt;나의 1:1 문의 목록</caption>
		<colgroup>
			<col style="width:100px">
			<col style="width:140px">
			<col>
			<col style="width:100px">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">등록일</th>
				<th scope="col">상담유형</th>
				<th scope="col">제목</th>
				<th scope="col">처리상태</th>
			</tr>
		</thead>
		<tbody id="listBody">
			<c:forEach items="${inquiry_list }" var="inquiry">
			<tr class="al_middle" id="clickme${inquiry.qid}" cdlist="[]" pk="8919406235578" onclick="show1(${inquiry.qid},this)">
				<td class="frt">${inquiry.qdate}
				</td>
				<td>더한섬닷컴 문의</td>
				<td class="al_left"><a href="javascript:void(0);">${inquiry.qtitle}</a></td>
				<c:if test="${!empty inquiry.qreplycontent}">
					<td>[답변완료]</td>
				</c:if>
				<c:if test="${empty inquiry.qreplycontent}">
				<td>[접수완료]</td>
				</c:if>
			</tr>
			<tr class="info3" style="display:none" id="hideme${inquiry.qid}">
				<td class="qna_wrap" colspan="4">
				<div class="qna_box ch">
				<p></p>
				
				<div class="qt">
					<span class="ico">quest</span>
						<div class="txt">
							<p style="word-wrap:break-word">${inquiry.qcontent}</p>
						</div>
				</div>
				<div class="an">
					<span class="ico">answer</span>
						<div class="txt">
							<c:if test="${!empty inquiry.qreplycontent}">
								<p style=" word-wrap: break-word">${inquiry.qreplycontent }</p>
								<p class="date">답변일 : ${inquiry.qreplydate }</p>
							</c:if>
							<c:if test="${empty inquiry.qreplycontent}">
								<div class="btnwrap mt40" style="text-align:right">
								<a href="/myPage/removeInquiry?qid=${inquiry.qid }" id="qnaCancle">삭제</a>
								</div>
								<p class="date"></p>
							</c:if>
				
						</div>
					</div>
				</div>
				</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
		<!-- //Table -->
		<!--paging-->
		<div class="paging"><a class="prev2" href="javascript:void(0);">처음 페이지로 이동</a><a href="javascript:void(0);" class="prev">이전 페이지로 이동</a><span class="num"><a href="javascript:void(0);" class="pageBtn  on  " pagenum="1">1</a></span><a href="javascript:void(0);" class="next">다음 페이지로 이동</a><a href="javascript:void(0);" class="next2">마지막 페이지로 이동</a></div>
	    <!--//paging-->


</div>
<%@ include file="/WEB-INF/views/includes/myPageBottom.jsp"%>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

