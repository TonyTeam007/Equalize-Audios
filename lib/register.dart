import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectmusic/main.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
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
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  );
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
