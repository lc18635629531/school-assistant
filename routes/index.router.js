//引入
const express = require("express");
const router = express.Router();
const pool = require("../pool");


//路由查询方法
router.get("/",(req,res)=>{
    var sql = `select * from sa_person_pool `;
    pool.query(sql,[],(err,result)=>{
        if(err) console.log(err);
        //res.send(result);
        res.writeHead(200,{
            "Content-Type":"application/json;charset=utf-8",
            "Access-Control-Allow-Origin":"*"
          })
          res.write(JSON.stringify(result));
          res.end();
    })
});
//输出路由模块
module.exports = router;