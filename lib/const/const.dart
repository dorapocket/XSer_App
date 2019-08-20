import 'package:flutter/material.dart';

class C {
  static const Color XS_BLUE = Color.fromARGB(255, 45, 88, 149);
  static const Color LIGHT_BLUE = Color.fromARGB(255, 52, 152, 219);
}

class S {
  static const testdata = '''
<p class="MsoNormal" align="center" style="text-align:center"><b><span style="font-size:18.0pt;mso-bidi-font-size:22.0pt;font-family:&quot;微软雅黑&quot;,sans-serif">感知名校文化<span lang="EN-US"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;</span></span>领略科技之光<span lang="EN-US"><o:p></o:p></span></span></b></p>
<p class="MsoNormal" align="center" style="text-align:center"><b><span lang="EN-US" style="font-size:14.0pt;mso-bidi-font-size:22.0pt;font-family:楷体"><span style="mso-spacerun:yes">&nbsp;</span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 14pt;">&nbsp;&nbsp;&nbsp; </span></span></span></b><b><span style="font-size:14.0pt;mso-bidi-font-size:22.0pt;font-family:楷体"><span style="font-size: 14pt;">——</span><span lang="EN-US" style="font-size: 14pt;">2019</span><span style="font-size: 14pt;">效实学子七月上海研学活动五日纪实</span><span lang="EN-US"><o:p></o:p></span></span></b></p>
<p class="MsoNormal" align="center" style="text-align:center"><b style="font-size: 9pt;"><span style="font-size:12.0pt;mso-bidi-font-size:22.0pt;font-family:黑体"><span style="font-size: 14pt;"><br>
</span></span></b></p>
<p class="MsoNormal" align="center" style="text-align:center"><b style="font-size: 9pt;"><span style="font-size:12.0pt;mso-bidi-font-size:22.0pt;font-family:黑体"><span style="font-size: 14pt;">研学第一天</span></span></b></p>
<p></p>
<p class="MsoNormal" align="left"><span style="font-size: 14pt;">●初至复旦●</span><span lang="EN-US"><o:p></o:p></span></p>
<p><span style="font-size: 14pt;">&ensp;&ensp;&ensp;数小时的奔波后，研学一行人终于到达了目的地高校复旦大学。简单地活动筋骨后，我们径直步入大学城中鼎鼎有名的“旦苑餐厅”，在那里，丰盛的午餐早已经为我们备好。接下来的几天里，旦苑餐厅会陪伴我们度过</span><b><span style="font-size: 14pt;">。</span></b></p>
<p style="text-align: center;"><b><span style="font-size: 14pt;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803210950272_s.jpg" border="0" style="width: 399px; height: 301px;" align="center"><br>
</span></b></p>
<p class="MsoNormal" align="left"><span style="font-size: 14pt;">●研学课堂●</span><span lang="EN-US"><o:p></o:p></span></p>
<p></p>
<p class="MsoNormal" align="left" style="text-indent: 21pt;"><span style="font-size: 14pt;">&ensp;短暂的欢迎仪式后，研学的学习之路正式开始。首先，复旦大学生命科学学院人类学系李辉教授为我们带来里一堂别开生面的人类历史课。李教授主要研究分子人类学，从</span><span lang="EN-US" style="font-size: 14pt;">DNA</span><span style="font-size: 14pt;">探索人类起源与文明肇始，被</span><span lang="EN-US" style="font-size: 14pt;">Science</span><span style="font-size: 14pt;">以《复活传奇》为题专版报道。他从基础的基因角度为我们普及人类进化的研究成果，包括分子生物学以及人类历史学。李教授向我们介绍了进行遗传分析的基本规则：检验无功能基因。李教授带领着我们从父系社会的遗传核心</span><span lang="EN-US" style="font-size: 14pt;">Y</span><span style="font-size: 14pt;">染色体出发，一层层地剥析中华民族起源和发展历程，其中包括曹操之父</span><span lang="EN-US" style="font-size: 14pt;">DNA</span><span style="font-size: 14pt;">的鉴定以及中华民族三大祖先的发现。一场场震撼的视觉冲击将我们带进了考古发现的现场，领略着</span><span lang="EN-US" style="font-size: 14pt;">DNA</span><span style="font-size: 14pt;">序列中隐藏的人类历史密码，在</span><span lang="EN-US" style="font-size: 14pt;">Y</span><span style="font-size: 14pt;">染色体看似扑朔迷离的变化中，李辉教授所揭露的历史已经浮出水面。</span><span lang="EN-US"><o:p></o:p></span></p>
<p style="text-align: center;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803211611454_s.jpg" border="0" style="width: 431px; height: 380px;" align="center"><br>
</p>
<p class="MsoNormal" align="left"><span style="font-size: 14pt;">●寻访校史●</span><span lang="EN-US"><o:p></o:p></span></p>
<p style="text-align: left;"><span lang="EN-US" style="font-size: 10.5pt;"><span style="font-size: 14pt;">&nbsp;&nbsp;</span></span><span style="font-size: 14pt;">走出李教授的人类历史课堂，在烈日下跋涉了近十分钟后，我们到达了参观的第二站：复旦大学校史馆。扑面而来的便是历史感，复旦百年悠久的历史一展眼前。马相伯、于右任等诸任校长筚路蓝缕，造就了如今复旦大学的辉煌。复旦的光辉更离不开陈寅恪、竺可桢等学子的艰苦奋斗，</span><span style="font-size: 14pt;">复旦</span><span style="font-size: 14pt;">成就了他们，他们也成就了复旦。</span></p>
<p style="text-align: center;"><span style="font-size: 14pt;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803212527838_s.jpg" border="0" align="center" style="width: 456px; height: 271px;"><br>
</span></p>
<p class="MsoNormal" align="left"><span style="font-size: 14pt;">●实验室之旅●</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" align="left" style="text-indent: 21pt;"><span style="font-size: 14pt;">作为一所综合性较强的大学，复旦大学的实验室自然处于国内前列。我们有幸参观了复旦大学的</span><span lang="EN-US" style="font-size: 14pt;">VR</span><span style="font-size: 14pt;">虚拟现实实验室、信息化电学实验室等。我们在物理实验室负责人孔教授的带领下走入实验室，了解实验室的基本仪器以及实验操作安全。在</span><span lang="EN-US" style="font-size: 14pt;">VR</span><span style="font-size: 14pt;">虚拟现实技术的帮助下，我们“实地”体验了一把跳楼时肾上腺素激增的快感。在工作人员的领导下，我们切切实实地体会了世界一流名校的顶尖科技力量。如此先进的实验仪器，如此负责的教授，复旦大学如何能不令人神往？</span><span style="font-size: 14pt;">&nbsp;</span></p>
<p class="MsoNormal" align="left" style="text-indent: 21pt;"><span style="font-size: 14pt;">日暮已近，一行人才恋恋不舍地离开复旦，走向第二天的研学之路。</span><b><span lang="EN-US" style="font-size:12.0pt"><o:p></o:p></span></b></p>
<p style="text-align: center;"></p>
<p class="MsoNormal" align="right" style="margin-top:12.0pt;text-align:right"><span style="font-size: 14pt;">（组员：赖杨文钊</span><span style="font-size: 14pt;"> </span><span style="font-size: 14pt;">陈方舟</span><span style="font-size: 14pt;"> </span><span style="font-size: 14pt;">毛逸哲</span><span style="font-size: 14pt;"> </span><span style="font-size: 14pt;">潘子喻</span><span style="font-size: 14pt;"> </span><span style="font-size: 14pt;">毕凌杰</span><span style="font-size: 14pt;"> </span><span style="font-size: 14pt;">曹天鑫</span><span style="font-size: 14pt;"> </span><span style="font-size: 14pt;">江璇</span><span style="font-size: 14pt;"> </span><span style="font-size: 14pt;">王语）</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" align="center" style="text-align:center"><span style="font-size:12.0pt;mso-bidi-font-size:14.0pt;font-family:黑体;mso-bidi-font-weight:bold"><span style="font-size: 14pt;"><br>
</span></span></p>
<p class="MsoNormal" align="center" style="text-align:center"><span style="font-size:12.0pt;mso-bidi-font-size:14.0pt;font-family:黑体;mso-bidi-font-weight:bold"><span style="font-size: 14pt;">研学第二天</span></span></p>
<p class="MsoNormal"><span lang="EN-US">&nbsp;&ensp;&ensp;&ensp;</span><span style="font-size: 14pt; text-indent: 21pt;">研学的第二天较为轻松。上午我们再次走进复旦校园聆听讲座。首先是计算机系学霸李泓洁为我们带来的学习经验分享。她从自己冲刺高考的经历中提炼出学习方法与技巧以求带给我们启发，并且带给我们很强的学习动力。当然，最让大家感兴趣的就是学姐分享的复旦生活了，上百个学生社团与许多有趣的活动让我们一窥大学生风采。</span></p>
<p class="MsoNormal" style="text-indent:21.0pt;mso-char-indent-count:2.0"><span style="font-size: 14pt;">第二场讲座是由复旦教授为我们带来的有关</span><span lang="EN-US" style="font-size: 14pt;">AI</span><span style="font-size: 14pt;">的介绍。由于</span><span lang="EN-US" style="font-size: 14pt;">AI</span><span style="font-size: 14pt;">（人工智能）近年来社会关注度持续上升，相关专业与职业也成为了选择热门，因此我们有必要了解其基础与概况。听了这方面的专家讲座无疑是受益匪浅。</span><span lang="EN-US"><o:p></o:p></span></p>
<p style="text-align: center;"></p>
<p class="MsoNormal" style="text-indent: 21pt; text-align: center;"><span lang="EN-US">&nbsp;<img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803213013126.png" border="0" align="center"></span></p>
<p class="MsoNormal"><span style="font-family:黑体;mso-bidi-font-family:云书法手书罗西硬笔楷书">&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<span style="font-size: 12pt;">&ensp;</span><span style="font-size: 12pt;">教授展示</span><span lang="EN-US" style="font-size: 12pt;">AI</span><span style="font-size: 12pt;">机器人</span><span lang="EN-US"><o:p></o:p></span></span></p>
<p style="text-align: center;"></p>
<p class="MsoNormal" style="text-indent: 21pt; text-align: left;"><span style="mso-bidi-font-size:16.0pt;font-family:宋体;mso-ascii-theme-font:minor-fareast;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-theme-font:minor-fareast;mso-bidi-font-family:方正启体简体"><span style="font-size: 14pt;">下午我们来到上海老港再生能源利用中心，参观了垃圾分类科普馆，系统地了解与学习了垃圾分类方法及其重要性。相信在不远的未来，当垃圾分类的新风吹入宁波，我们将成为积极响应者与带动者。</span><span lang="EN-US"><o:p></o:p></span></span></p>
<p class="MsoNormal" style="text-indent: 31.5pt; text-align: center;"><span lang="EN-US" style="font-family:方正启体简体;mso-hansi-font-family:方正启体简体;mso-bidi-font-family:方正启体简体"><o:p><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803214006428.png" border="0" style="width: 390px; height: 205px;" align="center">&nbsp;</o:p></span></p>
<p class="MsoNormal" style="text-indent:31.5pt;mso-char-indent-count:3.0"><span lang="EN-US" style="font-family:方正启体简体;mso-hansi-font-family:方正启体简体;mso-bidi-font-family:方正启体简体"><o:p></o:p></span></p>
<p class="MsoNormal"><span style="font-family:黑体;mso-bidi-font-family:云书法手书罗西硬笔楷书"><span style="font-size: 12pt;">&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;这是用回收的塑料水瓶制成的屋顶装饰</span></span></p>
<p class="MsoNormal" align="right" style="text-align:right"><span style="font-size: 14pt;">（组员：董倍毓 丁孟桥 易小凡 俞锐栋 贺子罕 钱程 翁雨雯 夏寒笑）</span><span lang="EN-US"><o:p></o:p></span></p>
<p></p>
<p class="MsoNormal"><span lang="EN-US"><span style="font-size: 14pt;">&nbsp;</span></span><span style="font-size: 9pt;">&nbsp;</span></p>
<p class="MsoNormal" align="center" style="text-align:center"><span style="font-size:12.0pt;mso-bidi-font-size:14.0pt;font-family:黑体;mso-bidi-font-weight:bold"><span style="font-size: 14pt;">研学第三天</span><span lang="EN-US"><o:p></o:p></span></span></p>
<p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
<p class="MsoNormal" style="text-indent:21.0pt;mso-char-indent-count:2.0"><span style="font-size: 14pt;">第三天的第一站——风语筑，一家专业做城市展馆和相关技术开发的上市公司。工作人员一到就为我们展示了三件展品，并介绍了背后蕴含的公司文化。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" style="text-indent: 31.5pt;"></p>
<p class="MsoNormal"><b><span style="font-size: 14pt;">风</span><span lang="EN-US" style="font-size: 14pt;">--</span><span style="font-size: 14pt;">时代前沿，突破外国无缝屏幕技术封锁</span><span lang="EN-US"><o:p></o:p></span></b></p>
<p style="text-align: center;"></p>
<p class="MsoNormal" style="text-indent: 31.5pt; text-align: center;"><span lang="EN-US" style="font-family:方正启体简体;mso-hansi-font-family:方正启体简体;mso-bidi-font-family:方正启体简体"><o:p><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803214637395_s.jpg" border="0" align="center" style="width: 595px; height: 237px;"><br>
</o:p></span></p>
<p class="MsoNormal" style="text-indent: 31.5pt; text-align: center;"><span lang="EN-US" style="font-family:方正启体简体;mso-hansi-font-family:方正启体简体;mso-bidi-font-family:方正启体简体"><o:p></o:p></span></p>
<p class="MsoNormal"><b><span style="font-size: 14pt;">语</span><span lang="EN-US" style="font-size: 14pt;">--</span><span style="font-size: 14pt;">行业龙头，文化传承，上海最后一套手工戏服</span></b><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" style="text-indent: 31.5pt; text-align: center;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803215050378_s.jpg" border="0" align="center" style="font-family: 方正启体简体; text-indent: 31.5pt; font-size: 9pt; width: 596px; height: 232px;"></p>
<p class="MsoNormal"><b><span style="font-size: 14pt;">筑</span><span lang="EN-US" style="font-size: 14pt;">--</span><span style="font-size: 14pt;">三千根环保材料构筑灯具，表高科技，与国际接轨及公司的环保理念</span></b><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" style="text-align: center;"><b><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803215223689_s.jpg" border="0" align="center" style="width: 584px; height: 504px;"><br>
</b></p>
<p class="MsoNormal"><span lang="EN-US">&nbsp; &nbsp;<span style="font-size: 14pt;">&nbsp;</span></span><span style="font-size: 14pt;">随后的参观让我们看到了这家公司在科技、文化、设计等方面的富有特色的成果展示，极大地开阔了我们的眼界。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" style="text-align: justify;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803215327461.jpg" border="0" align="left" style="width: 360px; height: 342px;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803215537556.jpg" border="0" style="width: 405px; height: 345px;"><br>
</p>
<p class="MsoNormal" style="text-align: justify;"><span style="font-size: 9pt;">&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<span style="font-size: 12pt;">&ensp;&ensp;活字印刷为灵感自主创作的宣传片</span>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;</span><span style="font-size: 12pt; text-align: center;">全息投影</span></p>
<p class="MsoNormal" style="text-align: center;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803220011761_s.jpg" border="0" align="center" style="width: 726px; height: 384px;"><br>
</p>
<p class="MsoNormal" style="text-align: center;"><span style="font-size: 12pt;">物理沙盘</span><span lang="EN-US" style="font-size: 12pt;">AR</span><span style="font-size: 12pt;">增强现实显示车流等城市状况</span></p>
<p class="MsoNormal">&nbsp;<span lang="EN-US">&nbsp;&nbsp; </span><span style="font-size: 14pt;">午饭过后，我们来到了上海交通大学基因生物科普教育基地，讲解员深入浅出，从基因的观念到转基因的实例，从抗虫棉等例子出发，体现了转基因在生产生活中的重要作用，并对社会上关于转基因产品的误解做了深入的阐释。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" style="text-align: left;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803220106221.jpg" border="0" align="left" style="width: 369px; height: 273px;"></p>
<p class="MsoNormal" style="text-align: center;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803220127181.jpg" border="0" style="text-align: justify; font-size: 9pt; width: 413px; height: 271px;"></p>
<p class="MsoNormal" style="text-indent:21.0pt;mso-char-indent-count:2.0"><span style="font-size: 14pt;">随后，同学们还一起做了快速测试转基因非转基因的实验。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" style="text-indent: 21pt; text-align: center;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803220253787.jpg" border="0" align="center" style="width: 712px; height: 379px;"><br>
</p>
<p class="MsoNormal" style="text-align: left;"><span style="font-size: 10.5pt;">&nbsp;&ensp;&ensp;&ensp;<span style="font-size: 14pt;">接下来就是参观上海交通大学校园的活动了。第一站来到了思源门和思源湖。“思源”二字取自“饮水思源”之意。</span></span></p>
<p class="MsoNormal" style="text-align: center;"><span style="font-size: 10.5pt;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803220349944.jpg" border="0" style="width: 492px; height: 461px;"><br>
</span></p>
<p class="MsoNormal" style="margin-left:21.0pt;text-indent:-21.0pt;mso-char-indent-count:-2.0"><span style="font-size: 14pt;">第二站是李政道图书馆。进门我们看到了一串奇怪的数字是，其实断句是这样：</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" style="margin-left: 21pt; text-indent: -21pt; text-align: center;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803220457526_s.jpg" border="0" align="center" style="text-indent: -21pt; font-size: 9pt; width: 578px; height: 306px;"></p>
<p class="MsoNormal"><span lang="EN-US" style="font-size: 14pt;">1926</span><span style="font-size: 14pt;">，</span><span lang="EN-US" style="font-size: 14pt;">24</span><span style="font-size: 14pt;">，</span><span lang="EN-US" style="font-size: 14pt;">30</span><span style="font-size: 14pt;">，</span><span lang="EN-US"><span style="font-size: 14pt;">31</span><o:p></o:p></span></p>
<p></p>
<p class="MsoNormal"><span lang="EN-US" style="font-size: 14pt;">1987</span><span style="font-size: 14pt;">，</span><span lang="EN-US" style="font-size: 14pt;">915</span><span style="font-size: 14pt;">，</span><span lang="EN-US"><span style="font-size: 14pt;">321</span><o:p></o:p></span></p>
<p class="MsoNormal"><span lang="EN-US" style="font-size: 14pt;">1926</span><span style="font-size: 14pt;">年，这一年李政道先生出生。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal"><span lang="EN-US" style="font-size: 14pt;">24</span><span style="font-size: 14pt;">岁，即</span><span lang="EN-US" style="font-size: 14pt;">1950</span><span style="font-size: 14pt;">年，李政道先生获得博士学位。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal"><span lang="EN-US" style="font-size: 14pt;">30</span><span style="font-size: 14pt;">岁，即</span><span lang="EN-US" style="font-size: 14pt;">1956</span><span style="font-size: 14pt;">年，与杨振宁先生共同提出宇称不守恒理论。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal"><span lang="EN-US" style="font-size: 14pt;">31</span><span style="font-size: 14pt;">岁，即</span><span lang="EN-US" style="font-size: 14pt;">1957</span><span style="font-size: 14pt;">年，与杨振宁先生共获诺贝尔奖。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal"><span lang="EN-US" style="font-size: 14pt;">1987</span><span style="font-size: 14pt;">年，李政道先生访问上海交大，为师生发表演讲“坚持自尊自信，切勿自我自私”，并受聘担任上海交通大学客座教授。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal"><span lang="EN-US" style="font-size: 14pt;">915</span><span style="font-size: 14pt;">，李政道先生亲自创立并推动了中美联合招考物理研究生计划，即著名的</span><span lang="EN-US" style="font-size: 14pt;">CUSPEA</span><span style="font-size: 14pt;">项目。在</span><span lang="EN-US" style="font-size: 14pt;">1979</span><span style="font-size: 14pt;">年到</span><span lang="EN-US" style="font-size: 14pt;">1989</span><span style="font-size: 14pt;">年的十年内，该项目累计培养博士研究生</span><span lang="EN-US" style="font-size: 14pt;">915</span><span style="font-size: 14pt;">位。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal"><span lang="EN-US" style="font-size: 14pt;">321</span><span style="font-size: 14pt;">。从</span><span lang="EN-US" style="font-size: 14pt;">1949</span><span style="font-size: 14pt;">年到</span><span lang="EN-US" style="font-size: 14pt;">2011</span><span style="font-size: 14pt;">年荣退李政道先生一共发表学术论文</span><span lang="EN-US" style="font-size: 14pt;">321</span><span style="font-size: 14pt;">篇。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" style="margin-left:21.0pt;text-indent:-21.0pt;mso-char-indent-count:-2.0"></p>
<p class="MsoNormal"><span style="font-size: 14pt;">宇称不守恒</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" style="text-align: center;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803220629350.jpg" border="0" align="center" style="width: 451px; height: 541px;"><br>
</p>
<p class="MsoNormal" style="text-align: center;"><span style="font-size: 12pt;">李政道先生获诺贝尔奖</span></p>
<p class="MsoNormal">&nbsp;<span lang="EN-US">&nbsp;<span style="font-size: 14pt;">&nbsp; </span></span><span style="font-size: 14pt;">最后是交大校史馆和交大校园庙门。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" style="text-align: center;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803223123608.jpg" border="0" align="center" style="width: 561px; height: 501px;"><br>
</p>
<p class="MsoNormal" style="text-indent:21.0pt;mso-char-indent-count:2.0"><span style="font-size: 14pt;">第三天的行程十分充实，我们见识了一家专业化程度极高的会展公司，我们参观了一所英才辈出的大学，我们了解了一位物理学巨匠的生平。这一天上海高温黄色预警，但同学们的热情和上海市的高温一样考验排汗系统。</span><span style="font-size: 9pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></p>
<p class="MsoNormal" align="right" style="text-align:right"><span lang="EN-US"><span style="font-size: 14pt;">&nbsp;</span></span><span style="font-size: 14pt;">（组员：董文乐 干翌阳 高翔 李卓明 邵雪怡 周兴）</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
<p class="MsoNormal" align="center" style="text-align:center"><span style="font-size: 14pt; font-family: 黑体;">研学第四天</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" align="center" style="text-align:center"><span style="font-size: 14pt; font-family: 黑体;"><br>
</span></p>
<p class="MsoNormal" align="left"><span lang="EN-US">&nbsp; &nbsp;</span><span style="text-indent: 21pt; font-size: 14pt;">今早我们参观了同济大学的校园，在</span><span lang="EN-US" style="text-indent: 21pt; font-size: 14pt;">9:00</span><span style="text-indent: 21pt; font-size: 14pt;">时刻我们开始参观同济大学的校史馆，其中馆长给我门深刻的讲解了同济大学的人文内涵，意在破除我们对于工科学校的刻板认识，从而彻底的认识这么一所百年名校。在校史馆当中着重的介绍了该大学在李庄避难时期的故事，充分的展现了同济人严谨办学求真务实的态度。</span></p>
<p class="MsoNormal" style="text-indent: 21pt; text-align: center;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803221059793.png" border="0" align="center" style="width: 463px; height: 330px;"><br>
</p>
<p class="MsoNormal" style="text-indent:21.0pt;mso-char-indent-count:2.0"><span style="font-size: 14pt;">下午</span><span lang="EN-US" style="font-size: 14pt;">1:20</span><span style="font-size: 14pt;">我们参观了京东亚洲一号基地，在此讲解员热情的讲述了亚洲一号的运行原理，同学们也被该厂充满着现代气息，及自动化设施所吸引。同学们积极与工作人员进行互动，问题一个接一个。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" style="text-indent: 21pt; text-align: center;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803221205592.png" border="0" align="center"><br>
</p>
<p class="MsoNormal" style="text-indent:21.0pt;mso-char-indent-count:2.0"><span style="font-size: 14pt;">&ensp;随后，我们参观了迅达电梯有限公司。在此分为了两个部分：第一部分参观该企业是如何生产电梯的流程工序，向我们展现了在互联网时代下的工程新方式。第二部分：讲解以及参观电梯，及该公司的成就，在此我们深入了解了自动扶梯可能对人造成危害的方式，以及不同电梯型号的选择。同学们还过了一把戴工程帽的瘾。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" style="text-indent: 21pt; text-align: center;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803221248805.png" border="0" align="center" style="width: 519px; height: 365px;"><br>
</p>
<p class="MsoNormal" align="right" style="text-align:right"><span style="font-size: 14pt;">（组员：陈磊 赵淳扬 仲汉飞 陈昊杰 胡仪玲 蒋楠溪）</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>
<p class="MsoNormal" align="center" style="text-align:center"><span style="font-size:12.0pt;mso-bidi-font-size:14.0pt;font-family:黑体;mso-bidi-font-weight:bold"><span style="font-size: 14pt;">研学第五天</span><span lang="EN-US"><o:p></o:p></span></span></p>
<p class="MsoNormal" style="text-indent:21.0pt;mso-char-indent-count:2.0"><span lang="EN-US">&nbsp;</span></p>
<p class="MsoNormal" style="text-indent:21.0pt;mso-char-indent-count:2.0"><span style="font-size: 14pt;">第五天早晨，天晴，空气里弥漫着都市里才有的活力与繁华的气息。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" style="text-align: left;"><span lang="EN-US"><span style="font-size: 14pt;">&nbsp;&ensp;</span></span><span style="font-size: 14pt;">上午九点半，我们抵达了上海历史博物馆。 </span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal"><span lang="EN-US"><span style="font-size: 14pt;">&nbsp;&ensp;</span></span><span style="font-size: 14pt;">典雅的建筑渗透着古朴的气息，博物馆由几幢平矮的翻新后的老房子组成，并不像上海市博物馆那么气势恢宏，也不像它有一种引人注目的气质。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal"><span lang="EN-US"><span style="font-size: 14pt;">&nbsp;&ensp;</span></span><span style="font-size: 14pt;">我们的参观是用寻宝的任务的方式进行的，我们需要根据图片找出藏品，并且进行了解，最后汇总，向同学们做一份简单的报告。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" style="text-align: left;"><span style="font-size: 14pt;">&ensp;&ensp;&ensp;这项活动激发了大家极大的兴趣，纷纷去搜寻目标。最后大家的总结也十分精彩，许多同学做到了脱稿演讲，给我们留下了深刻印象。</span></p>
<p class="MsoNormal" style="text-indent: 21pt; text-align: center;"><span style="font-size: 10.5pt;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803221855363.png" border="0" align="center" style="width: 400px; height: 556px;"><br>
</span></p>
<p class="MsoNormal" style="text-indent:21.0pt;mso-char-indent-count:2.0"><span style="font-size: 14pt;">&ensp;中午时分，大雨，我们匆匆赶往复旦大学。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal"><span lang="EN-US"><span style="font-size: 14pt;">&nbsp;&nbsp;</span></span><span style="font-size: 14pt;">用完午餐后我们进行了结营仪式，老师和同学们都对这五天的研学做了小结和评价，同学们的优异表现也赢得了研学老师们一致的好评。结营仪式上评选出了优秀营员。最后，为时五天四夜的研学活动在光华楼的大门前合影中结束了。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal"><span lang="EN-US"><span style="font-size: 14pt;">&nbsp;&ensp;&ensp;</span></span><span style="font-size: 14pt;">五天的研学时间里，我们参观了许多，也了解了许多。参观三所大学，不仅加深了我们对它们的向往，也让我们感受到了它们的校史中所蕴含的人文关怀与对教育的极高重视，感受到了它们的课堂中所包含的严谨而自由的学术氛围。而对工厂、公司、垃圾处理厂的参观，让我们了解了新的知识，体验到仅在电视上看到的内容，也让我们感受到各行各业的人们对自己所处岗位的热爱、对工作的认真以及对未来的期待与无限探索……五天的时间虽然短暂，却也让我们收获了许多能铭记许久的回忆、体验与感悟。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal"><span lang="EN-US"><span style="font-size: 14pt;">&nbsp;&ensp; 2019</span></span><span style="font-size: 14pt;">年</span><span lang="EN-US" style="font-size: 14pt;">7</span><span style="font-size: 14pt;">月</span><span lang="EN-US" style="font-size: 14pt;">25</span><span style="font-size: 14pt;">日下午两点半，返程。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" style="text-indent: 21pt; text-align: center;"></p>
<p class="MsoNormal"><span lang="EN-US"><span style="font-size: 14pt;">&nbsp;&nbsp;</span></span><span style="font-size: 14pt;">再见，上海。</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" style="text-align: center;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803221522419.jpg" border="0" align="center" style="width: 669px; height: 913px;"><br>
</p>
<p class="MsoNormal" align="right" style="text-align:right"><span style="font-size: 14pt;">（组员：周镇基 史林 斯泰语 苏航 黄宇轩 陈雨青 梁邑榕 刘乘雨）</span><span lang="EN-US"><o:p></o:p></span></p>
<p class="MsoNormal" style="text-align: center;"><span style="font-size: 14pt;"><img onload="javascript:if(this.width>850)this.width=850" src="http://www.nbxiaoshi.net/ewebeditor/uploadfile/201908/20190803222707834.png" border="0" align="center" style="width: 667px; height: 431px;"><br>
</span></p>
<p class="MsoNormal" style="text-align: left;"><br>
</p>
<p style="text-align: center;"></p>
												<br>
<div align="right">
	  
												</div>

  ''';
  static const List dd90data = [
    {
      "grade": "高三",
      "subject": "政治",
      "title": "政治刷题推荐",
      "teacher": "庄春艳",
      "content": """庄老师：您好
我觉得我现在急需要刷一点政治题，不然小题不太会找重点，大题没有什么思路。背书的时候不是很能理解，我想靠题目帮我理解一下，做到不怎么知道的再回去背。您觉得现在的情况是更适合刷综合卷还是专题卷呢？有没有什么好的政治刷题推荐呢
因为政治书不是改了很多次嘛，所以不知道哪些是比较新的
 """,
      "from": "复习背书",
      "reply": 0,
      "click": 8,
    },
    {
      "grade": "高二",
      "subject": "数学",
      "title": "解析几何中的内切圆",
      "teacher": "黄琪锋",
      "content": """解析几何试卷P17 第7题（2）
三角形内切圆圆心应该怎么用代数表示？对于两条动直线的角平分线确实难求""",
      "from": "解析几何试卷P17 第7题（2）",
      "reply": 1,
      "click": 89,
    },
    {
      "grade": "高二",
      "subject": "生物",
      "title": "生物的变异与进化",
      "teacher": "任姬",
      "content":
          """P57第六题：按网上资料解释是由于艾滋病病毒（HIV）是逆转录病毒，然后由它的RNA逆转录为DNA并整合到宿主细胞中，再由宿主细胞进行转录翻译合成艾滋病病毒所需的蛋白质外壳。
但我觉得选项D中的基因传递方式应当是普遍的RNA病毒的感染原理。例如烟草花叶病毒等，不知此种理解是否正确？
同样的，DNA病毒（如噬菌体）是否符合选项C中的基因传递方式？
P58第18题：
A选项在这本书里已经出现多次，虽然它的遗传病的定义和浙科版定义有出入，但是很多处都认为是对的
B选项“一个基因”仿佛也没有太大的错误。
P59第21题：
C选项“含一个染色体组的个体是单倍体”是指只含一个染色体组的个体是不可能由受精卵发育而来，只可能由配子发育的吗？
但是在课本P80也有关于一倍体的定义：“只含有一个染色体组的细胞或体细胞中含一个染色体组的个体”。如果含一个染色体组的个体只可能有配子发育而来，那么就没有“一倍体”的说法。
另外，按照课本定义，一倍体、二倍体等整倍体的分类体系和单倍体是不冲突的。也就是说，小麦的花药离体培养产生的植株既可以叫单倍体，又可以叫三倍体（有三个染色体组）。
这里不附图片了。实在非常抱歉，很难通过其他方式联系上任老师。如果打字麻烦，可以试一试搜狗输入法的语音输入。""",
      "from": "暑假作业P57-59",
      "reply": 3,
      "click": 83,
    },
    {
      "grade": "高一",
      "subject": "英语",
      "title": "附件是哪个？",
      "teacher": "曹军",
      "content": "曹老师您好，我想问一下，典范英语的阅读笔记是只有倒数第二页的表格吗？前面英文版的阅读笔记算吗？",
      "from": "高一英语暑假作业p1第3点",
      "reply": 1,
      "click": 71,
    },
    {
      "grade": "高三",
      "subject": "语文",
      "title": "暑假作业",
      "teacher": "徐淑芳",
      "content": "老师您好，助词，副词，连词的区别在哪里",
      "from": "文言词用法",
      "reply": 1,
      "click": 72,
    },
    {
      "grade": "高三",
      "subject": "英语",
      "title": "暑假作业",
      "teacher": "李丹丹",
      "content": "aim to 和 aim at 有什么区别吗",
      "from": "步步高第七页第二大题的第五小题。",
      "reply": 0,
      "click": 71,
    },
    {
      "grade": "高二",
      "subject": "英语",
      "title": "暑假作业中的几个词组",
      "teacher": "陈月飞",
      "content": """《精彩假期》
P4 四、完成句子 6、   答案应当有误
P10 五、课文填空 6、   修饰those的定语从句是否有些问题，就是这个空格是否应当填“who trapped”,全句为those who trapped under the ruins，就是此处who是否一定要写出？（作业中也有those that/which但是没有写出的）
P19三、单词填空 9、    compare to/with语义不同，似答案有误
P19四、完成句子3、 long before 和before long有何区别？仿佛从中文上结束都是很久，很早，只是此处用否定形式翻译为不久
                  具体句子在p19 完成句子3、和p22三、单词填空6、
P39三、单词填空7、   crowded in表示“涌上心头”，全句变为crowded in on the little girl，不通，疑词组有误
p.s. 英语仿佛还是DD90打字容易，但此处硬是要选什么模块颇为麻烦""",
      "from": "暑假作业知识积累填空部分P4,10,19,39",
      "reply": 1,
      "click": 95,
    },
    {
      "grade": "高二",
      "subject": "生物",
      "title": "细胞的呼吸作用及其生产应用",
      "teacher": "任姬",
      "content": """共有以下三个问题（图片附在最后）：暑假作业P24 第16题  P27 第5题  P36  第20题
P24 第16题 
经我计算，选项AD无误，选项C有问题
甲图中a,b,c,d四处消耗的葡萄糖份数依次为5个，3个，3/5个，7/6个，则d浓度消耗葡萄糖量最少，储藏应选择d
另外，乙图中转折点C具体含义是什么？是表示此时仅发生需氧呼吸还是需氧厌氧兼有的平衡点（若为平衡点，二者的比例是多少）？此时二氧化碳释放最少，是否为有机物消耗最少的浓度？即，是否为储藏粮食水果的最合适氧气浓度？
而且网上的解释认为释放二氧化碳最少是就是有机物消耗最少时，即储藏粮食水果的合适氧气浓度，但是每一个葡萄糖分解在需氧时产生6个二氧化碳，厌氧时产生2个。我们可以发现找到一个点使需氧呼吸完全替代厌氧呼吸，这个点虽然释放的二氧化碳仅为厌氧呼吸的1/3，但是也消耗的等量的葡萄糖。虽然上面的情况在实际中并不存在（需氧还是厌氧是有环境氧气浓度决定），但是可以想见二氧化碳释放最少时并不是有机物消耗最少时。如何解释这一问题？
P27 第5题  此题作业帮上答案众说纷纭，并无合理的依据  
P36  第20题 此题难度极大，又觉网上的答案讨论的情形不完整，多有缺漏""",
      "from": "暑假作业P24,27,36",
      "reply": 1,
      "click": 72,
    },
    {
      "grade": "高三",
      "subject": "生物",
      "title": "生物选修本",
      "teacher": "陈玉梅",
      "content": "1、上课时说形成愈伤组织应当避光，但为何选修一课本P59上说形成愈伤组织需要一定的光照？",
      "from": "选修一课本、选修本五三",
      "reply": 1,
      "click": 225,
    },
  ];
  static const List readmoredata = [
    {
      "title": "关于效实中学网站暂停学生服务的通知",
      "time": "2019-8-12",
      "id": "1",
    },
    {
      "title": "暑期活动继续暂停通知",
      "time": "2019-8-10",
      "id": "2",
    },
    {
      "title": "关于做好防御今年第9号台风工作的通知",
      "time": "2019-8-9",
      "id": "3",
    },
    {
      "title": "暂停暑期辅导活动通知",
      "time": "2019-8-8",
      "id": "4",
    },
    {
      "title": "宁波市效实中学22届学生申请住校须知",
      "time": "2019-8-5",
      "id": "5",
    },
    {
      "title": "关于效实中学网站暂停学生服务的通知",
      "time": "2019-8-12",
      "id": "1",
    },
    {
      "title": "暑期活动继续暂停通知",
      "time": "2019-8-10",
      "id": "2",
    },
    {
      "title": "关于做好防御今年第9号台风工作的通知",
      "time": "2019-8-9",
      "id": "3",
    },
    {
      "title": "暂停暑期辅导活动通知",
      "time": "2019-8-8",
      "id": "4",
    },
    {
      "title": "宁波市效实中学22届学生申请住校须知",
      "time": "2019-8-5",
      "id": "5",
    },
    {
      "title": "关于效实中学网站暂停学生服务的通知",
      "time": "2019-8-12",
      "id": "1",
    },
    {
      "title": "暑期活动继续暂停通知",
      "time": "2019-8-10",
      "id": "2",
    },
    {
      "title": "关于做好防御今年第9号台风工作的通知",
      "time": "2019-8-9",
      "id": "3",
    },
    {
      "title": "暂停暑期辅导活动通知",
      "time": "2019-8-8",
      "id": "4",
    },
    {
      "title": "宁波市效实中学22届学生申请住校须知",
      "time": "2019-8-5",
      "id": "5",
    },
    {
      "title": "关于效实中学网站暂停学生服务的通知",
      "time": "2019-8-12",
      "id": "1",
    },
    {
      "title": "暑期活动继续暂停通知",
      "time": "2019-8-10",
      "id": "2",
    },
    {
      "title": "关于做好防御今年第9号台风工作的通知",
      "time": "2019-8-9",
      "id": "3",
    },
    {
      "title": "暂停暑期辅导活动通知",
      "time": "2019-8-8",
      "id": "4",
    },
    {
      "title": "宁波市效实中学22届学生申请住校须知",
      "time": "2019-8-5",
      "id": "5",
    },
  ];
}
