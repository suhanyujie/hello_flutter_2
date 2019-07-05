import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormDemo'),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.purple,
        ),
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterFormDemo(),
            ],
          ),
        ),
      ),
    );
  }
}


/**
 * 输入框
 */
class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.text = '';
    textEditingController.addListener(
      // 只要 input 有变化，则会执行监听器
        (){
          debugPrint('$textEditingController.text');
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: (value){
        debugPrint('$value');
      },
      // 回车/换行触发
      onSubmitted: (value){
        debugPrint('submit...');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.people),
        labelText: 'Title',
        hintText: 'please enter the title',
        border: OutlineInputBorder(),
      ),
    );
  }
}

/**
 * 注册表单
 */
class RegisterFormDemo extends StatefulWidget {
  @override
  _RegisterFormDemoState createState() => _RegisterFormDemoState();
}

class _RegisterFormDemoState extends State<RegisterFormDemo> {
  final registerFormKey = GlobalKey<FormState>();
  String username,passwd;
  bool isAutovalidate = false;

  void submitRegisterForm () {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      debugPrint(username);
      debugPrint(passwd);
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('登陆中...'),
        ),
      );
    } else {
      setState(() {
        isAutovalidate = true;
      });
    }
  }

  String validateUsername (String value) {
    if (value.isEmpty) {
      return '用户名 is required.';
    }
    return null;
  }

  String validatePasswd (String value) {
    if (value.isEmpty) {
      return '密码 is required.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.people),
              labelText: '用户名',
              border: OutlineInputBorder(),
            ),
            onSaved: (value){
              username = value;
            },
            validator: validateUsername,
            autovalidate: isAutovalidate,
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.security),
              labelText: '密码',
              border: OutlineInputBorder(),
            ),
            onSaved: (value){
              passwd = value;
            },
            validator: validatePasswd,
            autovalidate: isAutovalidate,
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text(
                '登陆',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              elevation: 0.0,
              onPressed: submitRegisterForm,
            ),
          ),
        ],
      ),
    );
  }
}


