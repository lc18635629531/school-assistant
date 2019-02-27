const express=require("express");
const router=express.Router();
const pool=require("../pool");

//http://localhost:8000/cases_detials?cdpid=18
router.get("/",(req,res)=>{
  var output={cases:{}};
  var cdpid=req.query.cdpid;
  console.log(cdpid);
  var sql="select * from sa_case_details_pool where cdpid = ?";
  Promise.all([
    new Promise(function(open){
      pool.query(sql,[cdpid],(err,result)=>{
        if(err) console.log(err);
        output.cases=result[0];
        open();
        console.log("查询任务详细情况完成!");
      })
    }),
    
  ]).then(function(){
    res.writeHead(200,{
      "Content-Type":"application/json;charset=utf-8",
      "Access-Control-Allow-Origin":"*"
    })
    res.write(JSON.stringify(output));
    res.end();
    console.log("响应完成!");
  })
})

module.exports=router;
