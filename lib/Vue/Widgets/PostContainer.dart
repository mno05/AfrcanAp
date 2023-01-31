import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: h / 2.3,
        width: w - w * 0.002,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppData.BasicColor,
            width: 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              //L'entête
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("img/profil.png"),
                    radius: 15,
                  ),
                  SizedBox(width: 5),
                  Text('Moise Ndjadi'),
                ],
              ),
              SizedBox(height: h*0.001),

              //Body
              Container(
                height: h * 0.25,
                // width: w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('img/st.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 1,
                width: w,
                color: Colors.black45,
              ),
              SizedBox(height: h*0.001),
              Container(
                width: w,
                height: h * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.all(3),
                      onPressed: () {},
                      icon: Column(
                        children: [
                          Icon(Icons.thumb_up),
                          Text(
                            "J'aime",
                            style: TextStyle(fontSize: 7),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.all(3),
                      onPressed: () {},
                      icon: Column(
                        children: [
                          Icon(Icons.comment),
                          Text(
                            "Commenter",
                            maxLines: 1,
                            style: TextStyle(fontSize: 7),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.all(3),
                      onPressed: () {},
                      icon: Column(
                        children: [
                          Icon(Icons.refresh),
                          Text(
                            "Republier",
                            maxLines: 1,
                            style: TextStyle(fontSize: 7),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.all(3),
                      onPressed: () {},
                      icon: Column(
                        children: [
                          Icon(Icons.send_rounded),
                          Text(
                            "Envoyer",
                            maxLines: 1,
                            style: TextStyle(fontSize: 7),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
