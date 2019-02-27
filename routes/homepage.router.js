const express=require("express");
const router=express.Router();
const pool=require("../pool");

//http://localhost:8000/homepage?shcid=1
router.get("/",(req,res)=>{
  var shcid = req.query.shcid;
  console.log(shcid);
  var output={information:{},case1:[],case2:[],case3:[],case4:[],case5:[]};
  //var shcid=1;
  //console.log(shcid);
  
  var sql1="select * from sa_homepage_center where shcid = ?";
  var sql2="select * from sa_person_task where sptperson = (select shcname from sa_homepage_center where shcid = ?) and sptfinish = 1";
  var sql3="select * from sa_person_task where sptperson = (select shcname from sa_homepage_center where shcid = ?) and sptfinish = 0";
  var sql4="select * from sa_apply_task where satperson = (select shcname from sa_homepage_center where shcid = ?)";
  var sql5="select * from sa_publish_task where sptperson = (select shcname from sa_homepage_center where shcid = ?)";
  var sql6="select * from sa_exchange_product where sepperson = (select shcname from sa_homepage_center where shcid = ?)";
  Promise.all([
    new Promise(function(open){
      pool.query(sql1,[shcid],(err,result)=>{
        if(err) console.log(err);
        output.information=result[0];
        open();
        console.log("查询个人信息完成!");
        //console.log(result[0]);
      })
    }),
    new Promise(function(open){
      pool.query(sql2,[shcid],(err,result)=>{
        if(err) console.log(err);
        output.case1=result;
        open()
        console.log("查询个人任务完成的");
       // console.log(result);
      })
    }),
    new Promise(function(open){
      pool.query(sql3,[shcid],(err,result)=>{
        if(err) console.log(err);
        output.case2=result;
        open()
        console.log("查询个人任务未完成的");
        //console.log(result);
      })
    }),
    new Promise(function(open){
      pool.query(sql4,[shcid],(err,result)=>{
        if(err) console.log(err);
        output.case3=result;
        open()
        console.log("查询个人申请任务完成");
        //console.log(result);
      })
    }),
    new Promise(function(open){
      pool.query(sql5,[shcid],(err,result)=>{
        if(err) console.log(err);
        output.case4=result;
        open()
        console.log("查询个人发布任务完成");
        //console.log(result);
      })
    }),
    new Promise(function(open){
      pool.query(sql6,[shcid],(err,result)=>{
        if(err) console.log(err);
        output.case5=result;
        open()
        console.log("查询个人兑换商品完成");
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
