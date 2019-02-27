$(function(){
  //  if(location.search.indexOf("pid=")!=-1){
  //    var pid=location.search.split("=")[1];
  //   (async function(){
  //      var res=await
       $.ajax({
        url:"http://localhost:8000/product_details",
        type:"get",
        //data:{pid},
        dataType:"json",
        success: function(res) {
         //console.log(123);
         // console.log(res);
          var {product,pics}=res;
      var {pname,subtitle,integral,spec,color,details,promise,lists,area}=product;
      //console.log(product.pname);

      var divMain=document.getElementById("main");
      divMain.children[0].children[0].children[0].children[2].innerHTML=pname;  
      divMain.children[0].children[1].children[1].children[0].innerHTML=subtitle;
      divMain.children[0].children[1].children[1].children[2].children[0].children[1].children[0].innerHTML=integral;
      divMain.children[0].children[1].children[1].children[4].children[1].children[0].innerHTML=spec;
      divMain.children[0].children[1].children[1].children[5].children[1].innerHTML=color;
      divMain.children[0].children[2].children[1].children[2].children[0].children[0].children[0].children[0].children[1].innerHTML=details;
      divMain.children[0].children[2].children[1].children[2].children[0].children[0].children[0].children[1].children[1].innerHTML=promise;
      divMain.children[0].children[2].children[1].children[2].children[0].children[0].children[0].children[2].children[1].innerHTML=area;
      divMain.children[0].children[2].children[1].children[2].children[0].children[0].children[0].children[3].children[1].innerHTML=lists;

      var divPrev=document.getElementById("preview");
      var ul=divPrev.querySelector(
        "div>div.card-body>div>ul"
      );
      var html="";
      for(var pic of pics){
        var {sm,md,lg,slg}=pic;
        html+=`<li class="float-left p-1">
          <img src="${sm}" data-md="${md}" data-lg="${lg}">
        </li>`
      }
    
      ul.innerHTML=html;
      ul.style.width=60*pics.length+"px";
      var slimg=divMain.querySelector(
         "div>div.product_details_tail>div.tab-content>div.product_introduce>div"
       );
     var html=`
     <img src="${slg}" alt="">
     `;
    slimg.innerHTML=html;
      var mImg=divPrev.querySelector(
        "div>img.card-img-top"
      )
      mImg.src=pics[0].md;
      var lgDiv=document.getElementById("div-lg");
      lgDiv.style.backgroundImage=`url(${pics[0].lg})`;
      //鼠标进入每个小图片，切换中图片和大图片
      ul.onmouseover=function(e){
        if(e.target.nodeName==="IMG"){
          var img=e.target;
          var md=img.dataset.md;
          var lg=img.dataset.lg;
          mImg.src=md;
          lgDiv.style.backgroundImage=`url(${lg})`;
        }
      }
      //小图片左右移动
      var $ul=$(ul);
      var $left=//找到左边按钮-后退按钮
        $("#preview>div>div.card-body>img:first")
      //找到右边按钮-前进按钮
      var $right=$left.nextAll().last()
      //如果pics中图片总数<=4
      if(pics.length<=4)
        //为右边按钮添加disabled class
        $right.addClass("disabled")
      var moved=0;//记录已经左移的图片个数
      $left.on("click",function(){
        var $left=$(this);
        if(!$left.is(".disabled")){
          moved--;//已经左移的图片个数-1
          //ul的marginLeft始终等于:-li宽度62*左移图片个数
          $ul.css("marginLeft",-60*moved)//不用px
          $right.removeClass("disabled")
          if(moved==0)
            $left.addClass("disabled")
        }
      })
      $right.on("click",function(){
        var $right=$(this);
        if(!$right.is(".disabled")){
          moved++;//已经左移的图片个数+1
          $ul.css("marginLeft",-60*moved)
          //让左边按钮去掉disabled class
          $left.removeClass("disabled")
          //如果pics中的图片总个数-moved次数==4
          if(pics.length-moved==4)
            //为右边按钮加上disabled class
            $right.addClass("disabled")
        }
      })

      var $mImg=$(mImg),//中图片
          $lgDiv=$(lgDiv),//大图片
          $mask=$("#mask"),//半透明遮罩
          $smask=$("#super-mask");//透明玻璃板
      var MSIZE=200,//mask的大小
          MAX=400-MSIZE;//top和left的最大值
      $smask
      .hover(
        function(){
          $mask.toggleClass("d-none");
          $lgDiv.toggleClass("d-none");
        }
      )
      .mousemove(function(e){
        var left=e.offsetX-MSIZE/2;
        var top=e.offsetY-MSIZE/2;
        if(left<0) left=0; 
        else if(left>MAX) left=MAX;
        if(top<0) top=0;
        else if(top>MAX) top=MAX;
        $mask.css({left,top});
        $lgDiv.css("background-position",
          `-${0.4*left}px -${0.4*top}px`)
      })
    }
  })
})