import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

final player=AudioPlayer();
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    Center(child: screen1()),
    Center(child: screen2()),
    Center(child: screen3()),
    Center(child: screen4()),
  ];

  int _currentindex=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Biography'),),
        body: tabs[_currentindex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18.0,
          unselectedFontSize: 14.0,
          iconSize: 30.0,
          currentIndex: _currentindex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),
                                    label: 'Home',
                                    ),
            BottomNavigationBarItem(icon: Icon(Icons.access_alarm),
                                    label: 'Alarm',
                                    ),
            BottomNavigationBarItem(icon: Icon(Icons.business),
                                    label: 'Business',
                                    ),
            BottomNavigationBarItem(icon: Icon(Icons.school),
                                    label: 'School',
                                    ),
          ],
          onTap: (index) { setState(() {
                                       _currentindex=index;
                                       if (index!=0) {
                                         player.stop();
                                       }
                         });
        },
      ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {

  final String s1='我是姚明傑，出生在一個很平凡但很美滿的小家庭，'
      '父親是塑膠模型的工人，母親是台電的承包商人員，而妹妹和我都還在學校求學。'
      '教學方面是母親主管的，希望我們能夠獨立自主、主動學習，父親則不拘束我們，'
      '讓我們放手做想做的事，累積人生經驗，但他們會適時的給予鼓勵和建議，父母親只對'
      '我們要求兩件事，第一是保持健康，第二是著重課業。因為沒有'
      '健康的身體，就算有再多的才華、再大的抱負也無法發揮出來。'
      '又因為家境並不富裕，所以必須專心於課業上，學得一技之長'
      '，將來才能自立更生。除了課業之外，其他方面我也沒有偏廢。'
      '在國、高中時，一有時間就會約同學打藍球，在假日清晨天氣涼爽會一起騎腳踏車，'
      '呼吸新鮮空氣、享受沿途風景和彼此競爭的快感，這段時期不但使我對籃球和腳踏車有進一步的認識，'
      '還認識了許多朋友，因此在那個時候，閒暇之餘已成為我放學後的一大休閒，因此體態維持在良好狀態。'
      '而我最喜歡的運動是籃球，我常在電視上或球場上觀賞籃球比賽，欣賞球隊、球員彼此間的競爭'
      '，模仿其動作，和志同道合的朋友一起討論。';

  @override
  Widget build(BuildContext context) {

    player.play(AssetSource("TheFatRat_Fly_Away.mp3"));

    return SingleChildScrollView(
      child: Column(
        children:<Widget>[
          //先放個標題
          Padding(padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text("Who am I",
                style: TextStyle(fontSize:24,
                  fontWeight:FontWeight.bold,)),
          ),
          //文字自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [ BoxShadow(color: Colors.lightBlueAccent,
                  offset: Offset(6, 6)),
              ],),
            child:Text(s1,
              style: TextStyle(fontSize: 20),),
          ),

          //放一張照片
          Container(
            color: Colors.tealAccent,
            child: Image.asset('images/我.jpg'),
            height: 300,
            width: 400,
          ),
          SizedBox(height: 30,),

          //一列放兩個圖
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.purple,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('images/同學.jpg'),
                    fit: BoxFit.cover ,
                  ),
                  color: Colors.white,
                ),
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.purple,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('images/nba.jpg'),
                    fit: BoxFit.cover ,
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children:<Widget>[
            Padding(padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Text("學習歷程",
                  style: TextStyle(fontSize:24,
                    fontWeight:FontWeight.bold,)),
            ),
          Container(
            color: Colors.tealAccent,
            child: Image.asset('images/學習歷程.jpg'),
            height: 300,
            width: 400,
          ),
          Container(
              child: SfPdfViewer.asset('assets/跳躍小遊戲.pdf'))
          ]),
      );
  }
}

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //有多種排版方式, 此處以最直覺的方式將每一列放文字內容
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("大一時期"),],
          ),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    height: 100,
                    width: 250,
                  child: ListView(
                    children: [
                      //條列式參考
                      Text('1. 學好英文'),
                      Text('2. 熟悉程式語言'),
                    ],
                  ),
                ),
              ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("大二時期"),],
          ),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 100,
                width: 250,
                child: ListView(
                  children: [
                    //條列式參考
                    Text('1. 增強英聽'),
                    Text('2. 學習更多程式語言'),
                  ],
                ),
              ),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("大三時期"),],
          ),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 100,
                width: 250,
                child: ListView(
                  children: [
                    //條列式參考
                    Text('1. 準備研究所'),
                    Text('2. 多做專案'),
                  ],
                ),
              ),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("大四時期"),],
          ),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 100,
                width: 250,
                child: ListView(
                  children: [
                    //條列式參考
                    Text('1. 找實習'),
                    Text('2. 準備考試'),
                  ],
                ),
              ),
            ],),
        ],
      ),);
  }
}

class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children:<Widget>[
           Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Text("專題方向:電商平台",
                          style: TextStyle(fontSize:24,
                          fontWeight:FontWeight.bold,)),
            ),
          ]
      )
    );}
}
