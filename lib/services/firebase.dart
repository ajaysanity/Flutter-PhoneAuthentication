import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zlatko_test/router/router_constant.dart';
import 'package:zlatko_test/screens/screens.dart';
import 'package:zlatko_test/services/dialog.dart';

class FirebaseService{
  FirebaseAuth _auth = FirebaseAuth.instance;
  DialogAlert _dialog = DialogAlert();
  Future registerPhone(String mobile, BuildContext context) async {
   await _auth.verifyPhoneNumber(
        phoneNumber: mobile,

        verificationCompleted: (AuthCredential authCredential) {
          _dialog.dismissDialog(context);
          _auth.signInWithCredential(authCredential);
        },
      verificationFailed: ( authException){
        _dialog.dismissDialog(context);
        Navigator.of(context).pushNamed(errorScreen);
      },
       timeout: const Duration(seconds: 2),

       codeAutoRetrievalTimeout: (String verificationId){
         _dialog.dismissDialog(context);
         Navigator.of(context).pushNamed(errorScreen);

       },
      codeSent: (String verificationId, int resendToken){
        // codeSent(verificationId,context, mobile);
      }
    ).catchError((onError){
        print(onError);
    });
  }

  codeSent(verificationId, BuildContext context, mobile){
    TextEditingController codeController = TextEditingController();
    PhoneAuthCredential phoneAuth;
    var smsCode;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text("Enter SMS Code"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: codeController,
              ),

            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Done"),
              textColor: Colors.white,
              color: Colors.redAccent,
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                smsCode = codeController.text.trim();

                phoneAuth = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
                auth.signInWithCredential(phoneAuth).then((result){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => HomeScreen(phoneNumber: mobile)
                  ));
                }).catchError((e){
                  print(e);
                });
              },
            )
          ],
        )
    );
  }

  signOut(){
    _auth.signOut();
  }

  handleAuth(){
    return StreamBuilder(
        stream: _auth.authStateChanges(),
        builder: (BuildContext context, snapshot){
          if(snapshot.hasData){
            return HomeScreen();
          }else{
            return LoginScreen();
          }
        },
    );
  }
}