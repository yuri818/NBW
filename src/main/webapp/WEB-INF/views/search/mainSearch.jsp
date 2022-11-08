<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(function(){
        $("#mainSearch").keyup(function(){
            $('#autocomplete').attr("hidden", false);
            let keyword = $(this).val();
            $.ajax({
                type:"POST",
                async: true,
                url:"/product/autocomplete?keyword="+keyword,
                dataType:"json",
                contentType:"application/json; charset=utf-8",
                success:
                    function(data, textStatus){
                            /* 입력창이 빌 경우는 추천 데이터가 들어갈 공간을 비운다.*/
                            if (keyword == null && keyword =="")
                                alert("공간을 비웁니다. ");
                                $('#recommand').empty();

                            if(data != null) displayResult(data);

                    },
                error:function(data, textStatus){
                    alert("에러가 발생했습니다."+data);
                    },
                minLength:2
            })
        });

        $("#auto_btn_close").click(function(){
            $('#autocomplete').attr("hidden", true);
        })

        function displayResult(jsonInfo){
            let html;
             for (let i in jsonInfo.autocProduct){
               //console.log(`띄워줄 p_title===>`+ jsonInfo.autocProduct[i]["p_title"]+`<br>`);
                html =
                             `<div class="row" style="height: 120px;">`+
                                 `<div class="col-3" style="padding-top: 5px;">`+
                                     `<span style="height: 100px;">`+
                                        `<img src="`+jsonInfo.autocProduct[i]["p_img"]+ `"style="height: 102px; border-radius: 10px;" >`+
                                     `</span>`+
                                 `</div>`+
                                 `<div id="autocProduct" class="col-9" style="padding-top:10px;">`+
                                      `<div class="row" style="height: 30px;"><a class='searchName' style="text-decoration: none;" href=#`+ jsonInfo.autocProduct[i]["p_title"]+`"><p style="font-size: small; font-weight: bolder">`+jsonInfo.autocProduct[i]["p_title"]+`</p></a></div>`+
                                      `<div class="row" style="height: 30px;"><p style="font-size: small">`+jsonInfo.autocProduct[i]["p_author"]+`</p></div>`+
                                      `<div class="row" style="height: 30px;"><p style="font-size: 13px;">`+jsonInfo.autocProduct[i]["p_price"]+`</p></div>`+
                                 `</div>`+
                             `</div>`+
                             `</div>`
                 $("#recommand").append(html);
            }
        }
    })
</script>