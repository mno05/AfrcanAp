import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Widgets/StateCircle.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    return Scaffold(
      appBar: AppBar(
        // leadingWidth: 5,

        title: Row(
          children: [
            StateCircle(true),
            SizedBox(width: 8),
            Text("Moïse NDJADI"),
          ],
        ),
        backgroundColor: AppData.BasicColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(top:5,left:5,right:5,bottom: 10),
        // height: h * 0.1,
        width: w,
        
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              child: Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.black54,
              ),
            ),
            InkWell(
              child: Icon(
                Icons.link,
                color: Colors.black54,
              ),
            ),
            Container(
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.only(left: 10),
              width: w / 1.35,
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadiusDirectional.circular(25)
              ),
              child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Ecrire un message",
                    border:InputBorder.none,
                    
                  ),
                  ),
            ),
            InkWell(
              child: Icon(
                Icons.send,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
