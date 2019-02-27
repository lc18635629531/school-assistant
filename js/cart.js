/**加载购物车内容**/
// $.ajax({
//     url: 'data/cart/list.php',
//     success: function (result) {
//       if (result.code === 300) {
//         alertMsg('您尚未登录！');
//         $('#alertMsg_btn1').click(function () {
//           location.href = 'login.html';
//         });
//       } else if (result.code === 200) {
//         var html = '';
//         if (result.data.length) {
//           $.each(result.data, function (i, l) {
//             html += `
//           <div class="center_infor">
//             <div class="center_infor_select">
//               <div class="each">
//                 <span>
//                   <img src="img/mall/product_detail/product_normal.png" alt="">
//                 </span>
//                 <input type="hidden">
//               </div>
//             </div>
//             <div class="center_infor_detail">
//               <div class="product_info_detail" id="">
//                 <a href="product_details.html?pid=${pid}">
//                   <img src="img/mall/product_detail/sm/chongdianbao_sm1.jpg" alt="">
//                 </a>
//                 <input type="hidden">
//                 <span>
//                   <a href="">罗马仕PIE10移动电源10000毫安轻薄聚合物充电宝通用型 轻薄质感、简约典雅、商务典范</a>
//                   <input type="hidden">
//                 </span>
//                 <p>
//                   <span class="norms">规格：</span>
//                   <span class="norms_detail">
//                     "10000mah聚合物移动电源","白色"
//                     <input type="hidden">
//                   </span>
//                 </p>
//               </div>
//             </div>
//             <div class="center_infor_price">
//               <p class="center_infor_price_title">积分值</p>
//               <p class="center_infor_price_num">
//                 <span>
//                   "5000"
//                   <input type="hidden">
//                 </span>
//               </p>
//             </div>
//             <div class="center_infor_count">
//               <span class="center_infor_count_reduce">&nbsp;-&nbsp;</span>
//               <input type="text" value="1">
//               <span class="center_infor_count_add">&nbsp;+&nbsp;</span>
//             </div>
//             <div class="center_infor_integral">
//               <span class="integral_count">5000</span>
//             </div>
//             <div class="center_infor_delete">
//               <a href="" class="delect">删除</a>
//             </div>
//           </div>
//             `;
//           })
//         } else {
//           $('.none').show();
//         }
//         $('.center').html(html);
//       }
//     }
// })

$(function(){
  if(location.search.indexOf("cuid=")!=-1){
    var cuid=decodeURI(
      location.search.split("=")[1]
    );
    $.ajax({
        url:"http://localhost:8000/cart",
        type:"get",
        data:{cuid},
        dataType:"json",
        success: function(output) {
        //console.log(123);
        //console.log(output);
        var {spec}=output;
        var html="";
        for(var p of spec){
            var {pid,details,spec,img,integral} = p;
            html+=`
            <div class="center_infor">
                <div class="center_infor_select">
                  <div class="each">
                    <span class="normal">
                      <img src="img/mall/product_detail/product_normal.png" alt="">
                    </span>
                    <input type="hidden">
                  </div>
                </div>
                <div class="center_infor_detail">
                  <div>
                    <a href="">
                      <img src="${img}" alt="">
                    </a>
                    <input type="hidden">
                    <span>
                      <a href="">${details}</a>
                      <input type="hidden">
                    </span>
                    <p>
                      <span class="norms">规格：</span>
                      <span class="norms_detail">
                        ${spec}
                        <input type="hidden">
                      </span>
                    </p>
                  </div>
                </div>
                <div class="center_infor_price">
                  <p class="center_infor_price_title">积分值</p>
                  <p class="center_infor_price_num">
                    <span>
                      ${integral}
                      <input type="hidden">
                    </span>
                  </p>
                </div>
                <div class="center_infor_count">
                  <span class="center_infor_count_reduce">&nbsp;-&nbsp;</span>
                  <input type="text" value="1">
                  <span class="center_infor_count_add">&nbsp;+&nbsp;</span>
                </div>
                <div class="center_infor_integral">
                  <span class="integral_count">5000</span>
                </div>
                <div class="center_infor_delete">
                  <a href="" class="delect">删除</a>
                </div>
              </div>
            `;
            var divCenter=document.querySelector(".center");
            divCenter.innerHTML=html;
        }
       }
    })
  }
})
        