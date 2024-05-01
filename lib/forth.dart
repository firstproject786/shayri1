import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayri10/main.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import 'forth.dart';

class four extends StatefulWidget {
  List d, d1;
  int m, m1;

  four(this.d, this.m, this.d1, this.m1);

  @override
  State<four> createState() => _fourState();
}

String fpath = '';
WidgetsToImageController controler = WidgetsToImageController();

class _fourState extends State<four> {
  List<Color> col = [
    Colors.black,
    Colors.yellowAccent,
    Colors.white70,
    Colors.red,
    Colors.blue,
    Colors.deepPurpleAccent,
    Colors.deepOrange,
    Colors.lightGreen,
    Colors.black,
    Colors.yellowAccent,
    Colors.white70,
    Colors.red,
    Colors.blue,
    Colors.deepPurpleAccent,
    Colors.deepOrange,
    Colors.lightGreen,
    Colors.black,
    Colors.yellowAccent,
    Colors.white70,
    Colors.red,
    Colors.blue,
    Colors.deepPurpleAccent,
    Colors.deepOrange,
    Colors.lightGreen,
  ];
  Color col1 = Colors.black;
  Color col2 = Colors.white;

  double fsize = 10;
  String font = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    folder().then((value) {
      setState(() {
        fpath = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.d[widget.m]}"),
        backgroundColor: Colors.black,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: WidgetsToImage(
                controller: controler,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "${widget.d1[widget.m1]}",
                      style: TextStyle(
                          color: col2, fontSize: fsize, fontFamily: font),
                    ),
                    color: col1,
                  ),
                ),
              )),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isDismissible: false,
                          context: context,
                          builder: (context) {
                            return Column(
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 20,color: Colors.red,
                                      child: Icon(Icons.close,),

                                    ),
                                  ],
                                ),

                                GridView.builder(
                                  itemCount: col.length,
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          col1 = col[index];
                                        });
                                      },
                                      child: Container(
                                        color: col[index],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: buton(title: 'background')),
                  InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 200,
                              child: GridView.builder(
                                itemCount: col.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 10,crossAxisCount: 5),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        col2 = col[index];
                                      });
                                    },
                                    child: Container(
                                      color: col[index],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: buton(title: 'Text color')),
                  InkWell(
                    onTap: () {
                      setState(() {
                        image();
                      });
                    },
                    child: buton(title: 'shere'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 100,
                              color: Colors.red,
                              child: ListView.builder(
                                itemCount: 12,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        font = 'f$index';
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      color: Colors.yellowAccent,
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        'shayri',
                                        style: TextStyle(
                                            color: Colors.pink,
                                            fontFamily: 'f$index'),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: buton(title: 'shayri')),
                  buton(title: 'emoji'),
                  InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 150,
                              child: StatefulBuilder(
                                builder: (context, setState) {
                                  return Slider(
                                    value: fsize,
                                    min: 5,
                                    max: 50,
                                    label: '$fsize',
                                    onChanged: (value) {
                                      this.setState(() {
                                        setState(() {
                                          fsize = value;
                                        });
                                      });
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: buton(title: 'text size')),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

String v = '';

Future<String> folder() async {
  String folderName = 'vrushabh';
  final path = Directory('storage/emulated/0/DCIM/$folderName');
  v = '$path';
  var status = await Permission.storage.status;
  path.create();
  print(
      '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$status');
  if (status.isGranted) {
    await Permission.storage.request();
  }
  if ((await path.exists())) {
    return path.path;
  } else {
    path.create();
    return path.path;
  }
}

Widget buton({String title = ''}) {
  return Container(
    margin: EdgeInsets.all(5),
    height: 40,
    width: 100,
    color: Colors.red,
    alignment: Alignment.center,
    child: Text(title),
  );
}

Future<void> image() async {
  final bytes = await controler.capture().then((value) {
    String name = 'IMage${Random().nextInt(1000)}.jpg';
    File file = File('$fpath/$name');
    print(
        '==============================================================================${file.path}');
    file.writeAsBytes(value as List<int>);
    file.create();
    Share.shareFiles([file.path], text: 'Great picture');
  });
}






///////////////////////////////////////////////////////////////////////////////////////////////////
