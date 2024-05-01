import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayri10/forth.dart';

class third extends StatefulWidget {
  List data;
  int index;
  List title1;
  int index1;

  third(
    this.data,
    this.index,
    this.title1,
    this.index1,
  );

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  PageController v= PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    v= PageController(initialPage: widget.index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('${widget.title1[widget.index1]}'),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.crop_free_sharp),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text('${widget.index + 1}/${widget.data.length}'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.repeat_rounded),
            )
          ],
        ),
        Expanded(
          child: PageView.builder(
            controller: v,
            itemCount: widget.data.length,
            onPageChanged: (value) {
              setState(() {
                widget.index = value;
                print(widget.index);
              });
            },
            itemBuilder: (BuildContext context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text("${widget.data[widget.index]}",
                      style: TextStyle(
                        color: Colors.black,
                        height: 3,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                      )),
                  color: Colors.amberAccent,
                ),
              );
            },
          ),
        ),
        Row(
          children: [
            Expanded(
                child: InkWell(onTap: () {
                  FlutterClipboard.copy("${widget.data[widget.index]}")
                      .then((value) => print('copied'));
                  Fluttertoast.showToast(
                      msg: "COPIED",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                  child: Container(
              height: 50,
              child: Icon(Icons.copy),
              color: Colors.green,
            ),
                )),
            Expanded(
                child: InkWell(onTap:() {
                  setState(() {
                    if(widget.index > 0){
                         v.previousPage(duration: Duration(seconds: 1), curve: Curves.decelerate);
                    }
                  });
                },
                  child: Container(
              height: 50,
              child: Icon(Icons.arrow_back_ios_new),
              color: Colors.green,
            ),
                )),
            Expanded(
                child: InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return four(widget.title1, widget.index1,widget.data, widget.index);
                  },));
                },
                  child: Container(
              height: 50,
              child: Icon(Icons.edit_off),
              color: Colors.green,
            ),
                )),
            Expanded(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        if(widget.index < widget.data.length-1)
                          {
                            v.nextPage(duration: Duration(seconds: 1), curve: Curves.decelerate);
                          }
                      });
                    },
                    child: Container(
                      height: 50,
                      child: Icon(Icons.arrow_forward_ios_outlined),
                      color: Colors.green,
                    ))),
            Expanded(
                child: InkWell(onTap: () {
                  Share.share("${widget.data[widget.index]}");
                  Fluttertoast.showToast(
                      msg: "SHARE",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                  child: Container(
              height: 50,
              child: Icon(Icons.share),
              color: Colors.green,
            ),
                )),
          ],
        )
      ]),
    );
  }
}

