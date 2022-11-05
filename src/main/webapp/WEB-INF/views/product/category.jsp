<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .side-link{
        font-size: medium;
        height: 40px;
        width: 100%;
        border-radius: 40px;
        padding-top: 8px;
    }
    .side-link>span {
        color: #3b5998;
    }
</style>
<script type="text/javascript">
    $(function(){
        $(".category_wrap a").on("click", function(e){
            e.preventDefault();
            let categoryCode = $(this).attr("href");
            console.log(categoryCode); // 내가 클릭한 a 태그의 href 값 (예: 기술과학, 사회과학..)
            $(".category_search_form input[name='keyword']").val('${criteria.keyword}');
            $(".category_search_form input[name='categoryCode']").val(categoryCode);
            $(".category_search_form input[name='type']").val('C');
            $(".category_search_form").submit();
        })
    })
</script>
    <section class="sidebar">
        <!-- 사이드바 메뉴 시작 -->
        <section>
            <ul class="sidebarList mt-4" style="position: fixed; left: 180px; border: solid 1px #dcdbdb; padding-top: 20px; padding-bottom: 20px; padding-right: 25px; border-radius: 10px; ">
                    <ul class="category_wrap">
                        <li class="title" style="border-radius: 10px;"><span style="color:gray">Category</span></li>
                        <br>
                        <%--    <a> 태그를 클릭했을 때 필터링된 '상품 목록' 페이지로 이동  --%>
                        <c:forEach items="${categoryFilterList}" var="item"  varStatus="status">
                            <li class="side-link"><a href="${categoryFilterList[status.index]}">∙ ${categoryFilterList[status.index]}</a></li>
                        </c:forEach>
                    </ul>
                </li>
            </ul>

<%--            카테고리 검색을 요청할 form 을 숨김으로 해놓은 뒤
                    사용자가 위의 a 태그를 클릭하면
                     그에 해당하는 카테고리 이름을 input 의 value 로 넘긴다.
--%>
            <form class="category_search_form" method="get" action="/product/search" hidden>
                <input type="text" name="categoryCode"/>
                <input type="text" name="keyword"/>
                <input type="text" name="type"/>
            </form>
        </section>
    </section>
