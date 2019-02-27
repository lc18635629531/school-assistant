//引入
const express = require("express");
const router = express.Router();
const pool = require("../pool");


//路由查询方法
router.get("/",(req,res)=>{
    var output={products:[]};
    var sql = `select * from sa_mall_product `;
    Promise.all([
        new Promise(function(open){
          pool.query(sql,[],(err,result)=>{
            if(err) console.log(err);
            output.products=result;
            open();
            console.log("查询商品完成!");
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
    