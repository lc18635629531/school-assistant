$(function(){
//向http://localhost:8000/index发送get请求
  $.ajax({
    url:"http://localhost:8000/index",
    type:"get",
    dataType:"json",//因为返回jsonp字符串，所以希望自动转为对象
    success: function(result) {
       //console.log(result);
    var p0=result[0];
    var html=`
    <a href="${p0.spphref}">
      <img src="${p0.sppimg}"  alt="">
      <p class="h3 my_wenzi">${p0.sppname}</p>
    </a>
    `;
    var divMain=document.getElementById("main");
    var divP1=divMain.children[2].children[0].children[0];
    divP1.innerHTML=html;
  
    var p1=result[1];
    var html=`
    <a href="${p1.spphref}">
      <img src="${p1.sppimg}"  alt="">
      <p class="h3 my_wenzi">${p1.sppname}</p>
    </a>
    `;
    divP1.nextElementSibling.innerHTML=html;

    var p2=result[2];
    var html=`
    <a href="${p2.spphref}">
      <img src="${p2.sppimg}"  alt="">
      <p class="h3 my_wenzi">${p2.sppname}</p>
    </a>
    `;
    divP1.parentNode
      .parentNode
      .children[2]
      .children[0].innerHTML=html;

    var p3=result[3];
    var html=`
    <a href="${p3.spphref}">
      <img src="${p3.sppimg}"  alt="">
      <p class="h3 my_wenzi">${p3.sppname}</p>
    </a>
    `;
    divP1.parentNode
      .parentNode
      .children[2]
      .children[1].innerHTML=html;  
      
    var p4=result[4];
    var html=`
    <a href="${p4.spphref}">
      <img src="${p4.sppimg}"  alt="">
      <p class="h3 my_wenzi">${p4.sppname}</p>
    </a>
    `;
    divMain
      .children[3]
      .children[0].innerHTML=html;
      
    var p5=result[5];
    var html=`
    <a href="${p5.spphref}">
      <img src="${p5.sppimg}"  alt="">
      <p class="h3 my_wenzi">${p5.sppname}</p>
    </a>
    `;
    divMain
      .children[3]
      .children[1].innerHTML=html;

    var p6=result[6];
    var html=`
    <a href="${p6.spphref}">
      <img src="${p6.sppimg}"  alt="">
      <p class="h3 my_wenzi">${p6.sppname}</p>
    </a>
    `;
    divMain
      .children[3]
      .children[2].innerHTML=html;
  
    var p7=result[7];
    var html=`
    <a href="${p7.spphref}">
      <img src="${p7.sppimg}"  alt="">
      <p class="h3 my_wenzi">${p7.sppname}</p>
    </a>
    `;
    divMain
      .children[3]
      .children[3].innerHTML=html;
    }
  })
})
