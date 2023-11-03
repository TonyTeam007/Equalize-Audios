import 'package:flutter/material.dart';
import 'package:projectmusic/play.dart';

class listPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My NewJeans"),
        backgroundColor: Colors.cyan,
      ),
      body: list(),
    );
  }
}

class list extends StatelessWidget {
  final List<String> songs = [
    'Song 1',
    'Song 2',
    'Song 3',
    'Song 4',
    'Song 5',
    'Song 6',
    'Song 7',
    'Song 8',
    // เพิ่มรายการเพลงเพิ่มเติมตรงนี้
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 149, 0, 199),
              Colors.black,
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Color.fromARGB(146, 175, 37, 209),
                  hintText: 'ค้นหาเพลง',
                  hintStyle:
                      TextStyle(color: Color.fromARGB(122, 255, 255, 255)),
                  contentPadding:
                      EdgeInsets.all(16.0), // ระยะห่างขอบของ TextField
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(25.0)), // กำหนดมุมมน
                  ),
                ),
                onSubmitted: (value) {
                  // รับค่าข้อความค้นหา
                  print(value);
                },
              ),
            ),
            Text(
              "My NewJeans",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(0, 255, 193, 7),
                    child: ListTile(
                      title: Text(
                        songs[index],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        "Album",
                        style: TextStyle(
                          color: const Color.fromARGB(167, 255, 255, 255),
                          fontSize: 12.0,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.star,
                                color: Color.fromARGB(127, 255, 255,
                                    255)), // เปลี่ยน Icon ให้เป็น "star"
                            onPressed: () {
                              // รหัสเมื่อคลิกที่ "star" icon
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete,
                                color: const Color.fromARGB(127, 255, 255,
                                    255)), // เปลี่ยน Icon ให้เป็น "delete"
                            onPressed: () {
                              // รหัสเมื่อคลิกที่ "delete" icon
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => playPage(
                                "https://www.youtube.com/watch?v=sVTy_wmn5SU"),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
