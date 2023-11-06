import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:projectmusic/auth.dart';
import 'package:projectmusic/list.dart';
import 'package:projectmusic/menu.dart';
import 'package:projectmusic/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mobile App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    String? errorMessage = '';
  bool isLogin = false;
  
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPass() async {
    try {
      await Auth().signInWithEmailAndPass(email: _controllerEmail.text, password: _controllerPassword.text);
      setState(() {
        isLogin = true;
      });
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => menuPage(),
        ),
      );
    } on FirebaseAuthException catch (e){
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  final pages = {
    listPage(),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 149, 0, 199), // สีม่วงที่คุณต้องการ
              Colors.black, // สีดำ
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Equalize Audios',
                style: TextStyle(
                    fontSize: 38.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 70.0),
              SizedBox(
                width: 275,
                child: TextField(
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.white, // สีของ Label เป็นสีขาว
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .white), // สีของเส้นขอบเมื่อมีการเน้นคือสีขาว
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .white), // สีของเส้นขอบเมื่อไม่ได้เน้นคือสีขาว
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white, // สีของข้อความใน TextField เป็นสีขาว
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: 275,
                child: TextField(
                  controller: _controllerPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.white, // สีของ Label เป็นสีขาว
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .white), // สีของเส้นขอบเมื่อมีการเน้นคือสีขาว
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .white), // สีของเส้นขอบเมื่อไม่ได้เน้นคือสีขาว
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white, // สีของข้อความใน TextField เป็นสีขาว
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                errorMessage ?? "",
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => registerPage(),
                        ),
                      );
                    },
                    child: Text('Sign In'),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        errorMessage = "";
                      });
                      signInWithEmailAndPass();
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
