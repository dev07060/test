//jQuery(function ($) {
//    $("body").css("display", "none");
//    $("body").fadeIn(1000);
//    $("a.transition").click(function (event) {
//        event.preventDefault();
//        linkLocation = this.href;
//        $("body").fadeOut(1000, redirectPage);
//    });
//    function redirectPage() {
//        window.location = linkLocation;
//    }
//});
function forMainBoard(ob){
	
	
	 for (var i = 0; i < ob.length; i++) {
         $('#top').append('<div class="card-deck" id="middle' + i + '"></div><br><br>')
         
         for (var j = 0; j < ob[0].length; j++) {
             if (ob[i][j]) {

                 $('#middle' + i).append(
                     '<div class="card zoom">'
                     + '<div class="card-img-top card-img-top-250" id=""">'
                     + '<a href="uploadSur.do?s_num='+ ob[i][j].s_num +'" class="fancybox" rel="ligthbox"> '
                     + '<img id="boardimg' + i + j + '" src="" class="img-fluid " alt="">'
                     + '</a></div>'
                     + '<div class="card-block p-t-2">'
                     + '<h6 class="small text-wide p-b-2">[' + i + ' , ' + j + ']</h6>'
                     + '<h2><a id="cardExp" href="uploadSur.do?s_num='+ ob[i][j].s_num +'">s_num :' + ob[i][j].s_num
                     + '<br>point : ' + ob[i][j].point + ', 조회수 : ' + ob[i][j].partnum
                     + '<br>hit : ' + ob[i][j].hits + ' , date : ' + ob[i][j].s_date + ' , subject : ' + ob[i][j].subject
                     + '</a></h2>'
                     + '</div></div>');
                 if (!ob[i][j].thumb_path) {
                     $("#boardimg" + i + j).attr(
                         "src",
                         "/DotNet/save/default.jpg");
                 } else {
                     $("#boardimg" + i + j).attr(
                         "src",
                         "/DotNet/save/"
                         + ob[i][j].thumb_path);
                 }
             } else {
                 $('#middle' + i).append(
                     '<div class="card" style="border: 0px"></div>');
             }
         }
     }
}
// 정렬
$(document).ready(

    function () {
        $("select#align").on('focus change ',
            function () {
                var data = {
                    "align": $(this).val()
                };
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    data: data,
                    url: "a.do",
                    success: function (data) {
                        var ob = data.arr;
                        
                        $('#top').children().remove();
                        forMainBoard(ob);
                       
                    },
                    error: function (e) {
                        alert(e + "error");
                    }
                });
            });
    });



$(document).ready(
    function () {
    	
        $('select#align').focus();
        
       
    }
);
//검색
$(document).ready(function () {

    $("#searchButton").on('click',
        function () {
            var data = { "search": $("#searchInput").val() };
            $.ajax({
                type: "POST",
                dataType: "json",
                data: data,
                url: "search.do",
                success: function (data) {
                    var ob = data.arr;
                    if(!ob[0][0]){
                    	$("#no_search").show("slow");
//                    	$("#no_search").toggle("slow");
//                    	alert("검색 결과가 없습니다.")
//                    	$('#top').append('<div class="container"><img src="/DotNetEx/save/default.jpg"><h2>검색 결과가 없네용!!!</h2></div>');
                    	return false;
                    }else{
                    	$("#no_search").hide("slow");

                    	$('#top').children().remove();
                    	forMainBoard(ob);
                    	
                    }
                  
                },
                error: function (e) {
                    alert(e + "error");
                }
            });
        });
});

// 로그인 안하면 글쓰기 불가
function checkId(id){
	if(id == null) {
		alert("아이디없음");
	}
	return false;
}