// $(function(){
//     $.ajax({
//       url:"http://127.0.0.1:8000/header.html",
//       type:"get",
//       success:function(res){
//        // console.log(res);
//         //动态添加<link>到<head>元素中，自动引入header.css
//         $("<link rel='stylesheet' href='css/header.css'>").appendTo("head");
//         //用接收到的片段代替页面上空的<header>
//         $(res)//<header>
//          .replaceAll("#header");
//       }
//     })
//   })
  $(function() {
    $("#header").load("./header.html");
    $("<link rel='stylesheet' href='./css/header.css' />").appendTo("head");
  });