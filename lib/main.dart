import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayri10/second.dart';

import 'forth.dart';


void main() {
  runApp(MaterialApp(
    home: home(),debugShowCheckedModeBanner: false,
  ));
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override

  List cat = ['Sad', 'Happy', 'Romance', 'Motivation', 'Politics'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     permission();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey,
      appBar: AppBar(title: Center(child: Text('Shayri'))),
      body: ListView.builder(
        itemCount: cat.length,

        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(5),
            child: ListTile(tileColor: Colors.orange.shade100,shape: RoundedRectangleBorder(side: BorderSide(),borderRadius: BorderRadius.circular(20)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return second(cat,index);
                },));
              },
              leading: const Icon(Icons.image),
              title: Text(cat[index],style: TextStyle(fontStyle: FontStyle.italic)),


            ),
          );
        },
      ),
    );
  }
}

Future<void> permission() async {
  var status =Permission.storage.status;
  print('=============================================$status');
  if(await status.isDenied)
    {
      Permission.storage.request();

    }
}
