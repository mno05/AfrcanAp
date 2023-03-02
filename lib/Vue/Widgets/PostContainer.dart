import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Widgets/VideoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class PostContainer extends StatefulWidget {
  String Prenom;
  String Nom;
  String PathProfile;
  String TypeContenue;
  String? Legende;
  String? PathContenu;
  String nbrAime;
  bool isLike;
  void Function()? onJaimeTap;
  void Function()? CommentTap;
  PostContainer(
      {super.key,
      required this.Prenom,
      required this.Nom,
      required this.PathProfile,
      required this.TypeContenue,
      required this.onJaimeTap,
      required this.CommentTap,
      required this.nbrAime,
      required this.isLike,
      this.Legende,
      this.PathContenu});

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);

    if (widget.PathContenu!.isEmpty) {
      widget.TypeContenue = "Text";
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        // height: h / 2.2,
        width: w - w * 0.002,
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(
          //   color: AppData.BasicColor,
          //   width: 0,
          // ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              //L'entête
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.PathProfile),
                    radius: 15,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${widget.Prenom} ${widget.Nom}',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.006),
              //Body
              widget.TypeContenue == "Photo"
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.Legende!.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.Legende!,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : Container(),
                        SizedBox(height: 5),
                        Container(
                          width: w,
                          decoration: BoxDecoration(),
                          child: Container(
                              color: Colors.black,
                              height: h * .5,
                              width: w,
                              child: Image.network(
                                widget.PathContenu!,
                                loadingBuilder: (ctx, c, l) {
                                  if (l == null) return c;
                                  return Center(
                                    child: Container(
                                      height: h * .5,
                                      width: w,
                                      color: Colors.black54,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: AppData.BasicColor,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )),
                        ),
                      ],
                    )
                  : widget.TypeContenue == "Video"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.Legende!.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      widget.Legende!,
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : Container(),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.only(
                                  top: h * 0.003, bottom: h * 0.003),
                              width: w,
                              child: Video(
                                path: widget.PathContenu!,
                              ),
                            ),
                          ],
                        )
                      : Container(
                          padding: EdgeInsets.all(h * .1),
                          color: Colors.green,
                          child: Center(
                            child: Text(
                              widget.Legende!,
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
              // SizedBox(height: h * .05),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      FontAwesomeIcons.solidThumbsUp,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(width: w * .02),
                    Text(widget.nbrAime),
                    SizedBox(width: w * .02),
                    Text(
                      "Personnes ont aimés ça",
                      style: GoogleFonts.nunito(),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                width: w,
                color: Colors.black45,
              ),
              SizedBox(height: h * 0.001),
              Container(
                width: w,
                height: h * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.all(3),
                      onPressed: widget.onJaimeTap,
                      icon: Column(
                        children: [
                          widget.isLike
                              ? Icon(FontAwesomeIcons.solidThumbsUp,
                                  color: Colors.blue)
                              : Icon(
                                  FontAwesomeIcons.solidThumbsUp,
                                  color: Colors.black54,
                                ),
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
                      onPressed: widget.CommentTap,
                      icon: Column(
                        children: [
                          // Icon(Icons.comment),
                          Icon(FontAwesomeIcons.comment),
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
                          Icon(
                            Icons.refresh,
                            color: Colors.black12,
                          ),
                          Text(
                            "Republier",
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 7,
                              color: Colors.black12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.all(3),
                      onPressed: () {},
                      icon: Column(
                        children: [
                          Icon(
                            Icons.send_rounded,
                            color: Colors.black12,
                          ),
                          Text(
                            "Envoyer",
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 7,
                              color: Colors.black12,
                            ),
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
