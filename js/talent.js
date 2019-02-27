$(function(){
    $.ajax({
        url:"http://localhost:8000/talent",
        type:"get",
        dataType:"json",
        success: function(output) {
            // console.log(123);
            // console.log(output);
            var { talents1 }=output;
            var html="";
            for(var p of talents1){
                var {tpid,tname,tschool,tremark,timg} = p;
                // console.log(talents1.tname);
                html+=`
            <div class="private_card">
                <div class="private_photo">
                    <img src="${timg}" alt="" class="photo">
                </div>
                <div class="private_details">
                    <h3 class="private_name">${tname}</h3>
                    <h6 class="private_school">${tschool}</h6>
                    <h6 class="private_remark">备注：${tremark}</h6>
                    <button href="#" class="private_apply">发出邀请</button>
                </div> 
            </div>  
                `
            }
            var divStudy=document.querySelector(".private_study");
            // console.log(divStudy);
            divStudy.innerHTML=html;
            // console.log(html);

            var { talents2 }=output;
            var html="";
            for(var p of talents2){
                var {tpid,tname,tschool,tremark,timg} = p;
                // console.log(talents2.tname);
                html+=`
            <div class="private_card">
                <div class="private_photo">
                    <img src="${timg}" alt="" class="photo">
                </div>
                <div class="private_details">
                    <h3 class="private_name">${tname}</h3>
                    <h6 class="private_school">${tschool}</h6>
                    <h6 class="private_remark">备注：${tremark}</h6>
                    <button href="#" class="private_apply">发出邀请</button>
                </div> 
            </div>  
                `
            }
            var divHobby=document.querySelector(".private_hobby");
            // console.log(divHobby);
            divHobby.innerHTML=html;
            // console.log(html);

            var { talents3 }=output;
            var html="";
            for(var p of talents3){
                var {tpid,tname,tschool,tremark,timg} = p;
                // console.log(talents3.tname);
                html+=`
            <div class="private_card">
                <div class="private_photo">
                    <img src="${timg}" alt="" class="photo">
                </div>
                <div class="private_details">
                    <h3 class="private_name">${tname}</h3>
                    <h6 class="private_school">${tschool}</h6>
                    <h6 class="private_remark">备注：${tremark}</h6>
                    <button href="#" class="private_apply">发出邀请</button>
                </div> 
            </div>  
                `
            }
            var divLife=document.querySelector(".private_life");
            // console.log(divLife);
            divLife.innerHTML=html;
            // console.log(html);
        }
    })
})