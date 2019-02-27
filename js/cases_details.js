$(function(){
    if(location.search.indexOf("cdpid=")!=-1){
        var cdpid=location.search.split("=")[1];
        // (async function(){
        //     var res=await
    }
            $.ajax({
                url:"http://localhost:8000/cases_details",
                type:"get",
                data:{cdpid},
                dataType:"json",
                success: function(res) {
                    console.log(123);
                    console.log(res);
                    var {cases}=res;
                    var {cdpid,cdpname,cdpschool,cdpperson,cdpaddress,cdpemail,cdpdetails}=cases;
                    var divContainer=document.querySelector(".container");
                    divContainer.children[1].children[0].children[0].innerHTML=cdpname;
                    divContainer.children[1].children[1].children[0].innerHTML=cdpschool;
                    divContainer.children[1].children[2].children[0].innerHTML=cdpperson;
                    divContainer.children[1].children[3].children[0].innerHTML=cdpaddress;
                    divContainer.children[1].children[4].children[0].innerHTML=cdpemail;
                    divContainer.children[1].children[5].children[0].innerHTML=cdpdetails;
                }
            })
       // })
    
})