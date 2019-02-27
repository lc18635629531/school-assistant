const express=require("express");
const router=express.Router();
const pool=require("../pool");

//http://localhost:8000/product_detials?pid=18
router.get("/",(req,res)=>{
  var output={product:{},pics:[]};
  // var pid=req.query.pid;
  var pid=1;
  console.log(pid);
  var sql1="select * from sa_mall_product where pid=1";
  var sql2="select * from sa_integral_mall_products_pic where product_id=1";//用pid查当前商品图片列表
  Promise.all([
    new Promise(function(open){
      pool.query(sql1,[pid],(err,result)=>{
        if(err) console.log(err);
        output.product=result[0];
        open();
        console.log("查询product完成!");
      })
    }),
    new Promise(function(open){
      pool.query(sql2,[pid],(err,result)=>{
        if(err) console.log(err);
        output.pics=result;
        open()
        console.log("查询pics完成");
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
