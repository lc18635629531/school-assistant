const express=require("express")
const router=express.Router()
const pool=require("../pool")
//路由查询个人购物车添加
router.get("/add",(req,res)=>{
  var cpid=req.query.cpid;
  var count=req.query.count;
  var uid=req.session.uid;
  pool.query(
    "select * from sa_shopping_cart where user_id=? and cpid=?",
    [uid,cpid],
    (err,result)=>{
      if(err) console.log(err);
      if(result.length==0){
        pool.query(
          "insert into sa_shopping_cart values(null,?,?,?,0)",
          [uid,cpid,count],
          (err,result)=>{
            if(err) console.log(err);
            res.end();
          }
        )
      }else{
        pool.query(
          "update sa_shopping_cart set count=count+? where user_id=? and cpid=?",
          [count,uid,cpid,],
          (err,result)=>{
            if(err) console.log(err);
            res.end();
          }
        )
      }
    }
  )
  
})
//路由查询个人购物车中商品信息
router.get("/items",(req,res)=>{
  var uid=req.session.uid;
  var sql=`SELECT *,( select  from sa_integral_mall_products_pic where product_id=cpid limit 1 )as sm FROM sa_shopping_cart inner join sa_mall_product on cpid=pid
  where user_id=?`;
  pool.query(sql,[uid],(err,result)=>{
    if(err) console.log(err);
    res.writeHead(200);
    res.write(JSON.stringify(result))
    res.end();
  })
})
//http://localhost:8000/users/signin?uname=dingding&upwd=123456
//http://localhost:8000/cart/update?iid=35&count=新数量
//路由查询个人购物车中添加和删除按钮
router.get("/update",(req,res)=>{
  var scid=req.query.scid;
  var count=req.query.count;
  if(count>0){
    var sql="update sa_shopping_cart set count=? where scid=?";
    var data=[count,scid];
  }else{
    var sql="delete from sa_shopping_cart where scid=?";
    var data=[scid];
  }
  pool.query(sql,data,(err,result)=>{
    if(err) console.log(err);
    res.end();
  })
})

//输出路由
module.exports=router;