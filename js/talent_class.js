$(function(){
    if(location.search.indexOf("kwords=")!=-1){
      var kwords=decodeURI(
        location.search.split("=")[1]
      );
      var pno=0;
      function loadPage(no=0){//no:新页号
        pno=no;
        $.ajax({
          url:"http://localhost:8000/talent_class",
          type:"get",
          data:{kwords,pno},
          dataType:"json",
          success:function(output){
              //console.log(123);
            //console.log(output);
            var {talents,pageCount}=output;
            var html="";
            for(var p of talents){
                var {tpid,tname,tschool,tdetails,timg} = p;
                var divTitle=document.querySelector(".talent_title");
                divTitle.innerHTML=kwords; 

              html+=`
              
                  <div class="person">
                      <a href="">
                          <img src="${timg}" alt="">
                      </a>
                      <div>
                          <p>
                              <span>${tname}</span>
                              <a href="">${tdetails}</a>
                          </p>
                          <div>
                              <span>${tschool}</span>
                              <button>查看详情</button>
                          </div>
                      </div>
                  </div>
              
              `;
            }
            //console.log(html);
            var divTalents=document.querySelector(".talent_list");
            divTalents.innerHTML=html;
            var html="";
            for(var i=1;i<=pageCount;i++){
              html+=`<span class="num">1</span>`
            }
            $page.children(":not(:first-child):not(:last-child)").remove()
            //将html追加到上一页后
            $page.children().first().after(html)
            if(pno==0){//如果当前页是第一页就禁用上一页
              $page.children().first().addClass("disabled")
            }else{//否则就启用上一页
              $page.children().first().removeClass("disabled")
            }
            if(pno==pageCount-1){
              $page.children().last().addClass("disabled")
            }else{
              $page.children().last().removeClass("disabled")
            }
          }
        })
      }
      loadPage();
      var $list=$(".talent_list");
      var $page=$(".talent_page")
      //只在页面首次加载时，在分页按钮的父元素上绑定一次
      $page.on("click","span",function(e){
        e.preventDefault();
        var $span=$(this);
        //除了禁用和当前正在激活按钮之外才能点击
        if(!$span.parent().is(".disabled,.active")){
          if($span.parent().is(":first-child"))//上一页
            var no=pno-1;//新页号=当前页号-1
          else if($span.parent().is(":last-child"))
            var no=pno+1;//新页号=当前页号+1
          else//1、2、3按钮
            var no=$span.html()-1;//新页号=按钮内容-1
          loadPage(no);//重新加载新页号的页面内容
        }
      });
      
    }
  })