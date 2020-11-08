import 'package:flutter/material.dart';
import 'package:zlatko_test/repository/repository.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController(text: '+63');
  Repository _repository = Repository();

  // void initState(){
  //   super.initState();
  //   _repository.dialog.dismissDialog(context);
  // }

  void dispose(){
    super.dispose();
    phoneController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                maxLength: 13,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[200])
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[300])
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],

                ),
                controller: phoneController,
              ),
              SizedBox(height: 20,),
              Container(
                width: media.width,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    _repository.dialog.showLoaderDialog(context, 'Loading Please Wait');
                    _repository.firebase.registerPhone(phoneController.text, context);
                  },
                  child: Text('Login',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}

