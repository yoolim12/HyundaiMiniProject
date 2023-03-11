# **더한섬닷컴 홈페이지 클론 코딩**

👇 프로젝트 발표 자료 참고 👇<br />
> [프로젝트 발표 자료](https://github.com/yoolim12/HyundaiMiniProject/files/10940636/Spring.Mini.Project.PPT.pptx)
<br />


## **About Project**
현대 IT&E 채용확정형 교육을 들으면서 일주일동안 진행한 Spring Web MVC Framework을 활용한 더한섬닷컴 홈페이지 제작 프로젝트 입니다.<br />
DB 내에 회원 테이블, 상품 테이블, 주문 테이블을 생성한 뒤 Spring Framework와 Oracle DB를 연동하여 회원, 상품, 주문 관련 기능들을 직접 구현했습니다.
<br />
<br />

## **Our Team Members**
<table>
  <tbody>
    <tr>
      <td>유지훈</td>
      <td>
        <ul>
          <li>로그인 및 로그아웃</li>
          <li>회원가입</li>
          <li>마이페이지</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>이지은</td>
      <td>
        <ul>
          <li>상품 목록</li>
          <li>상품 상세</li>
          <li>1:1 상담</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>최유림</td>
      <td>
        <ul>
          <li>쇼핑백 조회 및 삭제</li>
          <li>상품 Q&A</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<br />
<br />

## **Tech Stack**
<table>
  <tbody>
    <tr>
      <td>Programming Language</td>
      <td>
        <span>
          <img src = "https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=java&logoColor=white" />
          <img src = "https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white" />
          <img src = "https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white" />
          <img src = "https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E" />
          <img src = "https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"/>
          <img src = "https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54" />
        </span>
      </td>
    </tr>
    <tr>
      <td>IDE</td>
      <td>
        <span>
          <img src = "https://img.shields.io/badge/Eclipse-FE7A16.svg?style=for-the-badge&logo=Eclipse&logoColor=white" />
          <img src = "https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white" />
          <img src = "https://img.shields.io/badge/SQLDeveloper-01A9DB?style=flat-square&logo=sqldeveloper&logoColor=white" width = "190.5px" height = "28px" />
        </span>
      </td>
    </tr>
    <tr>
      <td>DB</td>
      <td>
        <span>
          <img src = "https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white" />
        </span>
      </td>
    </tr>
    <tr>
      <td>Server</td>
      <td>
        <span>
          <img src = "https://img.shields.io/badge/apache%20tomcat-%23F8DC75.svg?style=for-the-badge&logo=apache-tomcat&logoColor=black" />
        </span>
      </td>
    </tr>
  </tbody>
</table>
<br />
<br />

## **UI & Presentation Video**
※ 시연 영상을 GIF로 변환하였더니 다소 영상 화질이 깨지는 점 양해 바랍니다. UI 화면은 발표 자료에서도 참고하실 수 있습니다! ※
1. 회원
> - 로그인 / 로그아웃
> - 회원가입
> - 회원 정보 조회(마이페이지) / 수정
> - 1:1 문의 조회 / 작성 / 삭제

2. 상품
> - 상품 목록 조회 / 페이징<br>
> - 상품 목록 카테고리 분류 / 카테고리 별 상품 수 출력<br>
> ![ProductList](https://user-images.githubusercontent.com/78739536/224251456-aeea7ad0-243e-4d78-af6b-776bdb9faa2f.gif)<br>
> - 상품 상세 정보 조회("3. 주문" 하단에 있는 영상 참고)<br>
> - 상품 별 Q&A 조회 / Q&A 개수 출력<br>
![ezgif com-video-to-gif (2)](https://user-images.githubusercontent.com/78739536/224293731-898d8713-3879-49fc-b675-93d6050b1c75.gif)<br>

3. 주문
> - 쇼핑백 조회 / 상품 추가 / 상품 삭제<br>
> - 쇼핑백 내 상품 개수 출력 / 총 상품 합계 출력<br>
> ![ezgif com-video-to-gif (1)](https://user-images.githubusercontent.com/78739536/224282022-da16ed8a-1bf5-486d-8aa8-310fd3181be5.gif)<br>

```bash
.
├── java
│   └── com
│       └── handsome
│           ├── HomeController.java
│           ├── controller
│           │   ├── BasketController.java
│           │   ├── CommonController.java
│           │   ├── InquiryController.java
│           │   ├── MemberController.java
│           │   └── ProductController.java
│           ├── domain
│           │   ├── AuthVO.java
│           │   ├── BoardBean.java
│           │   ├── Criteria.java
│           │   ├── InquiryVO.java
│           │   ├── MemberVO.java
│           │   ├── PageDTO.java
│           │   ├── ProductColorVO.java
│           │   ├── ProductImageVO.java
│           │   ├── ProductVO.java
│           │   └── TestBean.java
│           ├── mapper
│           │   ├── BoardMapper.java
│           │   ├── InquiryMapper.java
│           │   ├── MemberMapper.java
│           │   ├── ProductColorMapper.java
│           │   ├── ProductImageMapper.java
│           │   ├── ProductMapper.java
│           │   └── testMapper.java
│           ├── security
│           │   ├── CustomAccessDeniedHandler.java
│           │   ├── CustomLoginSuccessHandler.java
│           │   ├── CustomUserDetailsService.java
│           │   └── domain
│           │       └── CustomUser.java
│           └── service
│               ├── BoardService.java
│               ├── BoardServiceImpl.java
│               ├── InquiryService.java
│               ├── InquiryServiceImpl.java
│               ├── MemberService.java
│               ├── MemberServiceImpl.java
│               ├── ProductService.java
│               ├── ProductServiceImpl.java
│               ├── TestService.java
│               └── TestServiceImpl.java
├── resources
│   ├── com
│   │   └── handsome
│   │       └── mapper
│   │           ├── BoardMapper.xml
│   │           ├── InquiryMapper.xml
│   │           ├── MemberMapper.xml
│   │           ├── ProductColorMapper.xml
│   │           ├── ProductImageMapper.xml
│   │           ├── ProductMapper.xml
│   │           └── testMapper.xml
│   └── log4j.xml
└── webapp
    ├── WEB-INF
    │   ├── spring
    │   │   ├── appServlet
    │   │   │   └── servlet-context.xml
    │   │   ├── root-context.xml
    │   │   └── security-context.xml
    │   ├── views
    │   │   ├── accessError.jsp
    │   │   ├── handsomeLogin.jsp
    │   │   ├── includes
    │   │   │   ├── footer.jsp
    │   │   │   ├── loginHeader.jsp
    │   │   │   ├── mainHeader.jsp
    │   │   │   ├── myPageBottom.jsp
    │   │   │   └── myPageTop.jsp
    │   │   ├── mainpage.jsp
    │   │   ├── member
    │   │   │   └── join.jsp
    │   │   ├── myPage
    │   │   │   ├── editInfo.jsp
    │   │   │   ├── main.jsp
    │   │   │   ├── myInquiry.jsp
    │   │   │   └── writeInquiry.jsp
    │   │   ├── order
    │   │   │   └── orderList.jsp
    │   │   └── product
    │   │       ├── productDetail.jsp
    │   │       ├── productList.jsp
    │   │       ├── productMList.jsp
    │   │       ├── productQnAList.jsp
    │   │       └── productSList.jsp
    │   └── web.xml
    └── resources
        ├── _ui
        │   ├── desktop
        │   │   └── common
        │   │       ├── blueprint
        │   │       │   └── print.css
        │   │       ├── css
        │   │       │   ├── brand.css
        │   │       │   ├── common.css
        │   │       │   ├── contents.css
        │   │       │   ├── font_80.css
        │   │       │   ├── footer.css
        │   │       │   ├── jquery-ui.min.css
        │   │       │   ├── layout.css
        │   │       │   ├── main_201903.css
        │   │       │   ├── popup.css
        │   │       │   ├── products.css
        │   │       │   └── swiper.css
        │   │       ├── images
        │   │       │   ├── colorchip
        │   │       │   │   ├── BK.png
        │   │       │   │   ├── NL.png
        │   │       │   │   └── WT.png
        │   │       │   ├── common
        │   │       │   │   ├── btn_arr1.png
        │   │       │   │   ├── btn_zoom.png
        │   │       │   │   ├── bul_1.gif
        │   │       │   │   ├── chk_aply_btn.png
        │   │       │   │   ├── dim_bg.png
        │   │       │   │   ├── footer_ico_apps.png
        │   │       │   │   ├── footer_logo_renew.png
        │   │       │   │   ├── fourpm.png
        │   │       │   │   ├── gnb_arr.gif
        │   │       │   │   ├── gnb_submenu_bg.png
        │   │       │   │   ├── ico_btn_wishlist.png
        │   │       │   │   ├── ico_calendar.png
        │   │       │   │   ├── ico_err.png
        │   │       │   │   ├── ico_footer_location.png
        │   │       │   │   ├── ico_footer_location02.png
        │   │       │   │   ├── ico_noti_line.gif
        │   │       │   │   ├── ico_paging.png
        │   │       │   │   ├── ico_qna.png
        │   │       │   │   ├── ico_qty.png
        │   │       │   │   ├── ico_ques2.png
        │   │       │   │   ├── ico_quest.png
        │   │       │   │   ├── ico_sns2.png
        │   │       │   │   ├── ico_toggle.png
        │   │       │   │   ├── ico_utilmenu.png
        │   │       │   │   ├── ico_utilmenu_new.png
        │   │       │   │   ├── loading.gif
        │   │       │   │   ├── noti_controls.png
        │   │       │   │   ├── shopping_cart_tab.png
        │   │       │   │   └── top_btn.png
        │   │       │   ├── icon_new_pc.gif
        │   │       │   ├── instagram_video_thumb_283.jpg
        │   │       │   ├── main
        │   │       │   │   └── top-header-handsome-logo.png
        │   │       │   ├── popup
        │   │       │   │   ├── ico_close.png
        │   │       │   │   ├── join_pop_icon.jpg
        │   │       │   │   └── main_popup_hpoint.jpg
        │   │       │   └── products
        │   │       │       └── ico_select.png
        │   │       ├── js
        │   │       │   ├── SsoAjax.js
        │   │       │   ├── appboy.min.js
        │   │       │   ├── common_function.js
        │   │       │   ├── handsome
        │   │       │   │   ├── common.js
        │   │       │   │   ├── html5shiv-printshiv.js
        │   │       │   │   ├── jquery.bxslider.min.js
        │   │       │   │   ├── jquery.flexslider.js
        │   │       │   │   └── ui.js
        │   │       │   ├── jquery-1.11.2.min.js
        │   │       │   ├── jquery-ui-1.11.2.min.js
        │   │       │   ├── jquery.form-3.51.js
        │   │       │   ├── jquery.vticker.js
        │   │       │   ├── makePCookie.js
        │   │       │   ├── netfunnel.js
        │   │       │   ├── netfunnel_skin.js
        │   │       │   ├── swiper.min.js
        │   │       │   ├── unorm.js
        │   │       │   └── videojs-ie8.min.js
        │   │       └── wisenut
        │   │           ├── ark
        │   │           │   └── js
        │   │           │       ├── ark.js
        │   │           │       └── beta.fix.js
        │   │           └── js
        │   │               ├── jquery.min.js
        │   │               └── search.js
        │   └── shared
        │       └── js
        │           └── siteoverlay.js
        ├── css
        │   ├── common.css
        │   ├── contents.css
        │   └── layout.css
        ├── data
        │   ├── flot-data.js
        │   └── morris-data.js
        ├── dist
        │   ├── css
        │   │   ├── sb-admin-2.css
        │   │   └── sb-admin-2.min.css
        │   └── js
        │       ├── sb-admin-2.js
        │       └── sb-admin-2.min.js
        ├── img
        │   └── attach.png
        ├── js
        │   ├── reply.js
        │   └── sb-admin-2.js
        ├── less
        │   ├── mixins.less
        │   ├── sb-admin-2.less
        │   └── variables.less
        ├── medias
        │   ├── 220401-A-newbie.jpg
        │   ├── 220421-2-1-tom-01.jpg
        │   ├── 220426-A-o2nd-03.jpg
        │   ├── 220427-A-5new-03.jpg
        │   ├── 220427-A-thecashmerekids-01.jpg
        │   ├── 220428-2-1-mine-01.jpg
        │   ├── 220428-2-2-payco-02.jpg.jpeg
        │   ├── 220428-A-brand-01.jpg
        │   ├── 220428-A-puma-02.jpg
        │   ├── 220428-A-time-01-pc.jpg
        │   ├── 220428-A-timehomme-02.jpg
        │   ├── 220428-B-clubmonaco.jpg
        │   ├── 220428-B-obzee.jpg
        │   ├── 220428-C-brand.jpg
        │   ├── 220428-C-fourm.jpg
        │   ├── 220428-C-phillip.jpg
        │   ├── 220428-D-lanvin-05.jpg
        │   ├── 220429-2-2-sjsj-01.jpg
        │   ├── 220429-A-fitguide-01.jpg
        │   ├── 220429-A-weeklypick-03.jpg
        │   ├── 220429-pc-main-A-02.jpg
        │   ├── 220502-A-bally-02.jpg
        │   ├── 220502-A-liquidesbar-07.jpg
        │   ├── 220502-A-minebeauty-01.jpg
        │   ├── 220502-A-oera-02.jpg
        │   └── 220502-pc-main-A-01.jpg
        ├── mobile
        │   └── editorial
        │       └── list
        │           └── banner
        │               ├── 20220427_37621063827637048_ko.jpg
        │               └── 20220428_37731240926702146_ko.jpg
        ├── pages
        │   ├── blank.html
        │   ├── buttons.html
        │   ├── flot.html
        │   ├── forms.html
        │   ├── grid.html
        │   ├── icons.html
        │   ├── index.html
        │   ├── login.html
        │   ├── morris.html
        │   ├── notifications.html
        │   ├── panels-wells.html
        │   ├── tables.html
        │   └── typography.html
        ├── pc
        │   ├── editorial
        │   │   └── detail
        │   │       └── image
        │   │           └── 20220429_37795065057341863_ko.jpg
        │   ├── footer
        │   │   └── footer_athome_car.png
        │   └── products
        │       ├── btn_main_direc1903_.png
        │       ├── btn_main_direc1903_1.png
        │       └── btn_main_direc1903_w.png
        └── vendor
            ├── bootstrap
            │   ├── css
            │   │   ├── bootstrap.css
            │   │   └── bootstrap.min.css
            │   ├── fonts
            │   │   ├── glyphicons-halflings-regular.eot
            │   │   ├── glyphicons-halflings-regular.svg
            │   │   ├── glyphicons-halflings-regular.ttf
            │   │   ├── glyphicons-halflings-regular.woff
            │   │   └── glyphicons-halflings-regular.woff2
            │   └── js
            │       ├── bootstrap.js
            │       └── bootstrap.min.js
            ├── bootstrap-social
            │   ├── bootstrap-social.css
            │   ├── bootstrap-social.less
            │   └── bootstrap-social.scss
            ├── datatables
            │   ├── css
            │   │   ├── dataTables.bootstrap.css
            │   │   ├── dataTables.bootstrap.min.css
            │   │   ├── dataTables.bootstrap4.css
            │   │   ├── dataTables.bootstrap4.min.css
            │   │   ├── dataTables.foundation.css
            │   │   ├── dataTables.foundation.min.css
            │   │   ├── dataTables.jqueryui.css
            │   │   ├── dataTables.jqueryui.min.css
            │   │   ├── dataTables.material.css
            │   │   ├── dataTables.material.min.css
            │   │   ├── dataTables.semanticui.css
            │   │   ├── dataTables.semanticui.min.css
            │   │   ├── dataTables.uikit.css
            │   │   ├── dataTables.uikit.min.css
            │   │   ├── jquery.dataTables.css
            │   │   ├── jquery.dataTables.min.css
            │   │   └── jquery.dataTables_themeroller.css
            │   ├── images
            │   │   ├── Sorting icons.psd
            │   │   ├── favicon.ico
            │   │   ├── sort_asc.png
            │   │   ├── sort_asc_disabled.png
            │   │   ├── sort_both.png
            │   │   ├── sort_desc.png
            │   │   └── sort_desc_disabled.png
            │   └── js
            │       ├── dataTables.bootstrap.js
            │       ├── dataTables.bootstrap.min.js
            │       ├── dataTables.bootstrap4.js
            │       ├── dataTables.bootstrap4.min.js
            │       ├── dataTables.foundation.js
            │       ├── dataTables.foundation.min.js
            │       ├── dataTables.jqueryui.js
            │       ├── dataTables.jqueryui.min.js
            │       ├── dataTables.material.js
            │       ├── dataTables.material.min.js
            │       ├── dataTables.semanticui.js
            │       ├── dataTables.semanticui.min.js
            │       ├── dataTables.uikit.js
            │       ├── dataTables.uikit.min.js
            │       ├── jquery.dataTables.js
            │       ├── jquery.dataTables.min.js
            │       └── jquery.js
            ├── datatables-plugins
            │   ├── dataTables.bootstrap.css
            │   ├── dataTables.bootstrap.js
            │   ├── dataTables.bootstrap.min.js
            │   └── index.html
            ├── datatables-responsive
            │   ├── dataTables.responsive.css
            │   ├── dataTables.responsive.js
            │   └── dataTables.responsive.scss
            ├── flot
            │   ├── excanvas.js
            │   ├── excanvas.min.js
            │   ├── jquery.colorhelpers.js
            │   ├── jquery.flot.canvas.js
            │   ├── jquery.flot.categories.js
            │   ├── jquery.flot.crosshair.js
            │   ├── jquery.flot.errorbars.js
            │   ├── jquery.flot.fillbetween.js
            │   ├── jquery.flot.image.js
            │   ├── jquery.flot.js
            │   ├── jquery.flot.navigate.js
            │   ├── jquery.flot.pie.js
            │   ├── jquery.flot.resize.js
            │   ├── jquery.flot.selection.js
            │   ├── jquery.flot.stack.js
            │   ├── jquery.flot.symbol.js
            │   ├── jquery.flot.threshold.js
            │   ├── jquery.flot.time.js
            │   └── jquery.js
            ├── flot-tooltip
            │   ├── jquery.flot.tooltip.js
            │   ├── jquery.flot.tooltip.min.js
            │   └── jquery.flot.tooltip.source.js
            ├── font-awesome
            │   ├── HELP-US-OUT.txt
            │   ├── css
            │   │   ├── font-awesome.css
            │   │   ├── font-awesome.css.map
            │   │   └── font-awesome.min.css
            │   ├── fonts
            │   │   ├── FontAwesome.otf
            │   │   ├── fontawesome-webfont.eot
            │   │   ├── fontawesome-webfont.svg
            │   │   ├── fontawesome-webfont.ttf
            │   │   ├── fontawesome-webfont.woff
            │   │   └── fontawesome-webfont.woff2
            │   ├── less
            │   │   ├── animated.less
            │   │   ├── bordered-pulled.less
            │   │   ├── core.less
            │   │   ├── extras.less
            │   │   ├── fixed-width.less
            │   │   ├── font-awesome.less
            │   │   ├── icons.less
            │   │   ├── larger.less
            │   │   ├── list.less
            │   │   ├── mixins.less
            │   │   ├── path.less
            │   │   ├── rotated-flipped.less
            │   │   ├── screen-reader.less
            │   │   ├── spinning.less
            │   │   ├── stacked.less
            │   │   └── variables.less
            │   └── scss
            │       ├── _animated.scss
            │       ├── _bordered-pulled.scss
            │       ├── _core.scss
            │       ├── _extras.scss
            │       ├── _fixed-width.scss
            │       ├── _icons.scss
            │       ├── _larger.scss
            │       ├── _list.scss
            │       ├── _mixins.scss
            │       ├── _path.scss
            │       ├── _rotated-flipped.scss
            │       ├── _screen-reader.scss
            │       ├── _spinning.scss
            │       ├── _stacked.scss
            │       ├── _variables.scss
            │       └── font-awesome.scss
            ├── jquery
            │   ├── jquery.js
            │   └── jquery.min.js
            ├── metisMenu
            │   ├── metisMenu.css
            │   ├── metisMenu.js
            │   ├── metisMenu.min.css
            │   └── metisMenu.min.js
            ├── morrisjs
            │   ├── morris.css
            │   ├── morris.js
            │   └── morris.min.js
            └── raphael
                ├── raphael.js
                └── raphael.min.js
```
