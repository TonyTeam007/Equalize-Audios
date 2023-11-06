import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectmusic/auth.dart';
import 'package:projectmusic/main.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {

    String? errorMessage = '';
  
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmPassword = TextEditingController();

  Future<int> register() async {
    try {
      await Auth().createUser(
        name: _controllerName.text,
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      if(_controllerName.text == "" || _controllerEmail.text == "" || _controllerPassword.text == "" || _controllerConfirmPassword.text == "") {
        return 1;
      }
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return 2;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return 3;
      }
    } catch (e) {
      print(e);
      return -1;
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.amber,
      ),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                'Sign In',
                style: TextStyle(
                    fontSize: 38.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 40.0),
              SizedBox(
                width: 275,
                child: TextField(
                  controller: _controllerName,
                  decoration: InputDecoration(
                    labelText: 'Name',
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
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: 275,
                child: TextField(
                  controller: _controllerConfirmPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
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
              ElevatedButton(
                onPressed: () async {
                  var regist = await register();
                  if(regist == 0){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ),
                    );
                  } else if(regist == 1) {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Empty Input'),
                            content: const SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('Insert every Input box.'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Approve'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else if (regist == 2){
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Weak Password'),
                            content: const SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('The password provided is too weak.'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Approve'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Mail Already used'),
                            content: const SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('The account already exists for that email.'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Approve'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                },
                child: Text('Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
