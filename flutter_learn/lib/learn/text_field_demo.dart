import 'package:flutter/material.dart';

class TextFieldDemo extends StatelessWidget {
  final userController = TextEditingController();
  final passController = TextEditingController();
  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          TextField(
            focusNode: _usernameFocus,
            controller: userController,
            decoration: InputDecoration(
                icon: Icon(Icons.people),
                labelText: "username",
                hintText: "enter username",
                border: UnderlineInputBorder()),
            onChanged: (value) {
              print("value :$value");
            },
          ),
          SizedBox(
            height: 8,
          ),
          TextField(
            focusNode: _passwordFocus,
            controller: passController,
            decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: "password",
                hintText: "enter password",
                border: UnderlineInputBorder()),
//            textInputAction: TextInputAction.join,
            obscureText: true,
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 300,
            child: RaisedButton(
              child: Text("sign in"),
              color: Color(0xFF2C7FFF),
              textColor: Colors.white,
              onPressed: () {
                var username = userController.text;
                var password = passController.text;
                if (username.isEmpty) {
                  print("username must can not be null!");
                  FocusScope.of(context).requestFocus(_usernameFocus);
                  return;
                }
                if (password.isEmpty) {
                  print("password can not be null");
                  FocusScope.of(context).requestFocus(_passwordFocus);
                  return;
                }
                print("username: $username, password: $password");
                userController.text = "";
                passController.text = "";
                FocusScope.of(context).requestFocus(_usernameFocus);
              },
            ),
          )
        ],
      ),
    );
  }
}
