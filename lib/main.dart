import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/screens/AddContacts.dart';
import 'package:myapp/screens/SignUp.dart';
import 'package:myapp/screens/contacts.dart';
import 'package:myapp/screens/login.dart';
import 'package:myapp/services/AuthService.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAppCheck firebaseAppCheck = FirebaseAppCheck.instance;
  firebaseAppCheck.activate(
    androidProvider: AndroidProvider.debug,
  );
  firebaseAppCheck.getToken().then((value) => print("APP CHECK: $value"));
  runApp( MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
   MyApp({super.key});
FirebaseAuth auth= FirebaseAuth.instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => CheckUser(),
        "/home": (context) => Homepage(),
        "/signup": (context) => SignUpPage(),
        "/login": (context) => Login(),
        "/add": (context) => AddContact()
      },
      
    );
  }
  
}

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  void initState() {
    AuthService().isLoggedIn().then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        Navigator.pushReplacementNamed(context, "/login");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

