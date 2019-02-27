$(function(){
    $.ajax({
        url:"http://localhost:8000/cases",
        type:"get",
        dataType:"json",
        success: function(output) {
             //console.log(123);
             //console.log(output);
            var { cases }=output;
            var html="";
            for(var c of cases){
                var {cdpid,cdpname,cdpschool,cdpperson} = c;
                //console.log(c.cdpname);
                html+=`
                <div class="col-3 ">
                    <h3>${cdpschool}</h3>
                    <h5>${cdpperson}</h5>
                    <p>${cdpname}</p>
                    <a href="" class="apply">查看</a>
                </div> 
                `
            }
            var divCases=document.querySelector(".center-cases");
            //console.log(divCases);
            divCases.children[1].innerHTML=html;
            //console.log(html);

            
        }
    })
})