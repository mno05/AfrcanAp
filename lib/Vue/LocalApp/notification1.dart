import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Notification1 extends StatelessWidget {
  Notification1({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 136.0, middle: 0.5015),
            child:
                // Adobe XD layer: 'notif-3' (group)
                Stack(
              children: <Widget>[
                // Adobe XD layer: 'bg' (shape)
                Container(
                  color: const Color(0xffffffff),
                ),
                Align(
                  alignment: Alignment(-0.108, 0.683),
                  child: SizedBox(
                    width: 106.0,
                    height: 16.0,
                    child:
                        // Adobe XD layer: 'txt_Yesterday at 8:…' (text)
                        Text(
                      'Yesterday at 8:07pm',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 12,
                        color: const Color(0x66000000),
                        letterSpacing: -0.004919999957084656,
                        height: 1.8333333333333333,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.445, 0.664),
                  child: SizedBox(
                    width: 11.0,
                    height: 11.0,
                    child:
                        // Adobe XD layer: 'ic_clock' (group)
                        Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            border: Border.all(
                                width: 1.5, color: const Color(0x66000000)),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.211, -0.361),
                          child: SizedBox(
                            width: 2.0,
                            height: 4.0,
                            child: SvgPicture.string(
                              _svg_myx7kk,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.22, -0.026),
                  child: SizedBox(
                    width: 121.0,
                    height: 19.0,
                    child:
                        // Adobe XD layer: 'txt_Meredith Hendri…' (text)
                        Text(
                      'Meredith Hendricks',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 14,
                        color: const Color(0xff4e4e60),
                        letterSpacing: -0.005739999949932098,
                        fontWeight: FontWeight.w500,
                        height: 1.5714285714285714,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.686, -0.026),
                  child: SizedBox(
                    width: 95.0,
                    height: 19.0,
                    child:
                        // Adobe XD layer: 'txt_liked your reply' (text)
                        Text(
                      'liked your reply',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 14,
                        color: const Color(0x664e4e60),
                        letterSpacing: -0.005739999949932098,
                        height: 1.5714285714285714,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.446, 0.316),
                  child: SizedBox(
                    width: 104.0,
                    height: 19.0,
                    child:
                        // Adobe XD layer: 'txt_"The Chronicles…' (text)
                        Text(
                      '"The Chronicles".',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 14,
                        color: const Color(0xff4e4e60),
                        letterSpacing: -0.005739999949932098,
                        fontWeight: FontWeight.w500,
                        height: 1.5714285714285714,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.308, 0.316),
                  child: SizedBox(
                    width: 89.0,
                    height: 19.0,
                    child:
                        // Adobe XD layer: 'txt_on your photo' (text)
                        Text(
                      'on your photo',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 14,
                        color: const Color(0x664e4e60),
                        letterSpacing: -0.005739999949932098,
                        height: 1.5714285714285714,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
                Container(),
                Pinned.fromPins(
                  Pin(size: 10.0, end: 23.0),
                  Pin(size: 2.0, middle: 0.4925),
                  child: Transform.rotate(
                    angle: 1.5708,
                    child:
                        // Adobe XD layer: 'options' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(size: 2.0, start: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8b8b),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 2.0, middle: 0.5),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8b8b),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 2.0, end: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8b8b),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 27.0),
            Pin(size: 56.0, middle: 0.6601),
            child:
                // Adobe XD layer: 'notif-4' (group)
                Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(-0.099, 0.5),
                  child: SizedBox(
                    width: 106.0,
                    height: 16.0,
                    child:
                        // Adobe XD layer: 'txt_Yesterday at 8:…' (text)
                        Text(
                      'Yesterday at 8:21pm',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 12,
                        color: const Color(0x66000000),
                        letterSpacing: -0.004919999957084656,
                        height: 1.8333333333333333,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.489, 0.467),
                  child: SizedBox(
                    width: 11.0,
                    height: 11.0,
                    child:
                        // Adobe XD layer: 'ic_clock' (group)
                        Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            border: Border.all(
                                width: 1.5, color: const Color(0x66000000)),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.211, -0.361),
                          child: SizedBox(
                            width: 2.0,
                            height: 4.0,
                            child: SvgPicture.string(
                              _svg_myx7kk,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.237, -0.676),
                  child: SizedBox(
                    width: 121.0,
                    height: 19.0,
                    child:
                        // Adobe XD layer: 'txt_Meredith Hendri…' (text)
                        Text(
                      'Meredith Hendricks',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 14,
                        color: const Color(0xff4e4e60),
                        letterSpacing: -0.005739999949932098,
                        fontWeight: FontWeight.w500,
                        height: 1.5714285714285714,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.77, -0.676),
                  child: SizedBox(
                    width: 84.0,
                    height: 19.0,
                    child:
                        // Adobe XD layer: 'txt_followed you!' (text)
                        Text(
                      'followed you!',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 14,
                        color: const Color(0x664e4e60),
                        letterSpacing: -0.005739999949932098,
                        height: 1.5714285714285714,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 56.0, start: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'ic_follow' (group)
                      Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x0d000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.025, 0.0),
                        child: SizedBox(
                          width: 16.0,
                          height: 11.0,
                          child:
                              // Adobe XD layer: 'ic_follow' (shape)
                              SvgPicture.string(
                            _svg_dr1xj3,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 10.0, end: -4.0),
                  Pin(size: 2.0, middle: 0.2963),
                  child: Transform.rotate(
                    angle: 1.5708,
                    child:
                        // Adobe XD layer: 'options' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(size: 2.0, start: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8b8b),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 2.0, middle: 0.5),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8b8b),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 2.0, end: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8b8b),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 27.0),
            Pin(size: 65.0, middle: 0.8032),
            child:
                // Adobe XD layer: 'notif-5' (group)
                Stack(
              children: <Widget>[
                Container(),
                Pinned.fromPins(
                  Pin(size: 222.0, end: 26.5),
                  Pin(start: 6.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'content' (group)
                      Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 112.0,
                          height: 19.0,
                          child:
                              // Adobe XD layer: 'txt_Fitzgerald Stan…' (text)
                              Text(
                            'Fitzgerald Stanton',
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 14,
                              color: const Color(0xff4e4e60),
                              letterSpacing: -0.005739999949932098,
                              fontWeight: FontWeight.w500,
                              height: 1.5714285714285714,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          width: 94.0,
                          height: 19.0,
                          child:
                              // Adobe XD layer: 'txt_commented on' (text)
                              Text(
                            'commented on',
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 14,
                              color: const Color(0x664e4e60),
                              letterSpacing: -0.005739999949932098,
                              height: 1.5714285714285714,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.28, 0.0),
                        child: SizedBox(
                          width: 104.0,
                          height: 19.0,
                          child:
                              // Adobe XD layer: 'txt_"The Chronicles…' (text)
                              Text(
                            '"The Chronicles".',
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 14,
                              color: const Color(0xff4e4e60),
                              letterSpacing: -0.005739999949932098,
                              fontWeight: FontWeight.w500,
                              height: 1.5714285714285714,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.987, 0.0),
                        child: SizedBox(
                          width: 69.0,
                          height: 19.0,
                          child:
                              // Adobe XD layer: 'txt_your photo' (text)
                              Text(
                            'your photo',
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 14,
                              color: const Color(0x664e4e60),
                              letterSpacing: -0.005739999949932098,
                              height: 1.5714285714285714,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.638, 1.0),
                        child: SizedBox(
                          width: 106.0,
                          height: 16.0,
                          child:
                              // Adobe XD layer: 'txt_Yesterday at 8:…' (text)
                              Text(
                            'Yesterday at 8:21pm',
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 12,
                              color: const Color(0x66000000),
                              letterSpacing: -0.004919999957084656,
                              height: 1.8333333333333333,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 11.0, start: 2.0),
                        Pin(size: 11.0, end: 2.0),
                        child:
                            // Adobe XD layer: 'ic_clock' (group)
                            Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                border: Border.all(
                                    width: 1.5, color: const Color(0x66000000)),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.211, -0.361),
                              child: SizedBox(
                                width: 2.0,
                                height: 4.0,
                                child: SvgPicture.string(
                                  _svg_myx7kk,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 10.0, end: -4.0),
                  Pin(size: 2.0, middle: 0.2381),
                  child: Transform.rotate(
                    angle: 1.5708,
                    child:
                        // Adobe XD layer: 'options' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(size: 2.0, start: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8b8b),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 2.0, middle: 0.5),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8b8b),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 2.0, end: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8b8b),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(-0.885, -0.102),
            child: SizedBox(
              width: 28.0,
              height: 19.0,
              child:
                  // Adobe XD layer: 'txt_Yesterday' (text)
                  Text(
                'Hier',
                style: TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontSize: 14,
                  color: const Color(0xff393939),
                  letterSpacing: -0.005739999949932098,
                  fontWeight: FontWeight.w700,
                  height: 1.5714285714285714,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 136.0, start: 99.0),
            child:
                // Adobe XD layer: 'notif-1' (group)
                Stack(
              children: <Widget>[
                // Adobe XD layer: 'bg' (shape)
                Container(
                  color: const Color(0x0d7aa3f5),
                ),
                Pinned.fromPins(
                  Pin(start: 20.0, end: 54.0),
                  Pin(size: 60.0, middle: 0.7237),
                  child:
                      // Adobe XD layer: 'content' (group)
                      Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment(-0.16, 1.0),
                        child: SizedBox(
                          width: 58.0,
                          height: 16.0,
                          child:
                              // Adobe XD layer: 'txt_4 mins ago' (text)
                              Text(
                            '4 mins ago',
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 12,
                              color: const Color(0x66000000),
                              letterSpacing: -0.004919999957084656,
                              height: 1.8333333333333333,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                            softWrap: false,
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 11.0, middle: 0.2793),
                        Pin(size: 11.0, end: 2.0),
                        child:
                            // Adobe XD layer: 'ic_clock' (group)
                            Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                border: Border.all(
                                    width: 1.5, color: const Color(0x66000000)),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.211, -0.361),
                              child: SizedBox(
                                width: 2.0,
                                height: 4.0,
                                child: SvgPicture.string(
                                  _svg_myx7kk,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.146, -1.0),
                        child: SizedBox(
                          width: 116.0,
                          height: 19.0,
                          child:
                              // Adobe XD layer: 'txt_Guerrero Woodard' (text)
                              Text(
                            'Guerrero Woodard',
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 14,
                              color: const Color(0xff4e4e60),
                              letterSpacing: -0.005739999949932098,
                              fontWeight: FontWeight.w500,
                              height: 1.5714285714285714,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          width: 94.0,
                          height: 19.0,
                          child:
                              // Adobe XD layer: 'txt_commented on' (text)
                              Text(
                            'commented on',
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 14,
                              color: const Color(0x664e4e60),
                              letterSpacing: -0.005739999949932098,
                              height: 1.5714285714285714,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.569, -0.024),
                        child: SizedBox(
                          width: 104.0,
                          height: 19.0,
                          child:
                              // Adobe XD layer: 'txt_"The Chronicles…' (text)
                              Text(
                            '"The Chronicles".',
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 14,
                              color: const Color(0xff4e4e60),
                              letterSpacing: -0.005739999949932098,
                              fontWeight: FontWeight.w500,
                              height: 1.5714285714285714,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.31, -0.024),
                        child: SizedBox(
                          width: 69.0,
                          height: 19.0,
                          child:
                              // Adobe XD layer: 'txt_your photo' (text)
                              Text(
                            'your photo',
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 14,
                              color: const Color(0x664e4e60),
                              letterSpacing: -0.005739999949932098,
                              height: 1.5714285714285714,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Container(),
                      Pinned.fromPins(
                        Pin(size: 16.0, start: 0.0),
                        Pin(size: 16.0, start: 2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffec5757),
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(-0.865, -0.709),
                  child: SizedBox(
                    width: 78.0,
                    height: 19.0,
                    child:
                        // Adobe XD layer: 'txt_Today' (text)
                        Text(
                      'Aujourd\'hui',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 14,
                        color: const Color(0xff393939),
                        letterSpacing: -0.005739999949932098,
                        fontWeight: FontWeight.w700,
                        height: 1.5714285714285714,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 10.0, end: 11.0),
                  Pin(size: 2.0, middle: 0.4925),
                  child: Transform.rotate(
                    angle: 1.5708,
                    child:
                        // Adobe XD layer: 'options' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(size: 2.0, start: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8b8b),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 2.0, middle: 0.5),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8b8b),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 2.0, end: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8b8b),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 104.0, middle: 0.3319),
            child:
                // Adobe XD layer: 'notif-2' (group)
                Stack(
              children: <Widget>[
                // Adobe XD layer: 'bg' (shape)
                Container(
                  color: const Color(0x0d7aa3f5),
                ),
                Pinned.fromPins(
                  Pin(start: 20.0, end: 54.0),
                  Pin(size: 60.0, middle: 0.4773),
                  child:
                      // Adobe XD layer: 'content' (group)
                      Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment(-0.153, 1.0),
                        child: SizedBox(
                          width: 65.0,
                          height: 16.0,
                          child:
                              // Adobe XD layer: 'txt_20 mins ago' (text)
                              Text(
                            '20 mins ago',
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 12,
                              color: const Color(0x66000000),
                              letterSpacing: -0.004919999957084656,
                              height: 1.8333333333333333,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 11.0, middle: 0.2793),
                        Pin(size: 11.0, end: 2.0),
                        child:
                            // Adobe XD layer: 'ic_clock' (group)
                            Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                border: Border.all(
                                    width: 1.5, color: const Color(0x66000000)),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.211, -0.361),
                              child: SizedBox(
                                width: 2.0,
                                height: 4.0,
                                child: SvgPicture.string(
                                  _svg_myx7kk,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.164, -1.0),
                        child: SizedBox(
                          width: 112.0,
                          height: 19.0,
                          child:
                              // Adobe XD layer: 'txt_Fitzgerald Stan…' (text)
                              Text(
                            'Fitzgerald Stanton',
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 14,
                              color: const Color(0xff4e4e60),
                              letterSpacing: -0.005739999949932098,
                              fontWeight: FontWeight.w500,
                              height: 1.5714285714285714,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          width: 94.0,
                          height: 19.0,
                          child:
                              // Adobe XD layer: 'txt_commented on' (text)
                              Text(
                            'commented on',
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 14,
                              color: const Color(0x664e4e60),
                              letterSpacing: -0.005739999949932098,
                              height: 1.5714285714285714,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.569, -0.024),
                        child: SizedBox(
                          width: 104.0,
                          height: 19.0,
                          child:
                              // Adobe XD layer: 'txt_"The Chronicles…' (text)
                              Text(
                            '"The Chronicles".',
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 14,
                              color: const Color(0xff4e4e60),
                              letterSpacing: -0.005739999949932098,
                              fontWeight: FontWeight.w500,
                              height: 1.5714285714285714,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.31, -0.024),
                        child: SizedBox(
                          width: 69.0,
                          height: 19.0,
                          child:
                              // Adobe XD layer: 'txt_your photo' (text)
                              Text(
                            'your photo',
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 14,
                              color: const Color(0x664e4e60),
                              letterSpacing: -0.005739999949932098,
                              height: 1.5714285714285714,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Container(),
                      Pinned.fromPins(
                        Pin(size: 16.0, start: 0.0),
                        Pin(size: 16.0, start: 2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffec5757),
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 10.0, end: 11.0),
                  Pin(size: 2.0, middle: 0.3333),
                  child: Transform.rotate(
                    angle: 1.5708,
                    child:
                        // Adobe XD layer: 'options' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(size: 2.0, start: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8b8b),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 2.0, middle: 0.5),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8b8b),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 2.0, end: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8b8b),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 23.0, end: 32.0),
            Pin(size: 43.0, start: 46.0),
            child:
                // Adobe XD layer: 'notifications' (group)
                Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 195.0,
                    height: 43.0,
                    child:
                        // Adobe XD layer: 'txt_Notifications' (text)
                        Text(
                      'Notifications',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 32,
                        color: const Color(0xff000000),
                        letterSpacing: 0.012479999542236327,
                        fontWeight: FontWeight.w700,
                        height: 1.28125,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(1.0, 0.36),
                  child: SizedBox(
                    width: 22.0,
                    height: 18.0,
                    child:
                        // Adobe XD layer: 'ic_filter' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(size: 1.0, start: 3.0),
                          Pin(size: 7.0, end: 0.0),
                          child: SvgPicture.string(
                            _svg_fd5f,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 1.0, start: 3.0),
                          Pin(size: 7.0, start: 0.0),
                          child: SvgPicture.string(
                            _svg_c3s7,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.048, 1.0),
                          child: SizedBox(
                            width: 1.0,
                            height: 9.0,
                            child: SvgPicture.string(
                              _svg_bs4d0d,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.048, -1.0),
                          child: SizedBox(
                            width: 1.0,
                            height: 5.0,
                            child: SvgPicture.string(
                              _svg_n5emb,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 1.0, end: 2.0),
                          Pin(size: 5.0, end: 0.0),
                          child: SvgPicture.string(
                            _svg_h9fzob,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 1.0, end: 2.0),
                          Pin(size: 9.0, start: 0.0),
                          child: SvgPicture.string(
                            _svg_v1jgl,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Align(
                          alignment: Alignment(-1.0, 0.294),
                          child: SizedBox(
                            width: 6.0,
                            height: 1.0,
                            child: SvgPicture.string(
                              _svg_hrb5n3,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.0, -0.412),
                          child: SizedBox(
                            width: 6.0,
                            height: 1.0,
                            child: SvgPicture.string(
                              _svg_v34u1p,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(1.0, 0.529),
                          child: SizedBox(
                            width: 6.0,
                            height: 1.0,
                            child: SvgPicture.string(
                              _svg_d6cl,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 44.0, start: 0.0),
            child:
                // Adobe XD layer: 'Status bar/light' (group)
                Stack(
              children: <Widget>[
                SizedBox.expand(
                    child:
                        // Adobe XD layer: 'bg' (shape)
                        SvgPicture.string(
                  _svg_yn2f,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                )),
                Container(),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 276.0, end: -0.5),
            Pin(size: 1.0, middle: 0.2898),
            child: SvgPicture.string(
              _svg_i9pw,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 276.0, end: -0.5),
            Pin(size: 1.0, middle: 0.5857),
            child: SvgPicture.string(
              _svg_qdqng4,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 276.0, end: -0.5),
            Pin(size: 1.0, middle: 0.7139),
            child: SvgPicture.string(
              _svg_kd86x8,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_myx7kk =
    '<svg viewBox="7.4 4.1 2.1 4.3" ><path transform="translate(-4.64, -1.86)" d="M 12 6 L 12 9.216325759887695 L 14.1442174911499 10.2884349822998" fill="none" fill-opacity="0.4" stroke="#000000" stroke-width="1.5" stroke-opacity="0.4" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_dr1xj3 =
    '<svg viewBox="52.5 152.5 16.0 11.0" ><path transform="translate(48.5, 146.5)" d="M 20 6 L 9 17 L 4 12" fill="none" stroke="#47d764" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_fd5f =
    '<svg viewBox="4.0 14.0 1.0 7.0" ><path transform="translate(4.0, 14.0)" d="M 0 7 L 0 0" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_c3s7 =
    '<svg viewBox="4.0 3.0 1.0 7.0" ><path transform="translate(4.0, 3.0)" d="M 0 7 L 0 0" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_bs4d0d =
    '<svg viewBox="12.0 12.0 1.0 9.0" ><path transform="translate(12.0, 12.0)" d="M 0 9 L 0 0" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_n5emb =
    '<svg viewBox="12.0 3.0 1.0 5.0" ><path transform="translate(12.0, 3.0)" d="M 0 5 L 0 0" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_h9fzob =
    '<svg viewBox="20.0 16.0 1.0 5.0" ><path transform="translate(20.0, 16.0)" d="M 0 5 L 0 0" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_v1jgl =
    '<svg viewBox="20.0 3.0 1.0 9.0" ><path transform="translate(20.0, 3.0)" d="M 0 9 L 0 0" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_hrb5n3 =
    '<svg viewBox="1.0 14.0 6.0 1.0" ><path transform="translate(1.0, 14.0)" d="M 0 0 L 6 0" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_v34u1p =
    '<svg viewBox="9.0 8.0 6.0 1.0" ><path transform="translate(9.0, 8.0)" d="M 0 0 L 6 0" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_d6cl =
    '<svg viewBox="17.0 16.0 6.0 1.0" ><path transform="translate(17.0, 16.0)" d="M 0 0 L 6 0" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_yn2f =
    '<svg viewBox="0.0 70.0 375.0 44.0" ><path transform="translate(0.0, 114.0)" d="M 0 -44 L 375 -44 L 375 0 L 0 0 L 0 -44 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_i9pw =
    '<svg viewBox="99.5 235.0 276.0 1.0" ><path transform="translate(99.5, 235.0)" d="M 0 0 L 276 0" fill="none" stroke="#000000" stroke-width="1" stroke-opacity="0.08" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qdqng4 =
    '<svg viewBox="99.5 475.0 276.0 1.0" ><path transform="translate(99.5, 475.0)" d="M 0 0 L 276 0" fill="none" stroke="#000000" stroke-width="1" stroke-opacity="0.08" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kd86x8 =
    '<svg viewBox="99.5 579.0 276.0 1.0" ><path transform="translate(99.5, 579.0)" d="M 0 0 L 276 0" fill="none" stroke="#000000" stroke-width="1" stroke-opacity="0.08" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
