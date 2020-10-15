import 'package:dio/dio.dart';
import 'package:eydata_flutter/show_toast.dart';
import 'package:flutter/material.dart';

import 'code_handle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Dio dio = new Dio();

  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title)),
      body: new Column(
        children: [
          new TextField(
            controller: textEditingController,
          ),
          new RaisedButton(
            onPressed: () => submit(),
            child: new Text('submit'),
          ),
        ],
      ),
    );
  }

  /*
  * 登录
  *
  * */
  void submit() async {
    if (textEditingController.text == '') {
      showToast('请输入卡密');
      return;
    }
    Map<String, dynamic> data = {
      'SingleCode': textEditingController.text,
      'Ver': "1.0",
      'Mac': "test",
    };
    Response response = await dio.post(
      'http://w.eydata.net/b7ebe1de688d01b5',
      data: data,
      queryParameters: data,
    );
    print('submit.data::${response.data}');
    if (response.data.length == 'B8882CE538791020935E9D546B28BBAC'.length) {
      getTime();
    }
  }

  /*
  * 获取到期时间
  *
  * */
  void getTime() async {
    Map<String, dynamic> data = {
      'UserName': textEditingController.text,
    };
    Response response = await dio.post(
      'http://w.eydata.net/1822cb4ace59dc9b',
      data: data,
      queryParameters: data,
    );
    print('getTime.data::${response.data}');
    showToast(codeHandle(response.data));
  }
}
