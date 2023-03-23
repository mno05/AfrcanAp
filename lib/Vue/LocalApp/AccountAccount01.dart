import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountAccount01 extends StatelessWidget {
  AccountAccount01({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.0, 1.0),
                end: Alignment(0.0, -1.0),
                colors: [const Color(0xff434343), const Color(0xff000000)],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('profil.png'),
                fit: BoxFit.fill,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.23), BlendMode.dstIn),
              ),
            ),
            // margin: EdgeInsets.fromLTRB(-62.0, -53.0, -63.0, 3.0),
          ),
          Pinned.fromPins(
            Pin(start: 23.0, end: 22.0),
            Pin(size: 501.0, end: -45.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x401e1e1e),
                    offset: Offset(0, 30),
                    blurRadius: 25,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 128.0, middle: 0.502),
            Pin(size: 145.9, start: 66.1),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 28.0, middle: 0.7698),
                  child: Text(
                    'Sarah Smith',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.24,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment(-0.018, 1.0),
                  child: SizedBox(
                    width: 73.0,
                    height: 19.0,
                    child: Text(
                      '@Smsarah',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: const Color(0xffffffff),
                        letterSpacing: 0.156,
                        height: 5.230769230769231,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 75.0,
                    height: 75.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff28212e),
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            border: Border.all(
                                width: 2.0, color: const Color(0xffffffff)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x26000000),
                                offset: Offset(0, 6),
                                blurRadius: 16,
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage('profil.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              // margin: EdgeInsets.fromLTRB(-54.1, -6.7, -45.8, -34.8),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff28212e),
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 121.0, start: 48.0),
            Pin(size: 321.0, end: 104.0),
            child: Text(
              'Edit profile\nSettings\nFAQs\nGet help\nFeedback\nPrivacy & terms',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                color: const Color(0xff262626),
                letterSpacing: 0.18,
                fontWeight: FontWeight.w500,
                height: 4,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
          InkWell(
            onTap: () {
              log("GGGGGGGGGGGGGGGGGGGGGGGGGGGGGG");
            },
            child: Pinned.fromPins(
              Pin(start: 48.0, end: 47.0),
              Pin(size: 1.0, middle: 0.4492),
              child: Container(
                color: const Color(0x1a000000),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 48.0, end: 47.0),
            Pin(size: 1.0, middle: 0.5365),
            child: Container(
              color: const Color(0x1a000000),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 48.0, end: 47.0),
            Pin(size: 1.0, middle: 0.6195),
            child: Container(
              color: const Color(0x1a000000),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 48.0, end: 47.0),
            Pin(size: 1.0, middle: 0.7067),
            child: Container(
              color: const Color(0x1a000000),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 48.0, end: 47.0),
            Pin(size: 1.0, middle: 0.794),
            child: Container(
              color: const Color(0x1a000000),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 48.0, end: 47.0),
            Pin(size: 1.0, end: 83.0),
            child: Container(
              color: const Color(0x1a000000),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 14.4, end: 54.6),
            Pin(size: 14.4, middle: 0.4084),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    border:
                        Border.all(width: 1.4, color: const Color(0xffb3b3b3)),
                  ),
                ),
                Align(
                  alignment: Alignment(0.25, 0.0),
                  child: SizedBox(
                    width: 3.0,
                    height: 6.0,
                    child: SvgPicture.string(
                      _svg_hegh5b,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 0.075),
                  child: SizedBox(
                    width: 6.0,
                    height: 1.0,
                    child: SvgPicture.string(
                      _svg_ef5t8e,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 14.4, end: 54.6),
            Pin(size: 14.4, middle: 0.493),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    border:
                        Border.all(width: 1.4, color: const Color(0xffb3b3b3)),
                  ),
                ),
                Align(
                  alignment: Alignment(0.25, 0.0),
                  child: SizedBox(
                    width: 3.0,
                    height: 6.0,
                    child: SvgPicture.string(
                      _svg_hegh5b,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 0.075),
                  child: SizedBox(
                    width: 6.0,
                    height: 1.0,
                    child: SvgPicture.string(
                      _svg_ef5t8e,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 14.4, end: 54.6),
            Pin(size: 14.4, middle: 0.5776),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    border:
                        Border.all(width: 1.4, color: const Color(0xffb3b3b3)),
                  ),
                ),
                Align(
                  alignment: Alignment(0.25, 0.0),
                  child: SizedBox(
                    width: 3.0,
                    height: 6.0,
                    child: SvgPicture.string(
                      _svg_hegh5b,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 0.075),
                  child: SizedBox(
                    width: 6.0,
                    height: 1.0,
                    child: SvgPicture.string(
                      _svg_ef5t8e,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 14.4, end: 54.6),
            Pin(size: 14.4, middle: 0.6666),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    border:
                        Border.all(width: 1.4, color: const Color(0xffb3b3b3)),
                  ),
                ),
                Align(
                  alignment: Alignment(0.25, 0.0),
                  child: SizedBox(
                    width: 3.0,
                    height: 6.0,
                    child: SvgPicture.string(
                      _svg_hegh5b,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 0.075),
                  child: SizedBox(
                    width: 6.0,
                    height: 1.0,
                    child: SvgPicture.string(
                      _svg_ef5t8e,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 14.4, end: 54.6),
            Pin(size: 14.4, middle: 0.7556),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    border:
                        Border.all(width: 1.4, color: const Color(0xffb3b3b3)),
                  ),
                ),
                Align(
                  alignment: Alignment(0.25, 0.0),
                  child: SizedBox(
                    width: 3.0,
                    height: 6.0,
                    child: SvgPicture.string(
                      _svg_hegh5b,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 0.075),
                  child: SizedBox(
                    width: 6.0,
                    height: 1.0,
                    child: SvgPicture.string(
                      _svg_ef5t8e,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 14.4, end: 54.6),
            Pin(size: 14.4, end: 106.6),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    border:
                        Border.all(width: 1.4, color: const Color(0xffb3b3b3)),
                  ),
                ),
                Align(
                  alignment: Alignment(0.25, 0.0),
                  child: SizedBox(
                    width: 3.0,
                    height: 6.0,
                    child: SvgPicture.string(
                      _svg_hegh5b,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 0.075),
                  child: SizedBox(
                    width: 6.0,
                    height: 1.0,
                    child: SvgPicture.string(
                      _svg_ef5t8e,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 104.0, middle: 0.5055),
            Pin(size: 17.0, end: 35.0),
            child: Text(
              'App Version 2.2.5',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: const Color(0xff818181),
                letterSpacing: 0.14400000000000002,
                height: 5,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 9.0, end: 9.0),
            Pin(size: 17.0, start: 6.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(1.0, 0.111),
                  child: SizedBox(
                    width: 17.0,
                    height: 8.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(1.0),
                          ),
                          // margin: EdgeInsets.fromLTRB(0.0, 0.0, 1.0, 0.0),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 5.0,
                            height: 4.0,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 30.0, middle: 0.5015),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '10:48',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.14400000000000002,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 30.0, end: 25.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '100%',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.14400000000000002,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment(-1.0, 0.091),
                  child: SizedBox(
                    width: 41.0,
                    height: 6.0,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(size: 6.0, start: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 6.0, middle: 0.25),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 6.0, middle: 0.5),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 6.0, middle: 0.75),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 6.0, end: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 14.4, start: 50.2),
                  Pin(size: 10.9, middle: 0.4888),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 3.0,
                          height: 3.0,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 2.6, end: 2.4),
                        Pin(size: 4.0, middle: 0.51),
                        child: SvgPicture.string(
                          _svg_hs76,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(size: 4.9, start: 0.0),
                        child: SvgPicture.string(
                          _svg_xc3,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
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
    );
  }
}

const String _svg_hegh5b =
    '<svg viewBox="9.2 6.3 2.9 5.7" ><path transform="translate(-2.82, -1.69)" d="M 12 13.74400615692139 L 14.87200355529785 10.87200260162354 L 12 8" fill="none" stroke="#b3b3b3" stroke-width="1.399999976158142" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_ef5t8e =
    '<svg viewBox="6.3 9.2 5.7 1.0" ><path transform="translate(6.31, 9.18)" d="M 0 0 L 5.744006156921387 0" fill="none" stroke="#b3b3b3" stroke-width="1.399999976158142" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_hs76 =
    '<svg viewBox="2.6 3.5 9.4 4.0" ><path transform="translate(-1.14, -4.1)" d="M 12.42067813873291 9.217583656311035 C 12.39565658569336 9.191865921020508 12.36924362182617 9.168929100036621 12.34352588653564 9.145296096801758 L 12.26776313781738 9.073704719543457 C 12.25525283813477 9.060498237609863 12.24135112762451 9.05076789855957 12.22536468505859 9.038256645202637 C 10.04493522644043 7.05731201171875 6.707911491394043 7.135854721069336 4.626876831054688 9.216889381408691 L 4.382908344268799 9.461553573608398 L 4.045104503631592 9.799355506896973 C 3.633624076843262 10.21083641052246 3.635709285736084 10.88157749176025 4.047884941101074 11.29375267028809 C 4.460755348205566 11.70731830596924 5.131496429443359 11.7080135345459 5.542282104492188 11.29653263092041 L 6.124749183654785 10.71406555175781 C 7.448159694671631 9.391350746154785 9.600786209106445 9.391350746154785 10.92350101470947 10.71337032318115 L 11.34401702880859 11.120680809021 C 11.75132751464844 11.52799129486084 12.41581249237061 11.52729511260986 12.82520866394043 11.11720561981201 C 13.02330303192139 10.9198055267334 13.13242816925049 10.65637493133545 13.13312435150146 10.37626266479492 C 13.13381862640381 10.0975399017334 13.02608394622803 9.834109306335449 12.82798957824707 9.637405395507812 L 12.42067813873291 9.217583656311035 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xc3 =
    '<svg viewBox="0.0 0.0 14.4 4.9" ><path transform="translate(0.0, -2.57)" d="M 14.15363788604736 5.598204612731934 L 13.80332374572754 5.247890472412109 C 13.8019323348999 5.246500015258789 13.80123805999756 5.244415283203125 13.79845809936523 5.243720054626465 L 13.52182006835938 4.965692520141602 C 13.47316551208496 4.917733192443848 13.4203405380249 4.876029014587402 13.3647346496582 4.839884757995605 C 9.810850143432617 1.719724178314209 4.405303478240967 1.815643548965454 0.9647149443626404 5.125557899475098 C 0.9480329155921936 5.140850067138672 0.929266095161438 5.151275634765625 0.9125844240188599 5.167957305908203 L 0.2800722122192383 5.801164627075195 C -0.09526471048593521 6.175806045532227 -0.09317948669195175 6.785381317138672 0.2842426300048828 7.162802696228027 C 0.6609696745872498 7.539530754089355 1.270544648170471 7.54231071472168 1.645881652832031 7.166278839111328 L 2.278393983840942 6.53446102142334 C 2.282564401626587 6.528900146484375 2.286039590835571 6.52403450012207 2.290210008621216 6.520559310913086 C 5.072568893432617 3.832730770111084 9.486252784729004 3.816049337387085 12.29085254669189 6.465648651123047 L 12.7885217666626 6.964012145996094 C 13.16316318511963 7.338654518127441 13.77412796020508 7.337264060974121 14.15085506439209 6.960536956787109 C 14.52688884735107 6.58311653137207 14.52827930450439 5.972846984863281 14.15363788604736 5.598204612731934 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
