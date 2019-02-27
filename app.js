//使用express构建web服务器    node_modules中的模块

const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
//引入路由模块
const index = require("./routes/index.router");
const talent = require("./routes/talent.router");
const talent_class = require("./routes/talent_class.router");
const talent_details = require("./routes/talent_details.router");
const cases = require("./routes/cases.router");
const cases_class = require("./routes/cases_class.router");
const cases_details = require("./routes/cases_details.router");
const product_mall = require("./routes/product_mall.router");
const product_class = require("./routes/product_class.router");
const product_details = require("./routes/product_details.router");
const cart = require("./routes/cart.router");
const homepage = require("./routes/homepage.router");


//服务器  端口
var app = express(); 
var serve = app.listen(8000);
//使用模块
//使用中间件
app.use(bodyParser.urlencoded({extended:false}));
//托管静态资源到public
app.use(express.static('public'));
// app.use(Access-Control-Allow-Credentials({extended:true}) );
app.use(cors({origin:"http://127.0.0.1:5500"}));

//使用路由器来管理路由
app.use("/index",index);
app.use("/talent",talent);
app.use("/talent_class",talent_class);
app.use("/talent_details",talent_details);
app.use("/cases",cases);
app.use("/cases_class",cases_class);
app.use("/cases_details",cases_details);
app.use("/product_mall",product_mall);
app.use("/product_class",product_class);
app.use("/product_details",product_details);
app.use("/cart",cart);
app.use("/homepage",homepage);