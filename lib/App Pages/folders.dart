import 'package:flutter/material.dart';
import 'package:complete_recorder/homepage.dart';

class Folders extends StatefulWidget {
  @override
  _FoldersState createState() => _FoldersState();
}

class _FoldersState extends State<Folders> {
  @override
  Widget build(BuildContext context) {
    //ROW 3; SAFE AREA, CONTAINER WITH BORDER THAT CONTAIN FILES
    return SafeArea(
      child: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20),bottom: Radius.circular(20),),
          border: Border(
            top: BorderSide(width: 3.0, color: Colors.white70),
            bottom: BorderSide(width: 3.0, color: Colors.white70),
            right: BorderSide(width: 3.0, color: Colors.white70),
            left: BorderSide(width: 3.0, color: Colors.white70),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.folder_rounded),
                  iconSize: 80.0,
                  color: Colors.blue[500],
                  //highlightColor: Colors.grey,
                  splashColor: Colors.grey,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.folder_rounded),
                  iconSize: 80.0,
                  color: Colors.blue[500],
                  //highlightColor: Colors.grey,
                  splashColor: Colors.grey,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.folder_rounded),
                  iconSize: 80.0,
                  color: Colors.blue[500],
                  //highlightColor: Colors.grey,
                  splashColor: Colors.grey,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()));
                  },
                ),
              ],
            ),
            //TEXT LABEL
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Choir!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'School',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Anything',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                ]),
          ],
        ),
      ),
    );

  }
}
