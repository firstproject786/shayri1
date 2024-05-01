import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shayri10/modelclass.dart';
import 'package:shayri10/third.dart';

class second extends StatefulWidget {
  List title;
  int index;

  second(this.title, this.index);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.index == 0) {
      blancklist = modelcalss().sad;
    } else if (widget.index == 1) {
      blancklist = modelcalss().happy;
    } else if (widget.index == 2) {
      blancklist = modelcalss().romantic;
    } else if (widget.index == 3) {
      blancklist = modelcalss().motivation;
    } else if (widget.index == 4) {
      blancklist = modelcalss().politics;
    }
  }

  List blancklist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar:
          AppBar(title: Center(child: Text('${widget.title[widget.index]}'))),
      body: ListView.builder(
        itemCount: blancklist.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(5),
            child: ListTile(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return third(blancklist,index,widget.title,widget.index);
              },));
            },
              tileColor: Colors.orange.shade100,
              shape: RoundedRectangleBorder(
                  side: BorderSide(), borderRadius: BorderRadius.circular(20)),
              leading: const Icon(Icons.image),
              title: Text(blancklist[index], maxLines: 2),
            ),
          );
        },
      ),
    );
  }
}
