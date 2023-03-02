import 'dart:developer';

import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
// import 'chew';

class Video extends StatefulWidget {
  final String path;
  const Video({
    super.key,
    required this.path,
  });

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  VideoPlayerController? _controller;
  bool isInitialise = false;
  ChewieController? chewieController;

  @override
  void initState() {
    initPlay();
    super.initState();
  }

  initPlay() async {
    _controller = VideoPlayerController.network(widget.path)
      ..initialize().then((_) {
        setState(() {});
      });

    chewieController = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: true,
      looping: true,
    );

    // final playerWidget = Chewie(
    //   controller: chewieController,
    // );
  }

  @override
  void dispose() {
    _controller!.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    return Container(
      height: h * 0.6,
      // width: ,
      child: chewieController != null
          ? Container(
            color: Colors.black,
            child: Chewie(
                controller: chewieController!,
              ),
          )
          : Container(
              color: Colors.black,
              child: Container(
                height: h * 0.8,
                child: CupertinoActivityIndicator(
                  
                ),
              ),
            ),
    );
  }
}
