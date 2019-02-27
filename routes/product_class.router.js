const express=require("express");
const router=express.Router();
const pool=require("../pool");

//测试地址: http://localhost:8000/product_class?kwords=吹风机
router.get("/",(req,res)=>{
           //bodyParser:url.parse(req.url,true)
  var kwords=req.query.kwords;
  //"吹风机"
  console.log(kwords);
  var arr=kwords.split(" ")//arr[吹风机]
  for(var i=0;i<arr.length;i++){
    arr[i]=`pname like '%${arr[i]}%'`
  }//arr[title like '%吹风机%', ... ]
  var where=" where "+arr.join(" and ")
  //要回发客户端的支持分页的对象
  var output={ pageSize:9 } //每页9个商品
  output.pno=req.query.pno;
  var sql="SELECT * FROM sa_mall_product where pname = ? ";
  pool.query(sql,[kwords],(err,result)=>{
    if(err) console.log(err);
    output.count=result.length;//获得总记录数
    output.pageCount=Math.ceil(//计算总页数
      output.count/output.pageSize);
    output.products=//截取分页后的结果集
      result.slice(output.pno*9,output.pno*9+9);

    res.writeHead(200,{
      "Content-Type":"application/json;charset=utf-8",
      "Access-Control-Allow-Origin":"*"
    })
    res.write(JSON.stringify(output))
    res.end()
  })
  
})

module.exports=router;