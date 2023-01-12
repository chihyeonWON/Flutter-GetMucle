import 'package:flutter/material.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  _NotciePageState createState() => _NotciePageState();
}

class _NotciePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: <Widget>[
          Top(context),
          Middle(context),
        ],
      ),
    );
  }
}

Widget Top(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top:20, bottom: 20), // 위 아래 여백 크기 20
    child: Column(
      children:<Widget>[
        Text('안녕하세요.',
            style:TextStyle(color:Colors.black,
            fontSize:20, fontWeight:FontWeight.bold,)),
        Text('득근득근 앱 개발자 Won Chi Hyeon입니다.',
            style:TextStyle(color:Colors.black,
              fontSize:20,)),
        Text('먼저 득근득근 앱을 이용해주셔서 감사드립니다.',
            style:TextStyle(color:Colors.black,
              fontSize:20,)),
        Container(
          height:20,
        ),
        Text('득근득근 앱은 플러터와 SQLlite를 기반으로 하는',
            style:TextStyle(color:Colors.black,
              fontSize:20,)),
        Text('운동일정 관리 앱입니다.',
            style:TextStyle(color:Colors.black,
              fontSize:20,)),
        Container(
          height:20,
        ),
        Text('더 많은 사용 경험을 드리고자 간단한 타이머와',
            style:TextStyle(color:Colors.black,
              fontSize:20,)),
        Text('비만도 계산기와 운동 정보 게시판 기능을',
            style:TextStyle(color:Colors.black,
              fontSize:20,)),
        Text('앱에 추가하였습니다.',
            style:TextStyle(color:Colors.black,
              fontSize:20,)),
        Container(
          height:20,
        ),
        Text('득근득근 앱 사용에 있어서 불편사항이나',
            style:TextStyle(color:Colors.black,
              fontSize:20,)),
        Text('건의사항, 문의할 사항이 있으시다면',
            style:TextStyle(color:Colors.black,
              fontSize:20,)),
        Text('heungeob1003@gmail.com 여기로',
            style:TextStyle(color:Colors.black,
              fontSize:20,)),
        Text('언제든지 문의해주시면 감사하겠습니다.',
            style:TextStyle(color:Colors.black,
              fontSize:20,)),
        Text('다시 한번 득근득근 앱을 사용해주시는',
            style:TextStyle(color:Colors.black,
              fontSize:20,)),
        Text('모든 분들께 감사드립니다.',
            style:TextStyle(color:Colors.black,
              fontSize:20,)),
      ]
    )
  );
}

Widget Middle(BuildContext context) {
  return ElevatedButton(
    onPressed:(){
      Navigator.pop(context);
    },
    child:Text('이전페이지로'),
  );
}


