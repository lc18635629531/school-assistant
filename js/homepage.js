$(function(){
    if(location.search.indexOf("shcid=")!=-1){
      var shcid=decodeURI(
        location.search.split("=")[1]
      );
      
           $.ajax({
            url:"http://localhost:8000/homepage",
            type:"get",
            data:{shcid},
            dataType:"json",
            success: function(output) {
              //console.log(123);
              //console.log(output);
              //console.log(output.information);
              var {information,case1,case2,case3,case4,case5} =output;
              var {shcname,shcintegral,shcimg}=information;
              //console.log(information.shcname);
          var divMain=document.querySelector(".main");
          divMain.children[0].children[0].children[0].children[1].children[0].innerHTML=shcname;
          divMain.children[0].children[0].children[1].children[1].children[0].children[0].innerHTML=shcintegral;

          var divPhoto=document.querySelector(".user_photo");
          var html=`
          <img src="${shcimg}">
          `
          divPhoto.innerHTML=html;  
          
  
          var divCompleted=document.getElementById("completed");
          var html="";
          for(var c1 of case1){
            var {sptname,sptimg,spttime}=c1;
            html+=`
        <li >
            <a href="" class="good" >
                <img alt="" class="lrc-image  img-loaded" title="" src="${sptimg}">
            </a>
            <div class="state" >
                <div class="text">
                    ${sptname}
                </div>
                <div class="other">
                    <div class="type">完成时间</div>
                    <span class="spacer"></span>
                    <div class="date">${spttime}</div>
                </div>
            </div>
            <div class="operate">
                <a class="link" href="" target="_blank" rel="noopener noreferrer" >
                    查看详情
                </a> 
            </div>
        </li>
            `
          }
          divCompleted.children[0].innerHTML=html;
        //   console.log(html);
  
          var divApply = document.getElementById("apply");
          for(var c3 of case3){
          var html="";
          var {satname,satimg,sattime}=c3;
            html+=`
        <li >
            <a href="" class="good" >
                <img alt="" class="lrc-image  img-loaded" title="" src="${satimg}">
            </a>
            <div class="state" >
                <div class="text">
                    ${satname}
                </div>
                <div class="other">
                    <div class="type">完成时间</div>
                    <span class="spacer"></span>
                    <div class="date">${sattime}</div>
                </div>
            </div>
            <div class="operate">
                <a class="link" href="" target="_blank" rel="noopener noreferrer" >
                    查看详情
                </a> 
            </div>
        </li>
            `
          }
          divApply.children[0].innerHTML=html;
          //console.log(html);

          var divPublish = document.getElementById("publish");
          for(var c4 of case4){
          var html="";
          var {sptname,sptimg,spttime}=c4;
            html+=`
        <li >
            <a href="" class="good" >
                <img alt="" class="lrc-image  img-loaded" title="" src="${sptimg}">
            </a>
            <div class="state" >
                <div class="text">
                    ${sptname}
                </div>
                <div class="other">
                    <div class="type">完成时间</div>
                    <span class="spacer"></span>
                    <div class="date">${spttime}</div>
                </div>
            </div>
            <div class="operate">
                <a class="link" href="" target="_blank" rel="noopener noreferrer" >
                    查看详情
                </a> 
            </div>
        </li>
            `
          }
          divPublish.children[0].innerHTML=html;
          //console.log(html);

          var divUnfinished = document.getElementById("unfinished");
          for(var c2 of case2){
          var html="";
          var {sptname,sptimg,spttime}=c2;
            html+=`
        <li >
            <a href="" class="good" >
                <img alt="" class="lrc-image  img-loaded" title="" src="${sptimg}">
            </a>
            <div class="state" >
                <div class="text">
                    ${sptname}
                </div>
                <div class="other">
                    <div class="type">完成时间</div>
                    <span class="spacer"></span>
                    <div class="date">${spttime}</div>
                </div>
            </div>
            <div class="operate">
                <a class="link" href="" target="_blank" rel="noopener noreferrer" >
                    查看详情
                </a> 
            </div>
        </li>
            `
          }
          divUnfinished.children[0].innerHTML=html;
          //console.log(html);

          var divGoods = document.getElementById("goods");
          for(var c5 of case5){
          var html="";
          var {sepname,sepimg,septime}=c5;
            html+=`
        <li >
            <a href="" class="good" >
                <img alt="" class="lrc-image  img-loaded" title="" src="${sepimg}">
            </a>
            <div class="state" >
                <div class="text">
                    ${sepname}
                </div>
                <div class="other">
                    <div class="type">完成时间</div>
                    <span class="spacer"></span>
                    <div class="date">${septime}</div>
                </div>
            </div>
            <div class="operate">
                <a class="link" href="" target="_blank" rel="noopener noreferrer" >
                    查看详情
                </a> 
            </div>
        </li>
            `
          }
          divGoods.children[0].innerHTML=html;
          //console.log(html);

          }
        })  
      } 
    })