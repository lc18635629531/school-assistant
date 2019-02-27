set names utf8;
drop database if exists sa;
create database sa charset=utf8;
use sa;

--网站基本信息
create table sa_site_info(
  site_name varchar(16),
  logo varchar(64),
  copyright varchar(64)
);
insert into sa_site_info value(
  "学校助手","images/logo.png","©2018 LC科技有限公司 版权所有 京ICP备08000999号-99"
);

--导航条目
create table sa_navbar_item(
	name varchar(16),
	url varchar(64),
	title varchar(32)          --提示字
);
insert into sa_navbar_item value("首页","/index.html","大致情况"),
("学习服务","/second.html","有关学习方面的"),
("特色服务","/third.html","新奇活动兴趣"),
("生活百科","/fourth.html","生活多种多样"),
("积分商城","/integral_mall.html","多样的商品"),
("申请任务","/apply_task.html","帮助别人的"),
("发布任务","/publish_task.html","寻找帮忙的"),
("人才库","/talent.html","所有人才"),
("任务库","/case.html","所有任务"),
("联系我们","/finally.html","尾页联系我们");

--轮播图
create table sa_carousel_item(
	cid int primary key ,
	pic varchar(128),
	url varchar(128),
	title varchar(32)          --提示文字
);
insert into sa_carousel_item value(null,"images/banner1.png","/m1.html","来帮帮我"),
(null,"images/banner2.png","/m1.html","来帮帮我"),
(null,"images/banner3.png","/m1.html","来帮帮我"),
(null,"images/banner4.png","/m1.html","来帮帮我");

--商品列表
create table sa_mall_product(
	pid int PRIMARY KEY AUTO_INCREMENT,
	pname VARCHAR(128),         --商品名称
	synopsis VARCHAR(64),       --简单介绍
	subtitle VARCHAR(128),      --副标题
	integral DECIMAL(6),        --积分
	img varchar(128),	        --图片
	spec VARCHAR(64),           --规格
	color VARcHAR(8),           --颜色
	details varchar(1024),      --产品详细说明
	pfamily_id int,             --所属商品家族分类
	promise VARCHAR(64),        --服务承诺
	lists VARCHAR(256),         --包装清单
	area VARCHAR(256)	        --产地   
);
insert into sa_mall_product value(null,"吹风机","恒温护法 轻松快速","电吹风家用6100大功率吹风筒 真正大风力 吹风靠实力",
"5000","img/mall/chuifengji.jpg","6100大功率吹风筒","黑金","万家风(WJW) 电吹风机家用6100 大功率吹风筒 真正大风力 吹风靠实力",1,"在您购买后30天内，出现质量问题均可退换货！","电吹风X1","生产公司：广州市万家风电器有限公司 生产地址：广州市番禹区市桥街环城中路63、65、67、69号梅山大厦三楼"),
(null,"望远镜","高清夜视 增透镀膜","西湾CIWA 天文望远镜高清高倍夜视专业观星深空 50AZ ",
"50000","img/mall/wangyuanjing.jpg","天文望远镜","50AZ","西湾CIWA 天文望远镜高清高倍夜视专业观星深空 50AZ",3,"如有质量问题，从收到礼品当天起15个工作日内更换，客服热线：4000599356","天文望远镜X1、售后服务卡X1","生产企业：北京西湾光电科技有限公司生产地址：北京市朝阳区北四环东路108号"),
(null,"牙刷","声波电动 智能防水","匹奇pritech 声波电动防水牙刷家用版",
"3000","img/mall/yashua.jpg","ES-1060","白色","声波震动牙刷",8,"支持七天无理由退换货，质量问题，运费由商家承担，非质量问题，运费由客户自行承担。客服热线：400 820 6021","牙刷一个","生产厂家 温州市天罡贸易有限公司 生产地址 浙江省温州市经济开发区雁荡东"),
(null,"停车牌","软磁贴扣 独立卡槽","途美 汽车隐藏式停车号码牌 路边临时停车挪车牌 汽车用品 M88",
"2000","img/mall/tingchepai.jpg","停车牌","黑色","1，标配6组0到9号码软磁贴扣，可满足更多用户需求；2，瞬间切换号码的显示和隐藏，更好，更便捷的保护车主的隐私；3，软磁材质的号码加独立号码卡槽，超方便的安装及更换号码；4，汽车专用级软3M胶底座，稳固且移动不留痕。",6,"如有质量问题，从收到礼品当天起7天内包退，15个工作日内更换；一年之内保修。客服热线：400-1831122 移动售后：18701008652。","停车牌X1","制造商：深圳宏润天语科技有限公司
地址：深圳市宝安区西乡街道黄麻布社区"),
(null,"小音箱","无线蓝牙 智能兼容","好吖优 无线蓝牙音箱手机迷你音响插卡电脑低音小钢炮",
"4000","img/mall/xiaoyingxiang.jpg","七彩小钢炮","颜色随机","无线蓝牙魅力 强悍小钢炮 坚守好声音",4,"收到商品后发现商品破损，从收货起72小时内联系商家退换，运费由商家承担；无理由退换，运费由客户自行承担！客服热线：400-848-9890。","产品以及包装","浙江省慈溪市文化商务区友谊大厦 宁波吉优特电子商务有限公司"),
(null,"数据线","兼容接口 传输稳定","品胜PISEN 苹果快充版1000mm数据线 爱充1A充电器套装",
"1500","img/mall/shujuxian.jpg","苹果快充线10000mm","苹果白","苹果快充线：完美兼容苹果所有Lighting接口产品，双面设计充电传输更稳定，数据线、充电线二合一，先进生产工艺使用寿命更加长久。爱充1A充电器：采用开关电源技术，性能出众，轻便可靠 内置智能保护系统，安全无忧 最新科技芯片组，高效转换，性能稳定 大电流供电，充电更迅速。",4,"严格执行国家三包政策，享受全国联保服务，质保期内，可享受免费保修等三包服务，质量问题可到就近官方公布的授权维修站享受服务；非质量问题等因买家原因需要退换货的，需产品无损伤且包装完好，不影响二次销售情况下，联系售后客服，由售后客服提供退换货地址，运费需买家承担","快充套装：数据线一根、充电头一个；苹果快充线1000mm：数据线一根；爱充1A充电器：充电头一个","制造商：广东品胜电子股份有限公司;
地址：深圳市龙岗区横岗镇六约牛始埔村金塘工业区勤富一街9号"),
(null,"蒸锅","能蒸善煮 防烫手柄","万德霍 天作之合双层不锈钢蒸锅 ",
"4000","img/mall/zhengguo.jpg","不锈钢蒸锅","双层+28cm","透明钢化玻璃与不锈钢组合盖,烹饪过程清晰可见 万德霍 双层蒸锅 不锈钢蒸锅",10,"如有质量问题，从收到礼品当天起7个工作日内更换；客服电话4000-159-189，13810469556","双层蒸锅一个","制造商：深圳万德霍家具用品有限公司 地址：深圳市宝安区西乡街道海滨新村18栋2楼"),
(null,"羽绒被","透气保暖 轻盈蓬松","艾莱依 羽绒被芯床上用品秋冬被子保暖被双人被子",
"40000","img/mall/yurongbei.jpg","150x210","白色","产品详细信息可参考页面介绍产品参数",10,"收到商品后如发现商品损坏，从收货起72小时内联系商家退换，运费由商家承担；无理由退换，运费由客户自行承担！客服热线：4009916613","艾莱依专用包装袋","公司名称：上海艾莱依家用纺织品有限公司公司地址：上海市普陀区光复西路2899弄艾莱依工厂地址：嘉兴市平湖区经济开发区兴平四路1688号艾莱依电话：02160761135"),
(null,"大米","古法种植 美味醇香","秋芸园 五常大米 精品稻花香米 东北米",
"8000","img/mall/dami.jpg","精品稻花香米","5kg装","秋芸园五常稻花香米，古法种植，自然生长，美味醇香；用心挑选每一粒米，东北黑土地种植，山泉水灌溉，日照时间长，降水量充足； 为家人选好米，好米才是家的味道。",12,"我们承诺自您收到商品后的七日内，以签收日期为准，发现商品破损或质量问题导致无法使用，我们将提供换货或退货服务；如果是买家原因退换货，由买家自行承担退换货费用，且必须保证商品及外包装完整无破损，不影响二次销售，否则不予退换。客服热线：4006262327","礼品X1","生产公司：五常市金粮源米业有限公司
生产地址：黑龙江省五常市营城子乡"),
(null,"坚果","每日均衡 精心定量","果园老农 每日坚果 坚果炒货 每日均衡混合坚果果干 ",
"5000","img/mall/jianguo.jpg","30gX10袋","每日均衡","规格：30g每袋",7,"保质期：请见包装说明","每日均衡混合坚果果干","生产公司环城中路63、65、67、69号梅山大厦三楼"),
(null,"牙膏","白药精华 养护口腔","纳爱斯 柠檬绿茶牙膏160g 天然柠檬绿茶 口腔清洁",
"4000","img/mall/yagao.jpg","柠檬绿茶牙膏160g","两只装","纳爱斯 柠檬绿茶牙膏160g，不一样的营养清新，天然柠檬绿茶，口腔清洁，清新口气，修护牙龈，洁白牙齿，添加维C营养成分。",8,"支持七天无理由退换货，质量问题，运费由商家承担，非质量问题，运费由客户自行承担。吊牌包装撕毁无法退换货！
如有任何疑问请致电客服，客服热线：400-888-7730","柠檬绿茶牙膏160g×1 或者 柠檬绿茶牙膏160g×2","中国"),
(null,"洗发水","精油润养 柔顺亮泽","欧莱雅LOREAL 洗发水 护发素400ml系列 套装系列",
"4000","img/mall/xifashui.jpg","精油润养","套装洗发水400ml 护发乳400ml","欧莱雅LOREAL 洗发水 护发素400ml系列 套装系列",8,"如有质量问题，从收到礼品当天起15个工作日内更换。","以顾客收到实物为准","生产商：苏州尚美国际化妆品有限公司 地址：苏州工业园区金鸡湖路紫藤街22号"),
(null,"手表","罗马刻度手工打造","EYKI 精致百搭 男表 女表 情侣手表",
"20000","img/mall/shoubiao.jpg","男款","金色","简约时尚，精致时间。",18,"1.一周内产品质量问题可依照客户要求，做退换货处理。 2.手表机芯一年内免费维修。 3.手表外观、电池的正常磨损消耗，不正确的使用方法或擅自修理导致的问题，不属于产品的质量问题，但仍可享受有偿售后维修服务。若无法修复，敬请谅解。客服热线：4001166064","手表，包装盒，说明书，保修卡","生产公司：广州市永鸿表业技术发展有限公司 生产地址：广州市白云区江夏北二路"),
(null,"手镯","合金整体 水晶镶嵌","新光饰品 施华洛世奇水晶元素手镯 ",
"10000","img/mall/shouzhuo.jpg","手镯","海蓝","年度明星款，热销15万件。",17,"1.一周内产品质量问题可依照客户要求，做退换货处理。 2.一月内免费维修。 3.部分产品因工艺特殊无法维修，包括：珐琅工艺、镂空工艺、特殊材质镶嵌类产品等，尽请谅解； 4.因正常消耗，不正确的使用方法或擅自修理导致的问题，不属于产品的质量问题，但仍可享受售后维修服务。若无法修复，敬请谅解。客服热线：4001579066","产品、包装盒、售后质保卡","生产公司：浙江新光饰品股份有限公司 生产地址：浙江省义乌市新光南路3号"),
(null,"背包","轻盈背负 炫彩防水","Samsonite 新秀丽双肩包 高端电脑包防水大容量商务背包 SN-113E ",
"4000","img/mall/beibao.jpg","双肩包","黑色","1.超轻自重、大容量内装2.多功能口袋设计满足全方面使用需求3.前片便携式拉链口袋，方便临时存放小物品4.独立电脑保护隔层，方便存放电脑设备5.采用时下最为流行的韩版设计风格",14,"支持七天无理由退换货，质量问题，运费由商家承担，非质量问题，运费由客户自行承担。客服热线：4008206978","双肩背包","新秀丽国际贸易宁波有限公司 宁波市北仑区小港经五中路15号"),
(null,"行李箱","时尚造型 牢固耐压","大途 行李箱 卡通行李箱可爱拉杆箱旅行箱包万向轮 ",
"15000","img/mall/xinglixiang.jpg","18寸","kt白猫","箱包硬度：硬 适用对象：儿童 锁的类型：普通密码锁",14,"产品如有质量问题或使用咨询，请拨打售后服务热线：400-833-7611 15天无理由退换：质量问题产生的退换货，免运费；非质量问题产生的退换货，运费由买家承担，且须保证商品及外包装说明书等无破损无缺失，不影响二次销售，否则不予退换。","行李箱X1","经销商：上海垄垒商贸有限公司 地址：上海闵行区平阳路258号一层G1097"),
(null,"磁力棒","益智百科 磁性构造","芙蓉天使 磁力棒积木套装 磁性拼装男女孩儿童玩具 ",
"10000","img/mall/cilibang.jpg","升级版218件收纳箱装","磁力棒积木套装","	玩具类型：磁力棒积木 产品品类：塑料/胶制",16,"产品如有质量问题或使用咨询，请拨打售后服务热线：400-991-3686 0513-85698569 15天无理由退换：质量问题产生的退换货，免运费；非质量问题产生的退换货，运费由买家承担，且须保证商品及外包装说明书等无破损无缺失，不影响二次销售，否则不予退换。","磁力棒积木套装X1","公司：常州米乐玩具有限公司 地址：江苏省常州市钟楼区洪庄路10号"),
(null,"充电宝","超大容量 方便携带","罗马仕移动电源10000毫安轻薄聚合物充电宝通用型",
"5000","img/mall/chongdianbao.jpg","10000mah聚合物移动电源","白色","产品描述如下：外壳材质：塑料，附加功能：多U口输出，电池类型：锂聚合物电池",4,"如有质量问题，请及时联系我司客服；从收到礼品当天起15个工作日内更换； 从收到礼品当天起12个月内保修；产品因质量问题退回3个月内运费我司出， 12个月内3个月后运费客户自出；客服热线：010-001-0110 ","产品1个、包装盒1个、合格证1张","厂家：深圳市力可普尔电子有限公司、 生产地址：深圳市宝安区沙井街道锦程路石厦港联工业园2070号A栋");

--积分商城商品图片
CREATE TABLE sa_integral_mall_products_pic(
  ppid INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,             --所属商品编号
  np varchar(128),            --正常列表图片
  sm VARCHAR(128),            --小图片路径
  md VARCHAR(128),            --中图片路径
  lg VARCHAR(128),            --大图片路径
  slg varchar(128)            --详情长图路径
);
insert into sa_integral_mall_products_pic value
(null,19,'img/mall/product/np/chongdianbao.jpg','img/mall/product_detail/sm/chongdianbao_sm1.jpg','img/mall/product_detail/md/chongdianbao_md1.jpg','img/mall/product_detail/lg/chongdianboa_lg1.jpg','img/mall/product_detail/slg/chongdianbao_detail_lg.jpg'),
(null,19,'img/mall/product/np/chongdianbao.jpg','img/mall/product_detail/sm/chongdianbao_sm2.jpg','img/mall/product_detail/md/chongdianbao_md2.jpg','img/mall/product_detail/lg/chongdianboa_lg2.jpg','img/mall/product_detail/slg/chongdianbao_detail_lg.jpg'),
(null,19,'img/mall/product/np/chongdianbao.jpg','img/mall/product_detail/sm/chongdianbao_sm3.jpg','img/mall/product_detail/md/chongdianbao_md3.jpg','img/mall/product_detail/lg/chongdianboa_lg3.jpg','img/mall/product_detail/slg/chongdianbao_detail_lg.jpg'),
(null,19,'img/mall/product/np/chongdianbao.jpg','img/mall/product_detail/sm/chongdianbao_sm4.jpg','img/mall/product_detail/md/chongdianbao_md4.jpg','img/mall/product_detail/lg/chongdianboa_lg4.jpg','img/mall/product_detail/slg/chongdianbao_detail_lg.jpg'),
(null,19,'img/mall/product/np/chongdianbao.jpg','img/mall/product_detail/sm/chongdianbao_sm5.jpg','img/mall/product_detail/md/chongdianbao_md5.jpg','img/mall/product_detail/lg/chongdianboa_lg5.jpg','img/mall/product_detail/slg/chongdianbao_detail_lg.jpg'),
(null,1,'img/mall/product/np/chuifengji.jpg','img/mall/product_detail/sm/chuifengji_sm1.jpg','img/mall/product_detail/md/chuifengji_md1.jpg','img/mall/product_detail/lg/chuifengji_lg1.jpg','img/mall/product_detail/slg/chuifengji_detail_lg.jpg'),
(null,1,'img/mall/product/np/chuifengji.jpg','img/mall/product_detail/sm/chuifengji_sm2.jpg','img/mall/product_detail/md/chuifengji_md2.jpg','img/mall/product_detail/lg/chuifengji_lg2.jpg','img/mall/product_detail/slg/chuifengji_detail_lg.jpg'),
(null,1,'img/mall/product/np/chuifengji.jpg','img/mall/product_detail/sm/chuifengji_sm3.jpg','img/mall/product_detail/md/chuifengji_md3.jpg','img/mall/product_detail/lg/chuifengji_lg3.jpg','img/mall/product_detail/slg/chuifengji_detail_lg.jpg'),
(null,1,'img/mall/product/np/chuifengji.jpg','img/mall/product_detail/sm/chuifengji_sm4.jpg','img/mall/product_detail/md/chuifengji_md4.jpg','img/mall/product_detail/lg/chuifengji_lg4.jpg','img/mall/product_detail/slg/chuifengji_detail_lg.jpg'),
(null,2,'img/mall/product/np/wangyuanjing.jpg','img/mall/product_detail/sm/wangyuanjing_sm1.jpg','img/mall/product_detail/md/wangyuanjing_md1.jpg','img/mall/product_detail/lg/wangyuanjing_lg1.jpg','img/mall/product_detail/slg/wangyuanjing_detail_lg.jpg'),
(null,2,'img/mall/product/np/wangyuanjing.jpg','img/mall/product_detail/sm/wangyuanjing_sm2.jpg','img/mall/product_detail/md/wangyuanjing_md2.jpg','img/mall/product_detail/lg/wangyuanjing_lg2.jpg','img/mall/product_detail/slg/wangyuanjing_detail_lg.jpg'),
(null,2,'img/mall/product/np/wangyuanjing.jpg','img/mall/product_detail/sm/wangyuanjing_sm3.jpg','img/mall/product_detail/md/wangyuanjing_md3.jpg','img/mall/product_detail/lg/wangyuanjing_lg3.jpg','img/mall/product_detail/slg/wangyuanjing_detail_lg.jpg'),
(null,2,'img/mall/product/np/wangyuanjing.jpg','img/mall/product_detail/sm/wangyuanjing_sm4.jpg','img/mall/product_detail/md/wangyuanjing_md4.jpg','img/mall/product_detail/lg/wangyuanjing_lg4.jpg','img/mall/product_detail/slg/wangyuanjing_detail_lg.jpg'),
(null,2,'img/mall/product/np/wangyuanjing.jpg','img/mall/product_detail/sm/wangyuanjing_sm5.jpg','img/mall/product_detail/md/wangyuanjing_md5.jpg','img/mall/product_detail/lg/wangyuanjing_lg5.jpg','img/mall/product_detail/slg/wangyuanjing_detail_lg.jpg'),
(null,2,'img/mall/product/np/wangyuanjing.jpg','img/mall/product_detail/sm/wangyuanjing_sm6.jpg','img/mall/product_detail/md/wangyuanjing_md6.jpg','img/mall/product_detail/lg/wangyuanjing_lg6.jpg','img/mall/product_detail/slg/wangyuanjing_detail_lg.jpg'),
(null,3,'img/mall/product/np/yashua.jpg','img/mall/product_detail/sm/yashua_sm1.jpg','img/mall/product_detail/md/yashua_md1.jpg','img/mall/product_detail/lg/yashua_lg1.jpg','img/mall/product_detail/slg/yashua_detail_lg.jpg'),
(null,3,'img/mall/product/np/yashua.jpg','img/mall/product_detail/sm/yashua_sm2.jpg','img/mall/product_detail/md/yashua_md2.jpg','img/mall/product_detail/lg/yashua_lg2.jpg','img/mall/product_detail/slg/yashua_detail_lg.jpg'),
(null,3,'img/mall/product/np/yashua.jpg','img/mall/product_detail/sm/yashua_sm3.jpg','img/mall/product_detail/md/yashua_md3.jpg','img/mall/product_detail/lg/yashua_lg3.jpg','img/mall/product_detail/slg/yashua_detail_lg.jpg'),
(null,4,'img/mall/product/np/tingchepai.jpg','img/mall/product_detail/sm/tingchepai_sm1.jpg','img/mall/product_detail/md/tingchepai_md1.jpg','img/mall/product_detail/lg/tingchepai_lg1.jpg','img/mall/product_detail/slg/tingchepai_detail_lg.jpg'),
(null,4,'img/mall/product/np/tingchepai.jpg','img/mall/product_detail/sm/tingchepai_sm2.jpg','img/mall/product_detail/md/tingchepai_md2.jpg','img/mall/product_detail/lg/tingchepai_lg2.jpg','img/mall/product_detail/slg/tingchepai_detail_lg.jpg'),
(null,4,'img/mall/product/np/tingchepai.jpg','img/mall/product_detail/sm/tingchepai_sm3.jpg','img/mall/product_detail/md/tingchepai_md3.jpg','img/mall/product_detail/lg/tingchepai_lg3.jpg','img/mall/product_detail/slg/tingchepai_detail_lg.jpg'),
(null,5,'img/mall/product/np/xiaoyingxiang.jpg','img/mall/product_detail/sm/xiaoyingxiang_sm1.jpg','img/mall/product_detail/md/xiaoyingxiang_md1.jpg','img/mall/product_detail/lg/xiaoyingxiang_lg1.jpg','img/mall/product_detail/slg/xiaoyingxiang_detail_lg.jpg'),
(null,5,'img/mall/product/np/xiaoyingxiang.jpg','img/mall/product_detail/sm/xiaoyingxiang_sm2.jpg','img/mall/product_detail/md/xiaoyingxiang_md2.jpg','img/mall/product_detail/lg/xiaoyingxiang_lg2.jpg','img/mall/product_detail/slg/xiaoyingxiang_detail_lg.jpg'),
(null,5,'img/mall/product/np/xiaoyingxiang.jpg','img/mall/product_detail/sm/xiaoyingxiang_sm3.jpg','img/mall/product_detail/md/xiaoyingxiang_md3.jpg','img/mall/product_detail/lg/xiaoyingxiang_lg3.jpg','img/mall/product_detail/slg/xiaoyingxiang_detail_lg.jpg'),
(null,6,'img/mall/product/np/shujuxian.jpg','img/mall/product_detail/sm/shujuxian_sm1.jpg','img/mall/product_detail/md/shujuxian_md1.jpg','img/mall/product_detail/lg/shujuxian_lg1.jpg','img/mall/product_detail/slg/shujuxian_detail_lg.jpg'),
(null,6,'img/mall/product/np/shujuxian.jpg','img/mall/product_detail/sm/shujuxian_sm2.jpg','img/mall/product_detail/md/shujuxian_md2.jpg','img/mall/product_detail/lg/shujuxian_lg2.jpg','img/mall/product_detail/slg/shujuxian_detail_lg.jpg'),
(null,6,'img/mall/product/np/shujuxian.jpg','img/mall/product_detail/sm/shujuxian_sm3.jpg','img/mall/product_detail/md/shujuxian_md3.jpg','img/mall/product_detail/lg/shujuxian_lg3.jpg','img/mall/product_detail/slg/shujuxian_detail_lg.jpg'),
(null,6,'img/mall/product/np/shujuxian.jpg','img/mall/product_detail/sm/shujuxian_sm4.jpg','img/mall/product_detail/md/shujuxian_md4.jpg','img/mall/product_detail/lg/shujuxian_lg4.jpg','img/mall/product_detail/slg/shujuxian_detail_lg.jpg'),
(null,6,'img/mall/product/np/shujuxian.jpg','img/mall/product_detail/sm/shujuxian_sm5.jpg','img/mall/product_detail/md/shujuxian_md5.jpg','img/mall/product_detail/lg/shujuxian_lg5.jpg','img/mall/product_detail/slg/shujuxian_detail_lg.jpg'),
(null,6,'img/mall/product/np/shujuxian.jpg','img/mall/product_detail/sm/shujuxian_sm6.jpg','img/mall/product_detail/md/shujuxian_md6.jpg','img/mall/product_detail/lg/shujuxian_lg6.jpg','img/mall/product_detail/slg/shujuxian_detail_lg.jpg'),
(null,7,'img/mall/product/np/zhengguo.jpg','img/mall/product_detail/sm/zhengguo_sm1.jpg','img/mall/product_detail/md/zhengguo_md1.jpg','img/mall/product_detail/lg/zhengguo_lg1.jpg','img/mall/product_detail/slg/zhengguo_detail_lg.jpg'),
(null,7,'img/mall/product/np/zhengguo.jpg','img/mall/product_detail/sm/zhengguo_sm2.jpg','img/mall/product_detail/md/zhengguo_md2.jpg','img/mall/product_detail/lg/zhengguo_lg2.jpg','img/mall/product_detail/slg/zhengguo_detail_lg.jpg'),
(null,8,'img/mall/product/np/yurongbei.jpg','img/mall/product_detail/sm/yurongbei_sm1.jpg','img/mall/product_detail/md/yurongbei_md1.jpg','img/mall/product_detail/lg/yurongbei_lg1.jpg','img/mall/product_detail/slg/yurongbei_detail_lg.jpg'),
(null,8,'img/mall/product/np/yurongbei.jpg','img/mall/product_detail/sm/yurongbei_sm2.jpg','img/mall/product_detail/md/yurongbei_md2.jpg','img/mall/product_detail/lg/yurongbei_lg2.jpg','img/mall/product_detail/slg/yurongbei_detail_lg.jpg'),
(null,9,'img/mall/product/np/dami.jpg','img/mall/product_detail/sm/dami_sm1.jpg','img/mall/product_detail/md/dami_md1.jpg','img/mall/product_detail/lg/dami_lg1.jpg','img/mall/product_detail/slg/dami_detail_lg.jpg'),
(null,9,'img/mall/product/np/dami.jpg','img/mall/product_detail/sm/dami_sm2.jpg','img/mall/product_detail/md/dami_md2.jpg','img/mall/product_detail/lg/dami_lg2.jpg','img/mall/product_detail/slg/dami_detail_lg.jpg'),
(null,9,'img/mall/product/np/dami.jpg','img/mall/product_detail/sm/dami_sm3.jpg','img/mall/product_detail/md/dami_md3.jpg','img/mall/product_detail/lg/dami_lg3.jpg','img/mall/product_detail/slg/dami_detail_lg.jpg'),
(null,9,'img/mall/product/np/dami.jpg','img/mall/product_detail/sm/dami_sm4.jpg','img/mall/product_detail/md/dami_md4.jpg','img/mall/product_detail/lg/dami_lg4.jpg','img/mall/product_detail/slg/dami_detail_lg.jpg'),
(null,10,'img/mall/product/np/jianguo.jpg','img/mall/product_detail/sm/jianguo_sm1.jpg','img/mall/product_detail/md/jianguo_md1.jpg','img/mall/product_detail/lg/jianguo_lg1.jpg','img/mall/product_detail/slg/jianguo_detail_lg.jpg'),
(null,10,'img/mall/product/np/jianguo.jpg','img/mall/product_detail/sm/jianguo_sm2.jpg','img/mall/product_detail/md/jianguo_md2.jpg','img/mall/product_detail/lg/jianguo_lg3.jpg','img/mall/product_detail/slg/jianguo_detail_lg.jpg'),
(null,10,'img/mall/product/np/jianguo.jpg','img/mall/product_detail/sm/jianguo_sm3.jpg','img/mall/product_detail/md/jianguo_md3.jpg','img/mall/product_detail/lg/jianguo_lg3.jpg','img/mall/product_detail/slg/jianguo_detail_lg.jpg'),
(null,11,'img/mall/product/np/yagao.jpg','img/mall/product_detail/sm/yagao_sm1.jpg','img/mall/product_detail/md/yagao_md1.jpg','img/mall/product_detail/lg/yagao_lg1.jpg','img/mall/product_detail/slg/yagao_detail_lg.jpg'),
(null,11,'img/mall/product/np/yagao.jpg','img/mall/product_detail/sm/yagao_sm2.jpg','img/mall/product_detail/md/yagao_md2.jpg','img/mall/product_detail/lg/yagao_lg2.jpg','img/mall/product_detail/slg/yagao_detail_lg.jpg'),
(null,11,'img/mall/product/np/yagao.jpg','img/mall/product_detail/sm/yagao_sm3.jpg','img/mall/product_detail/md/yagao_md3.jpg','img/mall/product_detail/lg/yagao_lg3.jpg','img/mall/product_detail/slg/yagao_detail_lg.jpg'),
(null,12,'img/mall/product/np/xifashui.jpg','img/mall/product_detail/sm/xifashui_sm1.jpg','img/mall/product_detail/md/xifashui_md1.jpg','img/mall/product_detail/lg/xifashui_lg1.jpg','img/mall/product_detail/slg/xifashui_detail_lg.jpg'),
(null,12,'img/mall/product/np/xifashui.jpg','img/mall/product_detail/sm/xifashui_sm2.jpg','img/mall/product_detail/md/xifashui_md2.jpg','img/mall/product_detail/lg/xifashui_lg2.jpg','img/mall/product_detail/slg/xifashui_detail_lg.jpg'),
(null,12,'img/mall/product/np/xifashui.jpg','img/mall/product_detail/sm/xifashui_sm3.jpg','img/mall/product_detail/md/xifashui_md3.jpg','img/mall/product_detail/lg/xifashui_lg3.jpg','img/mall/product_detail/slg/xifashui_detail_lg.jpg'),
(null,13,'img/mall/product/np/shoubiao.jpg','img/mall/product_detail/sm/shoubiao_sm1.jpg','img/mall/product_detail/md/shoubiao_md1.jpg','img/mall/product_detail/lg/shoubiao_lg1.jpg','img/mall/product_detail/slg/shoubiao_detail_lg.jpg'),
(null,13,'img/mall/product/np/shoubiao.jpg','img/mall/product_detail/sm/shoubiao_sm2.jpg','img/mall/product_detail/md/shoubiao_md2.jpg','img/mall/product_detail/lg/shoubiao_lg2.jpg','img/mall/product_detail/slg/shoubiao_detail_lg.jpg'),
(null,13,'img/mall/product/np/shoubiao.jpg','img/mall/product_detail/sm/shoubiao_sm3.jpg','img/mall/product_detail/md/shoubiao_md3.jpg','img/mall/product_detail/lg/shoubiao_lg3.jpg','img/mall/product_detail/slg/shoubiao_detail_lg.jpg'),
(null,14,'img/mall/product/np/shouzhuo.jpg','img/mall/product_detail/sm/shouzhuo_sm1.jpg','img/mall/product_detail/md/shouzhuo_md1.jpg','img/mall/product_detail/lg/shouzhuo_lg1.jpg','img/mall/product_detail/slg/shouzhuo_detail_lg.jpg'),
(null,14,'img/mall/product/np/shouzhuo.jpg','img/mall/product_detail/sm/shouzhuo_sm2.jpg','img/mall/product_detail/md/shouzhuo_md2.jpg','img/mall/product_detail/lg/shouzhuo_lg2.jpg','img/mall/product_detail/slg/shouzhuo_detail_lg.jpg'),
(null,14,'img/mall/product/np/shouzhuo.jpg','img/mall/product_detail/sm/shouzhuo_sm3.jpg','img/mall/product_detail/md/shouzhuo_md3.jpg','img/mall/product_detail/lg/shouzhuo_lg3.jpg','img/mall/product_detail/slg/shouzhuo_detail_lg.jpg'),
(null,15,'img/mall/product/np/beibao.jpg','img/mall/product_detail/sm/beibao_sm1.jpg','img/mall/product_detail/md/beibao_md1.jpg','img/mall/product_detail/lg/beibao_lg1.jpg','img/mall/product_detail/slg/beibao_detail_lg.jpg'),
(null,15,'img/mall/product/np/beibao.jpg','img/mall/product_detail/sm/beibao_sm2.jpg','img/mall/product_detail/md/beibao_md2.jpg','img/mall/product_detail/lg/beibao_lg2.jpg','img/mall/product_detail/slg/beibao_detail_lg.jpg'),
(null,15,'img/mall/product/np/beibao.jpg','img/mall/product_detail/sm/beibao_sm3.jpg','img/mall/product_detail/md/beibao_md3.jpg','img/mall/product_detail/lg/beibao_lg3.jpg','img/mall/product_detail/slg/beibao_detail_lg.jpg'),
(null,16,'img/mall/product/np/xinglixiang.jpg','img/mall/product_detail/sm/xinglixiang_sm1.jpg','img/mall/product_detail/md/xinglixiang_md1.jpg','img/mall/product_detail/lg/xinglixiang_lg1.jpg','img/mall/product_detail/slg/xinglixiang_detail_lg.jpg'),
(null,16,'img/mall/product/np/xinglixiang.jpg','img/mall/product_detail/sm/xinglixiang_sm2.jpg','img/mall/product_detail/md/xinglixiang_md2.jpg','img/mall/product_detail/lg/xinglixiang_lg2.jpg','img/mall/product_detail/slg/xinglixiang_detail_lg.jpg'),
(null,17,'img/mall/product/np/cilibang.jpg','img/mall/product_detail/sm/cilibang_sm1.jpg','img/mall/product_detail/md/cilibang_md1.jpg','img/mall/product_detail/lg/cilibang_lg1.jpg','img/mall/product_detail/slg/cilibang_detail_lg.jpg'),
(null,17,'img/mall/product/np/cilibang.jpg','img/mall/product_detail/sm/cilibang_sm2.jpg','img/mall/product_detail/md/cilibang_md2.jpg','img/mall/product_detail/lg/cilibang_lg2.jpg','img/mall/product_detail/slg/cilibang_detail_lg.jpg'),
(null,18,'img/mall/product/np/wanjufeiji.jpg','img/mall/product_detail/sm/wanjufeiji_sm1.jpg','img/mall/product_detail/md/wanjufeiji_md1.jpg','img/mall/product_detail/lg/wanjufeiji_lg1.jpg','img/mall/product_detail/slg/wanjufeiji_detail_lg.jpg'),
(null,18,'img/mall/product/np/wanjufeiji.jpg','img/mall/product_detail/sm/wanjufeiji_sm2.jpg','img/mall/product_detail/md/wanjufeiji_md2.jpg','img/mall/product_detail/lg/wanjufeiji_lg2.jpg','img/mall/product_detail/slg/wanjufeiji_detail_lg.jpg'),
(null,18,'img/mall/product/np/wanjufeiji.jpg','img/mall/product_detail/sm/wanjufeiji_sm3.jpg','img/mall/product_detail/md/wanjufeiji_md3.jpg','img/mall/product_detail/lg/wanjufeiji_lg3.jpg','img/mall/product_detail/slg/wanjufeiji_detail_lg.jpg');




--积分商城商品分类家族
CREATE TABLE sa_integral_mall_products_family(
	fid INT PRIMARY KEY AUTO_INCREMENT,
	fname VARCHAR(32)
);
insert into sa_integral_mall_products_family value(null,"各护电器"),
(null,"厨房电器"),
(null,"户外运动"),
(null,"数码电子"),
(null,"电脑办公"),
(null,"汽车用品"),
(null,"休闲零食"),
(null,"个护化妆"),
(null,"健康保障"),
(null,"家居用品"),
(null,"放置用品"),
(null,"粮油干货"),
(null,"服装配饰"),
(null,"鞋靴箱包"),
(null,"孕婴用品"),
(null,"儿童玩具"),
(null,"流行饰品"),
(null,"手表皮带");

--人才库各类人才分类情况
create table sa_person_pool(
	sppid int primary key AUTO_INCREMENT,
	sppimg varchar(128),
	sppname varchar(32),
	spphref varchar(128)
);
insert into sa_person_pool value(null,"img/index/xuebanan.png","学霸男","talents_class.html?stid=1"),
(null,"img/index/xuebanv.png","学霸女","talents_class.html?stid=2"),
(null,"img/index/wenyinan.png","文艺男","talents_class.html?stid=3"),
(null,"img/index/wenyinv.png","文艺女","talents_class.html?stid=4"),
(null,"img/index/tiyunan.png","体育男","talents_class.html?stid=5"),
(null,"img/index/langmannv.png","浪漫女","talents_class.html?stid=6"),
(null,"img/index/nuanxinnan.png","暖心男","talents_class.html?stid=7"),
(null,"img/index/qita.png","其他型","talents_class.html?stid=8");

--任务库各类任务分类情况
create table sa_case_class(
	ccid int primary key AUTO_INCREMENT,
	ccname varchar(32)
);
insert into sa_case_class values(null,"学习任务"),
(null,"音乐任务"),
(null,"舞蹈人物"),
(null,"武术任务"),
(null,"电子任务"),
(null,"艺术任务"),
(null,"体育任务"),
(null,"生活百科");

#任务库
create table sa_case_pool(
	cpid int primary key auto_increment,
	c_cid int,    #任务类型
	cpname varchar(64),
	cp_tid int,     #用户id
	cpplayer varchar(12),
	cpimg varchar(128),
	cptime varchar(64),
	cpisfinish boolean
);
insert into sa_case_pool values
(null,1,"数学奥赛",1,"考生","img/case/zuoping1.jpg","2012-08-06",1),
(null,2,"歌唱比赛",1,"歌手","img/case/zuoping2.jpg","2012-08-06",1),
(null,3,"舞蹈大赛",1,"演员","img/case/zuoping3.jpg","2012-08-06",0),
(null,4,"武术大赛",2,"选手","img/case/zuoping4.jpg","2012-08-06",1),
(null,5,"电子竞技",2,"选手","img/case/zuoping5.jpg","2012-08-06",1),
(null,6,"画展",2,"选手","img/case/zuoping1.jpg","2012-08-06",0),
(null,7,"田径比赛",3,"选手","img/case/zuoping2.jpg","2012-08-06",1),
(null,8,"模特大赛",3,"选手","img/case/zuoping3.jpg","2012-08-06",1),
(null,1,"数学奥赛",3,"考生","img/case/zuoping4.jpg","2012-08-06",0),
(null,2,"歌唱比赛",4,"歌手","img/case/zuoping5.jpg","2012-08-06",1),
(null,3,"舞蹈大赛",4,"演员","img/case/zuoping1.jpg","2012-08-06",1),
(null,4,"武术大赛",4,"选手","img/case/zuoping2.jpg","2012-08-06",0),
(null,5,"电子竞技",5,"选手","img/case/zuoping3.jpg","2012-08-06",1),
(null,6,"画展",5,"选手","img/case/zuoping4.jpg","2012-08-06",1),
(null,7,"田径比赛",5,"选手","img/case/zuoping5.jpg","2012-08-06",0);

--用户信息
create table sa_user(
	uid int primary key auto_increment,
	uname VARCHAR(32),
	upwd VARCHAR(32),
	email VARCHAR(64),
	phone VARCHAR(16),
	school VARCHAR(128),
	avatar VARCHAR(128),        #头像图片路径
	user_name VARCHAR(32),      #真实姓名，如王小明
	#外号
	#小名
	#类型
	gender INT                  #性别  0-女  1-男
);




#购物车
CREATE TABLE sa_shopping_cart(
  scid INT PRIMARY KEY AUTO_INCREMENT,
  cuid INT,         #用户编号
  cpid INT,         #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);
insert into sa_shopping_cart values(null,1,1,1,true),
(null,1,2,2,false),
(null,2,3,1,true),
(null,2,4,1,true),
(null,2,1,2,true),
(null,3,2,1,true),
(null,3,3,1,true),
(null,3,4,1,false),
(null,3,5,1,true),
(null,3,6,1,true);

#人才类型
create table sa_talent_class(
	tcid int primary key auto_increment,
	tcname varchar(32)
);
insert into sa_talent_class vlaues
(null,"学习人才"),
(null,"特长爱好"),
(null,"生活百科");


#人才库
create table sa_talent_pool(
	tpid int primary key auto_increment,
	tname varchar(32),
	tschool varchar(32),
	timg varchar(128),
	tremark varchar(256),
	tclass int,
	toname varchar(32),
	tsex varchar(8),
	tbirthday varchar(32),
	tdetails varchar(500)
);
insert into sa_talent_pool values
(null,"王一一","北京大学","img/person/man.jpg","参加过奥赛，拿到过大奖",1,"学神","男","1996-12-12","在2010年的英国GCSE考试中，成为获得数学最高分的考生"),
(null,"李一一","清华大学","img/person/womanman.jpg","拿到过矛盾文学奖",1,"学神","女","1997-11-11","在2010年的雅思考试中，成为最高分的考生"),
(null,"王一二","北京大学","img/person/man.jpg","参加过奥赛，拿到过大奖",1,"学神","男","1996-12-12","在2010年的英国GCSE考试中，成为获得数学最高分的考生"),
(null,"李一二","清华大学","img/person/womanman.jpg","拿到过矛盾文学奖",1,"学神","女","1997-11-11","在2010年的雅思考试中，成为最高分的考生"),
(null,"王一三","北京大学","img/person/man.jpg","参加过奥赛，拿到过大奖",1,"学神","男","1996-12-12","在2010年的英国GCSE考试中，成为获得数学最高分的考生"),
(null,"李一三","清华大学","img/person/womanman.jpg","拿到过矛盾文学奖",1,"学神","女","1997-11-11","在2010年的雅思考试中，成为最高分的考生"),
(null,"王一四","北京大学","img/person/man.jpg","参加过奥赛，拿到过大奖",1,"学神","男","1996-12-12","在2010年的英国GCSE考试中，成为获得数学最高分的考生"),
(null,"李一四","清华大学","img/person/womanman.jpg","拿到过矛盾文学奖",1,"学神","女","1997-11-11","在2010年的雅思考试中，成为最高分的考生"),
(null,"王一五","北京大学","img/person/man.jpg","参加过奥赛，拿到过大奖",2,"学神","男","1996-12-12","在2010年的英国GCSE考试中，成为获得数学最高分的考生"),
(null,"李一五","清华大学","img/person/womanman.jpg","拿到过矛盾文学奖",2,"学神","女","1997-11-11","在2010年的雅思考试中，成为最高分的考生"),
(null,"王一六","北京大学","img/person/man.jpg","参加过奥赛，拿到过大奖",2,"学神","男","1996-12-12","在2010年的英国GCSE考试中，成为获得数学最高分的考生"),
(null,"李一六","清华大学","img/person/womanman.jpg","拿到过矛盾文学奖",2,"学神","女","1997-11-11","在2010年的雅思考试中，成为最高分的考生"),
(null,"王一七","北京大学","img/person/man.jpg","参加过奥赛，拿到过大奖",2,"学神","男","1996-12-12","在2010年的英国GCSE考试中，成为获得数学最高分的考生"),
(null,"李一七","清华大学","img/person/womanman.jpg","拿到过矛盾文学奖",2,"学神","女","1997-11-11","在2010年的雅思考试中，成为最高分的考生"),
(null,"王一八","北京大学","img/person/man.jpg","参加过奥赛，拿到过大奖",2,"学神","男","1996-12-12","在2010年的英国GCSE考试中，成为获得数学最高分的考生"),
(null,"李一八","清华大学","img/person/womanman.jpg","拿到过矛盾文学奖",2,"学神","女","1997-11-11","在2010年的雅思考试中，成为最高分的考生"),
(null,"王一九","北京大学","img/person/man.jpg","参加过奥赛，拿到过大奖",3,"学神","男","1996-12-12","在2010年的英国GCSE考试中，成为获得数学最高分的考生"),
(null,"李一九","清华大学","img/person/womanman.jpg","拿到过矛盾文学奖",3,"学神","女","1997-11-11","在2010年的雅思考试中，成为最高分的考生"),
(null,"王二一","北京大学","img/person/man.jpg","参加过奥赛，拿到过大奖",3,"学神","男","1996-12-12","在2010年的英国GCSE考试中，成为获得数学最高分的考生"),
(null,"李二一","清华大学","img/person/womanman.jpg","拿到过矛盾文学奖",3,"学神","女","1997-11-11","在2010年的雅思考试中，成为最高分的考生"),
(null,"王二二","北京大学","img/person/man.jpg","参加过奥赛，拿到过大奖",3,"学神","男","1996-12-12","在2010年的英国GCSE考试中，成为获得数学最高分的考生"),
(null,"李二二","清华大学","img/person/womanman.jpg","拿到过矛盾文学奖",3,"学神","女","1997-11-11","在2010年的雅思考试中，成为最高分的考生"),
(null,"王三一","北京大学","img/person/man.jpg","参加过奥赛，拿到过大奖",3,"学神","男","1996-12-12","在2010年的英国GCSE考试中，成为获得数学最高分的考生"),
(null,"李三一","清华大学","img/person/womanman.jpg","拿到过矛盾文学奖",3,"学神","女","1997-11-11","在2010年的雅思考试中，成为最高分的考生");

#任务信息库
create table sa_case_details_pool(
	cdpid int primary key auto_increment,
	cdpname varchar(32),
	cdpaddress varchar(128),
	cdpschool varchar(32),
	cdpschoolweb varchar(32),
	cdpemail varchar(64),
	cdpimg varchar(128),
	cdpclass int,
	cdpperson varchar(32),
	cdpdetails varchar(500)
);
insert into sa_case_details_pool values
(null,"参加校园歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",2,"张天爱","你不要害怕你不会寂寞我会一直陪在你的左右让你乐悠悠日子一天一天过我们会慢慢长大"),
(null,"参加校园歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case2.jpg",2,"张天爱","你不要害怕你不会寂寞我会一直陪在你的左右让你乐悠悠日子一天一天过我们会慢慢长大"),
(null,"参加校园歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",1,"张天爱","你不要害怕你不会寂寞我会一直陪在你的左右让你乐悠悠日子一天一天过我们会慢慢长大"),
(null,"参加校园歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case2.jpg",1,"张天爱","你不要害怕你不会寂寞我会一直陪在你的左右让你乐悠悠日子一天一天过我们会慢慢长大"),
(null,"参加校园歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",3,"张天爱","你不要害怕你不会寂寞我会一直陪在你的左右让你乐悠悠日子一天一天过我们会慢慢长大"),
(null,"参加校园歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case2.jpg",3,"张天爱","你不要害怕你不会寂寞我会一直陪在你的左右让你乐悠悠日子一天一天过我们会慢慢长大"),
(null,"参加校园歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",4,"张天爱","你不要害怕你不会寂寞我会一直陪在你的左右让你乐悠悠日子一天一天过我们会慢慢长大"),
(null,"参加校园歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case2.jpg",4,"张天爱","你不要害怕你不会寂寞我会一直陪在你的左右让你乐悠悠日子一天一天过我们会慢慢长大"),
(null,"参加校园歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",5,"张天爱","你不要害怕你不会寂寞我会一直陪在你的左右让你乐悠悠日子一天一天过我们会慢慢长大"),
(null,"参加校园歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case2.jpg",5,"张天爱","你不要害怕你不会寂寞我会一直陪在你的左右让你乐悠悠日子一天一天过我们会慢慢长大"),
(null,"参加校园歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",6,"张天爱","你不要害怕你不会寂寞我会一直陪在你的左右让你乐悠悠日子一天一天过我们会慢慢长大"),
(null,"参加校园歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case2.jpg",6,"张天爱","你不要害怕你不会寂寞我会一直陪在你的左右让你乐悠悠日子一天一天过我们会慢慢长大"),
(null,"参加校园歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",7,"张天爱","你不要害怕你不会寂寞我会一直陪在你的左右让你乐悠悠日子一天一天过我们会慢慢长大"),
(null,"参加校园歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case2.jpg",7,"张天爱","你不要害怕你不会寂寞我会一直陪在你的左右让你乐悠悠日子一天一天过我们会慢慢长大"),
(null,"参加校园歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",8,"张天爱","你不要害怕你不会寂寞我会一直陪在你的左右让你乐悠悠日子一天一天过我们会慢慢长大"),
(null,"参加校园歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case2.jpg",8,"张天爱","你不要害怕你不会寂寞我会一直陪在你的左右让你乐悠悠日子一天一天过我们会慢慢长大");


#个人信息中心
create table sa_homepage_center(
	shcid int primary key auto_increment,
	shcname varchar(32),
	schaddress varchar(128),
	shcschool varchar(32),
	shcemail varchar(64),
	shcimg varchar(128),
	shcintegral int                                                         
); 
insert into sa_homepage_center values
(null,"张大宝","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/header/user_photo.jpg",10000),
(null,"李小妞","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/header/user_photo.jpg",10000),
(null,"王小丫","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/header/user_photo.jpg",10000),
(null,"赵大牛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/header/user_photo.jpg",10000),
(null,"孙小妖","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/header/user_photo.jpg",10000),
(null,"周大柱","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/header/user_photo.jpg",10000),
(null,"刘大庆","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/header/user_photo.jpg",10000),
(null,"吴小花","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/header/user_photo.jpg",10000);

#个人兑换的商品
CREATE table sa_exchange_product(
	sepid int primary key auto_increment,
	sepname varchar(32),
	sepaddress varchar(128),
	sepimg varchar(128),
	sepperson varchar(32),
	septime varchar(32),
	sepdetails varchar(500)
);
insert into sa_exchange_product values
(null,"魔方","江苏省苏州市吴中区车坊淞泽家园2区","img/header/task_photo.jpg","张大宝","2018-12-12","这是非常不错的商品，质量好，好评度高"),
(null,"魔方","江苏省苏州市吴中区车坊淞泽家园2区","img/header/task_photo.jpg","李小妞","2018-12-12","这是非常不错的商品，质量好，好评度高"),
(null,"魔方","江苏省苏州市吴中区车坊淞泽家园2区","img/header/task_photo.jpg","王小丫","2018-12-12","这是非常不错的商品，质量好，好评度高"),
(null,"魔方","江苏省苏州市吴中区车坊淞泽家园2区","img/header/task_photo.jpg","赵大牛","2018-12-12","这是非常不错的商品，质量好，好评度高"),
(null,"魔方","江苏省苏州市吴中区车坊淞泽家园2区","img/header/task_photo.jpg","孙小妖","2018-12-12","这是非常不错的商品，质量好，好评度高"),
(null,"魔方","江苏省苏州市吴中区车坊淞泽家园2区","img/header/task_photo.jpg","周大柱","2018-12-12","这是非常不错的商品，质量好，好评度高"),
(null,"魔方","江苏省苏州市吴中区车坊淞泽家园2区","img/header/task_photo.jpg","刘大庆","2018-12-12","这是非常不错的商品，质量好，好评度高"),
(null,"魔方","江苏省苏州市吴中区车坊淞泽家园2区","img/header/task_photo.jpg","吴小花","2018-12-12","这是非常不错的商品，质量好，好评度高");

#个人完成与未完成的任务
CREATE table sa_person_task(
	sptid int primary key auto_increment,
	sptname varchar(32),
	sptaddress varchar(128),
	sptschool varchar(32),
	sptemail varchar(64),
	sptimg varchar(128),
	sptclass int,
	sptperson varchar(32),
	spttime varchar(32),
	sptdetails varchar(500),
	sptfinish boolean
);
insert into sa_person_task values
(null,"奥林匹克数学大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/case/case1.jpg",1,"张大宝","2018-12-12","我是来自北京大学数学系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务",1),
(null,"欧洲歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/case/case2.jpg",2,"李小妞","2018-12-12","我是来自北京大学音乐系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务",1),
(null,"中国拉丁舞大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/case/case2.jpg",3,"王小丫","2018-12-12","我是来自北京大学舞蹈系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务",1),
(null,"中国武术大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/case/case1.jpg",4,"赵大牛","2018-12-12","我是来自北京大学武术系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务",1),
(null,"lpl大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/case/case1.jpg",5,"孙小妖","2018-12-12","我是来自北京大学电子系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务",1),
(null,"中国国画比赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/case/case1.jpg",6,"周大柱","2018-12-12","我是来自北京大学艺术系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务",1),
(null,"亚洲青年田径锦标赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/case/case1.jpg",7,"刘大庆","2018-12-12","我是来自北京大学体育系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务",1),
(null,"模特大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/case/case2.jpg",8,"吴小花","2018-12-12","我是来自北京大学舞蹈系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务",1),
(null,"奥林匹克数学大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/case/case1.jpg",1,"张大宝","2018-12-12","我是来自北京大学数学系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务",0),
(null,"欧洲歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/case/case2.jpg",2,"李小妞","2018-12-12","我是来自北京大学音乐系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务",0),
(null,"中国拉丁舞大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/case/case2.jpg",3,"王小丫","2018-12-12","我是来自北京大学舞蹈系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务",0),
(null,"中国武术大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/case/case1.jpg",4,"赵大牛","2018-12-12","我是来自北京大学武术系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务",0),
(null,"lpl大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/case/case1.jpg",5,"孙小妖","2018-12-12","我是来自北京大学电子系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务",0),
(null,"中国国画比赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/case/case1.jpg",6,"周大柱","2018-12-12","我是来自北京大学艺术系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务",0),
(null,"亚洲青年田径锦标赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/case/case1.jpg",7,"刘大庆","2018-12-12","我是来自北京大学体育系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务",0),
(null,"模特大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","123456879@163.com","img/case/case2.jpg",8,"吴小花","2018-12-12","我是来自北京大学舞蹈系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务",0);

#申请任务表
create table sa_apply_task(
	satid int primary key auto_increment,
	satname varchar(32),
	sataddress varchar(128),
	satschool varchar(32),
	satschoolweb varchar(32),
	satemail varchar(64),
	satimg varchar(128),
	satclass int,
	satperson varchar(32),
	sattime varchar(32),
	satdetails varchar(500)
);
insert into sa_apply_task values
(null,"奥林匹克数学大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",1,"张大宝","2018-12-12","我是来自北京大学数学系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务"),
(null,"欧洲歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case2.jpg",2,"李小妞","2018-12-12","我是来自北京大学音乐系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务"),
(null,"中国拉丁舞大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case2.jpg",3,"王小丫","2018-12-12","我是来自北京大学舞蹈系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务"),
(null,"中国武术大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",4,"赵大牛","2018-12-12","我是来自北京大学武术系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务"),
(null,"lpl大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",5,"孙小妖","2018-12-12","我是来自北京大学电子系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务"),
(null,"中国国画比赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",6,"周大柱","2018-12-12","我是来自北京大学艺术系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务"),
(null,"亚洲青年田径锦标赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",7,"刘大庆","2018-12-12","我是来自北京大学体育系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务"),
(null,"模特大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case2.jpg",8,"吴小花","2018-12-12","我是来自北京大学舞蹈系大二学生，参加过两次数学比赛，得过奖项，希望能够参加你的任务");
#发布任务表
create table sa_publish_task(
	sptid int primary key auto_increment,
	sptname varchar(32),
	sptaddress varchar(128),
	sptschool varchar(32),
	sptschoolweb varchar(32),
	sptemail varchar(64),
	sptimg varchar(128),
	sptclass int,
	sptperson varchar(32),
	spttime varchar(32),
	sptdetails varchar(500)
);
insert into sa_publish_task values
(null,"奥林匹克数学大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",1,"张大宝","2018-12-12","本次比赛地点在欧洲德国汉堡市，与世界青年一同比赛，时间为期1个月，难度系数5颗星，完成任务可获得1000积分"),
(null,"欧洲歌唱大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case2.jpg",2,"李小妞","2018-12-12","本次比赛地点在欧洲德国汉堡市，与世界青年一同比赛，时间为期1个月，难度系数5颗星，完成任务可获得1000积分"),
(null,"中国拉丁舞大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case2.jpg",3,"王小丫","2018-12-12","本次比赛地点在欧上海市，与全国青年一同比赛，时间为期1个月，难度系数3颗星，完成任务可获得500积分"),
(null,"中国武术大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",4,"赵大牛","2018-12-12","本次比赛地点在河南省，与全国青年一同比赛，时间为期1个月，难度系数3颗星，完成任务可获得500积分"),
(null,"lpl大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",5,"孙小妖","2018-12-12","本次比赛地点在浙江省杭州市，与世界青年一同比赛，时间为期1个月，难度系数5颗星，完成任务可获得1000积分"),
(null,"中国国画比赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",6,"周大柱","2018-12-12","本次比赛地点在北京市，与全国青年一同比赛，时间为期1个月，难度系数3颗星，完成任务可获得500积分"),
(null,"亚洲青年田径锦标赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case1.jpg",7,"刘大庆","2018-12-12","本次比赛地点在广东省深圳市，与世界青年一同比赛，时间为期1个月，难度系数5颗星，完成任务可获得1000积分"),
(null,"模特大赛","江苏省苏州市吴中区车坊淞泽家园2区","北京大学","https://www.pku.edu.cn/","123456879@163.com","img/case/case2.jpg",8,"吴小花","2018-12-12","本次比赛地点在台湾省，与全国青年一同比赛，时间为期1个月，难度系数3颗星，完成任务可获得500积分");
#