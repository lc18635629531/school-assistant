
const express=require("express");
const router=express.Router();
const pool=require("../pool");

//http://localhost:8000/cart?cuid=1
router.get("/",(req,res)=>{
  var cuid=req.query.cuid;
  var output={products:{},spec:[]};
  //var cuid=1;
  console.log(cuid);
  
  
  var sql2="select * from sa_mall_product where pfamily_id = cpid";//( select cpid from sa_shopping_cart where cuid = ?)";
  Promise.all([
  new Promise(function(open){
    pool.query(sql2,[cuid],(err,result)=>{
      if(err) console.log(err);
      output.spec=result;
      var cpid = ouput.spec.cpid;
      var sql1="select cpid from sa_shopping_cart where cuid = ?";
      new Promise(function(open){
        pool.query(sql1,[cuid],(err,result)=>{
          if(err) console.log(err);
          output.products=result[0];
          open();
          console.log("查询个人购物车完成!");
          //open();
          console.log("商品信息");
        })
      })
    })
  }),
    
  // var sql1="select cpid from sa_shopping_cart where cuid = ?";//( select cpid from sa_shopping_cart where cuid = ?)";
  // Promise.all([
  // new Promise(function(open){
  //   pool.query(sql1,[cuid],(err,result)=>{
  //     if(err) console.log(err);
  //     output.products=result;
  //     var cpid = cpid;
  //     var sql2="select * from sa_mall_product where pfamily_id = cpid";
  //     new Promise(function(open){
  //       pool.query(sql2,[cuid],(err,result)=>{
  //         if(err) console.log(err);
  //         output.spec=result[0];
  //         open();
  //         console.log("查询个人购物车完成!");
  //         //open();
  //         console.log("商品信息");
  //       })
  //     })
  //   })
  // }),

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
