$(function(){
    $.ajax({
        url:"http://localhost:8000/product_mall",
        type:"get",
        dataType:"json",
        success: function(output) {
            console.log(123);
            console.log(output);
            var { products }=output;
            var html="";
            for(var p of products){
                var {pid,pname,synopsis,integral,img} = p;
                console.log(products.pname);
                html+=`
                    <li class="float-left position-relative text-center product_item">
                      <a href="">
                        <img src="${img}" alt="" >
                        <div>
                            <h3 class="product-name">${pname}</h3>
                            <h4 class="product-introduction">${synopsis}</h4>
                            <h4 class="product-introduction">积分
                                <span class="integral">${integral}</span>
                            </h4>
                        </div>
                      </a>
                    </li>
                `
            }
            var liProduct=document.querySelector(".list-unstyled");
            console.log(liProduct);
            liProduct.innerHTML=html;
            console.log(html);
        }
    })
})