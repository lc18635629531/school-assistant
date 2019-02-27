const express=require("express");
const router=express.Router();
const pool=require("../pool");

//测试地址: http://localhost:8000/talent_class?kwords=
router.get("/",(req,res)=>{
  var kwords=req.query.kwords;
  console.log(kwords);
  var arr=kwords.split(" ")
  for(var i=0;i<arr.length;i++){
    arr[i]=`pname like '%${arr[i]}%'`
  }
  var where=" where "+arr.join(" and ")
  var output={ pageSize:8 } 
  output.pno=req.query.pno;
  var sql="SELECT * FROM sa_talent_pool where tclass = (select tcid from sa_talent_class where tcname = ?) ";
  pool.query(sql,[kwords],(err,result)=>{
    if(err) console.log(err);
    //console.log(result);
    output.count=result.length;//获得总记录数
    output.pageCount=Math.ceil(//计算总页数
      output.count/output.pageSize);
    output.talents=//截取分页后的结果集
      result.slice(output.pno*8,output.pno*8+8);

    res.writeHead(200,{
      "Content-Type":"application/json;charset=utf-8",
      "Access-Control-Allow-Origin":"*"
    })
    res.write(JSON.stringify(output))
    res.end()
  })
  
})

module.exports=router;