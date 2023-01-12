import 'package:flutter/material.dart';
import 'dart:async'; // Timer 클래스를 포함하는 라이브러리

class StopWatchPage extends StatefulWidget {

  @override
  _StopWatchPageState createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  Timer? _timer; // 타이머

  var _time = 0; // 0.01초마다 1씩 증가시킬 정수형 변수
  var _isRunning = false; // 현재 시작 상태를 나타낼 불리언 변수

  List<String> _lapTimes = []; // 랩타임에 표시할 시간을 저장할 리스트
  @override
  void dispose() { // 앱을 종료할 때 반복되는 동작 취소
    _timer?.cancel();
    super.dispose();
  }

  // 시작 또는 일시정지 버튼 클릭
  void _clickButton() {
    _isRunning = !_isRunning; // 상태 반전

    if(_isRunning) {
      _start();
    } else {
      _pause();
    }
  }

  // 타이머 시작 1/100초에 한 번씩 time 변수를 1증가
  void _start() {
    _timer = Timer.periodic(Duration(milliseconds:10), (timer) {
      setState((){
        _time++;
      });
    });
  }

  // 타이머 취소
  void _pause() {
    _timer?.cancel();
  }

  // 초기화
  void _reset() {
    setState((){
      _isRunning = false;
      _timer?.cancel();
      _lapTimes.clear();
      _time = 0;
    });
  }

  // 랩타임 기록
  void _recordLapTime(String time) {
    _lapTimes.insert(0, '${_lapTimes.length +1}등 $time'); // ~등 시간의 형태로 꾸민 후 리스트에 추가
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('StopWatch'),
      ),
      body:_buildBody(),
      bottomNavigationBar: BottomAppBar( // 하단 AppBar 생성
        child:Container(
          height:50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _clickButton();
        }),
        child:_isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  //내용 부분
  Widget _buildBody() {
    var sec = _time ~/ 100; //초
    var hundredth = '${_time % 100}'.padLeft(2, '0'); // 1/100초

    return Center(
        child:Padding(
            padding:const EdgeInsets.only(top:30),
            child:Stack(
              children:<Widget>[
                Column(
                  children:<Widget>[
                    Row( // 시간을 표시하는 영역
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children:<Widget>[
                        Text(
                          '$sec',
                          style: TextStyle(fontSize:70.0),
                        ),
                        Text('$hundredth', style:TextStyle(fontSize:20)), // 1/100초
                      ],
                    ),
                    SizedBox(
                      height:40.0,
                    ),
                    Container( // 랩타임을 표시하는 영역
                      width:100,
                      height:200,
                      child:ListView(
                        children:_lapTimes.map((time) => Text(time, style:TextStyle(fontSize:20.0,))).toList(),
                      ),
                    )
                  ],
                ),
                Positioned(
                  left:10, // 왼쪽 10의 여백
                  bottom:10, // 아래 10의 여백
                  child:FloatingActionButton( // 왼쪽 아래에 위치한 초기화 버튼)
                    backgroundColor: Colors.deepOrange,
                    onPressed:_reset,
                    child:Icon(Icons.rotate_left),
                  ),
                ),
                Positioned(
                    right:10, // 오른 10의 여백
                    bottom:10, // 아래 10의 여백
                    child:ElevatedButton( // 오른쪽 아래에 위치한 랩타임 버튼
                      onPressed:(){
                        setState((){
                          _recordLapTime('$sec.$hundredth');
                        });
                      },
                      child:Text('랩타임'),
                    )
                )
              ],
            )
        )
    );
  }
}
