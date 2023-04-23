import 'dart:developer';
import 'dart:io';
import 'package:african_ap/Controllers/PostController.dart';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Data/SaveSuperUser.dart';
import 'package:african_ap/Models/Post.dart';
import 'package:african_ap/Tools/DateDifference.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/LocalApp/PostModif.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/VideoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class PostContainer extends StatefulWidget {
  String idPost;
  String Portee;
  String idUserClick;
  String Prenom;
  String Nom;
  String PathProfile;
  String TypeContenue;
  String? Legende;
  String? PathContenu;
  String nbrAime;
  String UserType;
  DateTime datePost;
  bool isLike;
  String idProprioPost;
  void Function()? onJaimeTap;
  void Function()? CommentTap;
  PostContainer(
      {super.key,
      required this.idPost,
      required this.UserType,
      required this.Prenom,
      required this.Nom,
      required this.PathProfile,
      required this.TypeContenue,
      required this.onJaimeTap,
      required this.CommentTap,
      required this.nbrAime,
      required this.isLike,
      required this.datePost,
      required this.idProprioPost,
      required this.idUserClick,
      required this.Portee,
      this.Legende,
      this.PathContenu});

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  bool like = false;
  String nbLike = "";
  String dropdownValue = "Option 1";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    like = widget.isLike;
  }

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  More(Media.width(context), Media.height(context)),
                ],
              ),
              SizedBox(
                height: h * 0.006,
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  // mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    widget.Portee == "Tout"
                        ? Icon(FontAwesomeIcons.earthAfrica,
                            size: 15, color: Colors.black87)
                        : Icon(FontAwesomeIcons.peopleGroup,
                            size: 15, color: Colors.black87),
                    SizedBox(width: 8),
                    Text(
                      widget.Portee,
                      style: GoogleFonts.nunito(
                        color: Colors.black87,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Text(
                      "${DateDifference.Ilya(widget.datePost, DateTime.now())}",
                      style: GoogleFonts.nunito(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.006,
              ),

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
                      "personnes ont aimés ça",
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
                      onPressed: () {
                        widget.onJaimeTap!();
                        print('${nbLike}');
                        setState(() {
                          like = !like;
                          try {
                            nbLike = (int.parse(nbLike) + 1).toString();
                          } catch (e) {}
                        });
                      },
                      icon: Column(
                        children: [
                          Icon(FontAwesomeIcons.solidThumbsUp,
                              color: like ? Colors.blue : Colors.black54),
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
                      onPressed: () {
                        BasicsWidgets.YesOrNoDialogue(
                            context: context,
                            msg:
                                "Avec quelle portée voulez vous républier ce post?",
                            NoText: "Restreint au membre",
                            YesText: "Visible pour tous",
                            YesPressed: () {
                              PostController.Republier(
                                context,
                                Post(
                                  idUser: widget.idUserClick,
                                  Legende: widget.Legende,
                                  Portee: "Tout",
                                  type: widget.TypeContenue,
                                  PathContenu: widget.PathContenu,
                                  fileData: File(""),
                                ),
                              );
                            },
                            NonPressed: () {
                              PostController.Republier(
                                context,
                                Post(
                                  idUser: widget.idUserClick,
                                  Legende: widget.Legende,
                                  Portee: widget.UserType,
                                  type: widget.TypeContenue,
                                  PathContenu: widget.PathContenu,
                                  fileData: File(""),
                                ),
                              );
                            });
                      },
                      icon: Column(
                        children: [
                          Icon(
                            Icons.refresh,
                          ),
                          Text(
                            "Republier",
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 7,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // IconButton(
                    //   padding: EdgeInsets.all(3),
                    //   onPressed: () {},
                    //   icon: Column(
                    //     children: [
                    //       Icon(
                    //         Icons.send_rounded,
                    //         color: Colors.black12,
                    //       ),
                    //       Text(
                    //         "Envoyer",
                    //         maxLines: 1,
                    //         style: TextStyle(
                    //           fontSize: 7,
                    //           color: Colors.black12,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget More(w, h) {
    return IconButton(
        icon: Icon(Icons.more_horiz),
        onPressed: () {
          widget.idProprioPost == widget.idUserClick
              ? showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Positioned(
                            right: w / 3,
                            top: 0,
                            left: w / 3,
                            child: Container(
                              width: 100,
                              height: 5,
                              color: Colors.black87,
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 15),
                                Text(
                                  "Que voulez vous faire de ce post?",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    BasicsWidgets.YesOrNoDialogue(
                                      context: context,
                                      msg:
                                          "Vous voulez vraiment supprimer ce post?",
                                      YesText: "Oui",
                                      NoText: "Non",
                                      NonPressed: () => Navigator.pop(context),
                                      YesPressed: () {
                                        PostController.Supprimer(
                                            context, widget.idPost);
                                      },
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.delete_forever,
                                            size: 35,
                                          ),
                                          Text(
                                            "Supprimer",
                                            style: GoogleFonts.nunito(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Text(
                                      //   "Si vous supprimer ce post vous ne pourrez plus le revoir",
                                      //   style: GoogleFonts.nunito(
                                      //     fontWeight: FontWeight.bold,
                                      //     fontSize: 14,
                                      //     color: Colors.black,
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    SaveSuperUser.getSuperUser().then((value) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PostModif(
                                              superUser: value,
                                              post: Post(
                                                idPost: widget.idPost,
                                                idUser: widget.idProprioPost,
                                                Legende: widget.Legende,
                                                Portee: widget.Portee,
                                                type: widget.TypeContenue,
                                                PathContenu: widget.PathContenu,
                                                fileData: File(""),
                                              ),
                                            ),
                                          ));
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.security_update,
                                            size: 35,
                                          ),
                                          Text(
                                            "Modifier",
                                            style: GoogleFonts.nunito(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
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
                )
              : BasicsWidgets.alertWithLottie(
                  msg: "Vous ne pouvez faire aucune action sur ce post",
                  context: context,
                  lottie: "close");
        });
  }
}
