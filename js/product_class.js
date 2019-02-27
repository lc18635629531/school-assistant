$(function(){
    if(location.search.indexOf("kwords=")!=-1){
      var kwords=decodeURI(
        location.search.split("=")[1]
      );
      var pno=0;
      function loadPage(no=0){//no:新页号
        pno=no;
        $.ajax({
          url:"http://localhost:8000/product_class",
          type:"get",
          data:{kwords,pno},
          dataType:"json",
          success:function(output){
            console.log(output);
            var { products,pageCount }=output;
            var html="";
            for(var p of products){
              var {pid,pname,integral,details,img}=p;
              html+=`<div class="product">
              <a href="">
                  <img src="${img}" alt="">
              </a>
              <div>
                  <p>
                      <span>${pname}</span>
                      <a href="">${details}</a>
                  </p>
                  <div>
                      <span class="wenzi">积分：</span>
                      <span class="count">${integral}</span>
                      <a class="btn join " href="product_details.html" data-pid="${pid}">查看详情</a>
                  </div>
              </div>
          </div>`;
            }
            //$product_item.html(html);
            console.log(html);
            var divProducts=document.querySelector(".products");
            divProducts.nextElementSibling.children[0].children[0].children[1].innerHTML=html;
            var html="";
            for(var i=1;i<=pageCount;i++){
              html+=`<span class="num"><a class="" href="#">1</a></span>`
            }
            //删除中间li:
            $ul.children(":not(:first-child):not(:last-child)").remove()
            //divProducts.nextElementSibling.children[0].children[0].children[2].children[1].innerHTML=html;
            //将html追加到上一页后
            $ul.children().first().after(html)
            if(pno==0){//如果当前页是第一页就禁用上一页
              $ul.children().first().addClass("disabled")
            }else{//否则就启用上一页
              $ul.children().first().removeClass("disabled")
            }
            if(pno==pageCount-1){
              $ul.children().last().addClass("disabled")
            }else{
              $ul.children().last().removeClass("disabled")
            }
          }
        })
      }
      loadPage();
      //$.ajax({...})
      var $plist=$("#plist");
      var $ul=$plist.next().find("nav>ul")
      //只在页面首次加载时，在分页按钮的父元素上绑定一次
      $ul.on("click","a",function(e){
        e.preventDefault();
        var $a=$(this);
        //除了禁用和当前正在激活按钮之外才能点击
        if(!$a.parent().is(".disabled,.active")){
          if($a.parent().is(":first-child"))//上一页
            var no=pno-1;//新页号=当前页号-1
          else if($a.parent().is(":last-child"))
            var no=pno+1;//新页号=当前页号+1
          else//1、2、3按钮
            var no=$a.html()-1;//新页号=按钮内容-1
          loadPage(no);//重新加载新页号的页面内容
        }
      });
      
      
    }
  })