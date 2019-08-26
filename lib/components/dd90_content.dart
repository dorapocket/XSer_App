import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class DD90Content extends StatefulWidget {
  DD90Content({Key key}) : super(key: key);

  _DD90ContentState createState() => _DD90ContentState();
}

class _DD90ContentState extends State<DD90Content> {
  String formatName(String a) {
    if (a.length <= 4) {
      return a;
    } else {
      return a.substring(0, 4);
    }
  }

  Color getChipColors(String data) {
    switch (data) {
      case "语文":
        return Colors.indigo;
        break;
      case "数学":
        return Colors.purple;
        break;
      case "英语":
        return Colors.pink;
        break;
      case "物理":
        return Colors.blue;
        break;
      case "化学":
        return Colors.lime;
        break;
      case "生物":
        return Colors.green;
        break;
      case "政治":
        return Colors.teal;
        break;
      case "历史":
        return Colors.orange;
        break;
      case "地理":
        return Colors.blueGrey;
        break;
      case "高一":
        return Colors.blue;
        break;
      case "高二":
        return Colors.cyan;
        break;
      case "高三":
        return Colors.red;
        break;
      default:
        return Colors.grey[400];
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("问题详情"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "政治刷题推荐",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                  child: Badge(
                                    badgeColor: getChipColors("高三"),
                                    shape: BadgeShape.square,
                                    borderRadius: 20,
                                    toAnimate: false,
                                    badgeContent: Text("高三",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10)),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Badge(
                                    badgeColor: getChipColors("政治"),
                                    shape: BadgeShape.square,
                                    borderRadius: 20,
                                    toAnimate: false,
                                    badgeContent: Text("政治",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10)),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "庄春艳",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "问题来源",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "复习背书",
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "问题描述",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Html(
                              data: """
  <td colspan="3" align="left" style="WORD-WRAP: break-word"><p>庄老师：您好</p>
<p><span style="font-size: 9pt;">我觉得我现在急需要刷一点政治题，不然小题不太会找重点，大题没有什么思路。背书的时候不是很能理解，我想靠题目帮我理解一下，做到不怎么知道的再回去背。您觉得现在的情况是更适合刷综合卷还是专题卷呢？有没有什么好的政治刷题推荐呢<br> <img onload="javascript:if(this.width>850)this.width=850" src="https://www.nbxiaoshi.net/ewebeditor/sysimage/emot/12.gif">因为政治书不是改了很多次嘛，所以不知道哪些是比较新的<br> <img onload="javascript:if(this.width>850)this.width=850" src="https://www.nbxiaoshi.net/ewebeditor/sysimage/emot/21.gif">&ensp;</span></p></td>
  """,
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              backgroundColor: Colors.white70,
                              defaultTextStyle:
                                  TextStyle(fontFamily: 'serif', fontSize: 15),
                              linkStyle: const TextStyle(
                                color: Colors.redAccent,
                              ),
                              onLinkTap: (url) {
                              },
                              onImageTap: (src) {
                              },
                              useRichText: true,
                              customRender: (node, children) {
                                if (node is dom.Element) {
                                  switch (node.localName) {
                                    //case "video": return Chewie(...);
                                    //case "custom_tag": return CustomWidget(...);
                                  }
                                }
                              },
                              customTextAlign: (dom.Node node) {
                                if (node is dom.Element) {
                                  switch (node.localName) {
                                    case "p":
                                      return TextAlign.justify;
                                  }
                                }
                              },
                              customTextStyle:
                                  (dom.Node node, TextStyle baseStyle) {
                                if (node is dom.Element) {
                                  switch (node.localName) {
                                    case "p":
                                      return baseStyle.merge(
                                          TextStyle(height: 1, fontSize: 18));
                                  }
                                }
                                return baseStyle;
                              },
                            )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Divider(),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text(
                              "回答",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Divider(),
                          ),
                          //回答楼层 开始
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      child: Icon(Icons.person),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            formatName(
                                                "庄春艳"),
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            "2019/8/20 13:58:08",
                                            style: TextStyle(
                                                fontSize: 12, color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                               Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Html(
                              data: """
                              <p>从前几次的答疑中可以看出来，你对材料的解读和抓重点的确是有不足的，这种情况下，多刷刷题目比起单纯背书更有帮助。至于刷什么类型的试卷，要看你的具体情况，我看你前几次问题都是来自于专题卷，如果你感觉专题卷已经刷的挺多了，例如至少刷完一本了，那可以多刷综合卷。如果你感觉某一本书还不够熟悉，那建议你多刷针对这一本书的专题卷。至于教辅资料，市面上太多了，其实都挺大同小异的。挑选的标准只有两个，一个题目来自于浙江省内，最好是权威性强一点，例如各地市的模拟卷或者名校卷之类。二就是要最新的，从去年下半年开始的题目都是针对新改的教材的，你看看出版日期就能确定了。53，爱思，这些知名品牌都可以用。  </p>
""",
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              backgroundColor: Colors.white70,
                              defaultTextStyle:
                                  TextStyle(fontFamily: 'serif', fontSize: 15),
                              linkStyle: const TextStyle(
                                color: Colors.redAccent,
                              ),
                              onLinkTap: (url) {
                              },
                              onImageTap: (src) {
                              },
                              useRichText: true,
                              customRender: (node, children) {
                                if (node is dom.Element) {
                                  switch (node.localName) {
                                    //case "video": return Chewie(...);
                                    //case "custom_tag": return CustomWidget(...);
                                  }
                                }
                              },
                              customTextAlign: (dom.Node node) {
                                if (node is dom.Element) {
                                  switch (node.localName) {
                                    case "p":
                                      return TextAlign.justify;
                                  }
                                }
                              },
                              customTextStyle:
                                  (dom.Node node, TextStyle baseStyle) {
                                if (node is dom.Element) {
                                  switch (node.localName) {
                                    case "p":
                                      return baseStyle.merge(
                                          TextStyle(height: 1, fontSize: 18));
                                  }
                                }
                                return baseStyle;
                              },
                            )),
                            ],
                          ),
                          //回答楼层 结束
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
