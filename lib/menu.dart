import 'package:flutter/material.dart';
import 'package:projectmusic/auth.dart';
import 'package:projectmusic/list.dart';
import 'package:projectmusic/main.dart';

class menuPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.nameUser ?? "Create Playlist"),
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder(
        future: Auth().getPlaylist(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Container(
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
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.star),
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Play List",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 36.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Container(
                        child: Column(
                          children: <Widget>[...(snapshot.data?.map((e) => playlist()) ?? []).toList(),]
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => listPage(),
                        ));
                      },
                      child: Text('Create Playlist'),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }
}

class playlist extends StatelessWidget {
  const playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => listPage(),
          ));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 5.0), // เพิ่ม padding ด้านบนและด้านล่าง
          child: Container(
            width: 325,
            height: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(204, 187, 68, 227),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 0, 0, 0), // สีเงา
                  offset: Offset(0, 3), // ตำแหน่งของเงา (x, y)
                  blurRadius: 5.0, // ขนาดของเงา
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                Text(
                  "My NewJeans",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                Padding(padding: EdgeInsets.fromLTRB(60, 0, 0, 0)),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.format_list_bulleted),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.create_outlined),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
