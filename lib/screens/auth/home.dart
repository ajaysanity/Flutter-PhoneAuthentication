import 'package:flutter/material.dart';
import 'package:zlatko_test/repository/repository.dart';

class HomeScreen extends StatelessWidget {
  final String phoneNumber;
  Repository _repository = Repository();
  HomeScreen({this.phoneNumber});
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: media.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Welcome',

              style: TextStyle(
                fontSize: 35,
                color: Colors.red,
                fontWeight: FontWeight.bold
              ),
              ),
              Text(phoneNumber ?? ''),
              RaisedButton(onPressed: () => _repository.firebase.signOut(context),
              child: Text('Sign Out'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
