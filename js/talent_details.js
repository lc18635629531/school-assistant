$(function(){
  if(location.search.indexOf("kwords=")!=-1){
    var kwords=decodeURI(
      location.search.split("=")[1]
    );
    
         $.ajax({
          url:"http://localhost:8000/talent_details",
          type:"get",
          data:{kwords},
          dataType:"json",
          success: function(output) {
            console.log(123);
            console.log(output);
            console.log(output.talent);
            var {talent,case1,case2} =output;
            var {tname,tschool,timg,toname,tbirthday,tsex,tdetails}=talent;
            console.log(talent.tname);
        var divHead=document.querySelector(".detail_head");
        divHead.children[0].children[0].innerHTML=tname;  
        divHead.nextElementSibling.children[0].children[0].children[1].children[0].children[0].innerHTML=tname;
        divHead.nextElementSibling.children[0].children[0].children[1].children[1].children[0].innerHTML=toname;
        divHead.nextElementSibling.children[0].children[0].children[1].children[2].children[0].innerHTML=tsex;
        divHead.nextElementSibling.children[0].children[0].children[1].children[3].children[0].innerHTML=tbirthday;
        divHead.nextElementSibling.children[0].children[1].children[0].children[0].innerHTML=tschool;
        divHead.nextElementSibling.children[0].children[1].children[1].innerHTML=tdetails;

        var divPhoto=document.querySelector(".person_photo");
        var html="";
        html+=`<img src="${timg}" alt="">`;
        divPhoto.children[0].innerHTML=html;

        var ulList = document.querySelector(".new_task_list");
        var html="";
        for(var c1 of case1){
          var {cpname,cpplayer,cpimg}=c1;
          html+=`
            <li>
              <div>
                  <a href="">
                    <img src="${cpimg}" alt="">
                  </a>
                  <div>
                    <h3>
                      <a href="">${cpname}</a>
                      <p>${cpplayer}</p>
                    </h3>
                  </div>
              </div>
            </li>
          `
        }
        ulList.innerHTML=html;
        console.log(html);

        var olList = document.querySelector(".old_task_list");
        var html="";
        for(var c2 of case2){
          var {cpname,cpplayer,cpimg}=c2;
          html+=`
            
            <li class="old_list_item">
                <div>
                    <a href="">
                        <img src="${cpimg}" alt="">
                    </a>
                    <div>
                        <a href=""><b>${cpname}</b></a>
                        <p class="player">${cpplayer}</p>
                    </div>
                </div>
            </li>
          `
        }
        olList.innerHTML=html;
        console.log(html);
  
        }
      })  
    } 
  })