import 'package:flutter/material.dart';

// BmiMain페이지
class BmiMain extends StatefulWidget {
  @override
  _BmiMainState createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {
  final _formKey = GlobalKey<FormState>(); // 폼의 상태를 얻기 위한 키

  final _heightController = TextEditingController(); // 키 컨트롤러 객체
  final _weightContoller = TextEditingController(); // 몸무게 컨트롤러 객체

  @override
  void dispose() {
    _heightController.dispose(); // 다 사용한 컨트롤러 해제
    _weightContoller.dispose(); // 다 사용한 컨트롤러 해제
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Bmi Calculator'),
      ),
      body: Container(
        padding:const EdgeInsets.all(16.0),
        child: Form(
          key:_formKey, // 키 할당
          child: Column(
            children:<Widget>[
              TextFormField(
                decoration: InputDecoration( // 외곽선이 있고 힌트로 '키'를 표시
                  border:OutlineInputBorder(),
                  hintText:'키', // placeholder 키
                ),
                controller: _heightController, // 키 컨트롤러 연결
                keyboardType: TextInputType.number, // 숫자만 입력할 수 있음
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return '키를 입력해 주세요';
                  }
                  return null;
                },
              ),
              SizedBox(
                height:16.0,
              ),
              TextFormField(
                decoration: InputDecoration( // 외곽선이 있고 힌트로 '몸무게'를 표시
                  border:OutlineInputBorder(),
                  hintText:'몸무게', // placeholder 몸무게
                ),
                controller: _weightContoller,
                keyboardType: TextInputType.number, // 숫자만 입력할 수 있음
                validator: (value) {
                  if(value!.trim().isEmpty) {
                    return '몸무게를 입력하세요';
                  }
                  return null;
                },
              ),
              Container( // 버튼 여백,배치
                margin:const EdgeInsets.only(top:16.0), // 위 쪽에만 16크기의 여백
                alignment: Alignment.centerRight, // 오른쪽 가운데에 위치
                child:ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()) { // 키와 몸무게 값이 검증되었다면 화면 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BmiResult(
                                double.parse(_heightController.text.trim()),
                                double.parse(_weightContoller.text.trim()))),
                      );
                    }
                  },
                  child:Text('결과'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// 두 번째 페이지
class BmiResult extends StatelessWidget {
  final double height; // 키
  final double weight; // 몸무게

  BmiResult(this.height, this.weight); // 키와 몸무게를 받는 생성자

  String _calcBmi(double bmi) { // bmi 값에 따라 결과 문자 표시
    var result = '저체중';
    if(bmi >= 35) {
      result = '고도 비만';
    } else if(bmi >= 30){
      result = '2단계 비만';
    } else if(bmi >= 25){
      result = '1단계 비만';
    } else if(bmi >= 23){
      result = '과체중';
    } else if(bmi >= 18.5){
      result = '정상';
    }
    return result;
  }

  Widget _buildIcon(double bmi) {
    if(bmi>=23) { // 과체중일 때 매우 실망한 빨강색 아이콘 출력
      return Icon(
        Icons.sentiment_very_dissatisfied,
        color:Colors.red,
        size: 100,
      );
    } else if(bmi>=18.5) { // 정상 체중일 때 만족한 초록색 아이콘 출력
      return Icon(
        Icons.sentiment_satisfied,
        color: Colors.green,
        size: 100,
      );
    } else { // 저체중일 때 실망한 오렌지색 아이콘 출력
      return Icon(
        Icons.sentiment_dissatisfied,
        color:Colors.orange,
        size: 100,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bmi = weight / ((height / 100) * (height / 100));
    print('bmi : $bmi');

    return Scaffold(
        appBar:AppBar(title:Text('비만도 계산기')),
        body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Text( // TODO : 수정할 부분(글자)
                _calcBmi(bmi), // bmi 계산 결과에 따른 결과 문자열
                style:TextStyle(fontSize:36),
              ),
              SizedBox(
                height:16,
              ),
              _buildIcon(bmi),
            ],
          ),
        )
    );
  }
}