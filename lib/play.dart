import 'package:flutter/material.dart';

class playPage extends StatefulWidget {
  final String songUrl;

  playPage(this.songUrl);

  @override
  playPageState createState() => playPageState();
}

class playPageState extends State<playPage> {
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
      appBar: AppBar(
        title: Text('Playing'),
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
            children: [
              SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, // สีขาวลอบ
                    ),
                    width: 200,
                    height: 200,
                    padding: EdgeInsets.all(6),
                    child: CircleAvatar(
                      radius: 100, // รัศมีของวงกลม
                      backgroundImage: NetworkImage(
                          "https://www.highsnobiety.com/static-assets/dato/1685093658-looking-attention-step-world-newjeans-main.jpg?fp-x=0.5&fp-y=0.5&fit=crop&auto=compress%2Cformat&cs=srgb&ar=4%3A5&w=1200"), // รูปภาพโปรไฟล์
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'OMG',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ), // แสดงชื่อเพลงที่กำลังเล่น\
              Text(
                'NewJeans',
                style: TextStyle(
                    fontSize: 12.0,
                    color: const Color.fromARGB(199, 255, 255, 255)),
              ),
              SizedBox(height: 20.0),
              // ส่วนของ UI สำหรับควบคุมการเล่นเพลง
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.shuffle),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // _audioPlayer.seekToPrevious();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // if (_audioPlayer.playing) {
                      //   _audioPlayer.pause();
                      // } else {
                      //   _audioPlayer.play();
                      // }
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.skip_next,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // _audioPlayer.seekToNext();
                    },
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.repeat),
                    color: Colors.white,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),
                  Text(
                    "Playlist",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
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
      ),
    );
  }
}
