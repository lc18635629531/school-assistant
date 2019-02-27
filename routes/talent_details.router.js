const express=require("express");
const router=express.Router();
const pool=require("../pool");

//http://localhost:8000/talent_detials?kwords=王一一
router.get("/",(req,res)=>{
  var kwords=req.query.kwords;
  console.log(kwords);
  var output={talent:{},case1:[],case2:[]};
  //var kwords="王一一";
  //console.log(kwords);
  
  var sql1="select * from sa_talent_pool where tname = ?";
  var sql2="select * from sa_case_pool where cp_tid = (select tpid from sa_talent_pool where tname = ? ) and cpisfinish = 1"
  var sql3="select * from sa_case_pool where cp_tid = (select tpid from sa_talent_pool where tname = ? ) and cpisfinish = 0";
  Promise.all([
    new Promise(function(open){
      pool.query(sql1,[kwords],(err,result)=>{
        if(err) console.log(err);
        output.talent=result[0];
        open();
        console.log("查询个人信息完成!");
        //console.log(result[0]);
      })
    }),
    new Promise(function(open){
      pool.query(sql2,[kwords],(err,result)=>{
        if(err) console.log(err);
        output.case1=result;
        open()
        console.log("查询个人任务完成的");
        //console.log(result);
      })
    }),
    new Promise(function(open){
      pool.query(sql3,[kwords],(err,result)=>{
        if(err) console.log(err);
        output.case2=result;
        open()
        console.log("查询个人任务未完成的");
        //console.log(result);
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
