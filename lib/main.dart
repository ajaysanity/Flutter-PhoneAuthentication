import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zlatko_test/repository/repository.dart';
import 'package:zlatko_test/screens/screens.dart';
import 'package:zlatko_test/router/router.dart' as routes;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Repository _repository = Repository();
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Zlatko_test',
        home: _repository.firebase.handleAuth(),
        onGenerateRoute: routes.generateRoute,
        onUnknownRoute: (settings) => MaterialPageRoute(
            builder: (context) => ErrorScreen())
    );
  }
}
