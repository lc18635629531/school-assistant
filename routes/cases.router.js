//引入
const express = require("express");
const router = express.Router();
const pool = require("../pool");


//路由查询方法
router.get("/",(req,res)=>{
    var output={cases:[]};
    var sql = `select * from sa_case_details_pool `;
    Promise.all([
        new Promise(function(open){
          pool.query(sql,[],(err,result)=>{
            if(err) console.log(err);
            output.cases=result;
            open();
            console.log("查询所有任务完成!");
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