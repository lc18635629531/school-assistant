//引入
const express = require("express");
const router = express.Router();
const pool = require("../pool");


//路由查询方法
router.get("/",(req,res)=>{
    var output={talents1:[],talents2:[],talents3:[]};
    var sql1 = `select * from sa_talent_pool where tclass = 1`;
    var sql2 = `select * from sa_talent_pool where tclass = 2`;
    var sql3 = `select * from sa_talent_pool where tclass = 3`;
    Promise.all([
        new Promise(function(open){
          pool.query(sql1,[],(err,result)=>{
            if(err) console.log(err);
            output.talents1=result;
            open();
            console.log("查询学习人物完成!");
          })
        }),
        new Promise(function(open){
          pool.query(sql2,[],(err,result)=>{
            if(err) console.log(err);
            output.talents2=result;
            open();
            console.log("查询特长爱好完成!");
          })
        }),
        new Promise(function(open){
          pool.query(sql3,[],(err,result)=>{
            if(err) console.log(err);
            output.talents3=result;
            open();
            console.log("查询生活百科完成!");
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