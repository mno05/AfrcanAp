import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MiscChat01 extends StatelessWidget {
  MiscChat01({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff221e22),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 50.0, start: 21.0),
            Pin(size: 50.0, middle: 0.3031),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.cover,
                ),
                borderRadius:BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 2.0, color: const Color(0xff313131)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 50.0, start: 21.0),
            Pin(size: 50.0, middle: 0.748),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 2.0, color: const Color(0xff313131)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 50.0, start: 21.0),
            Pin(size: 50.0, middle: 0.4016),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 2.0, color: const Color(0xff313131)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 50.0, start: 21.0),
            Pin(size: 50.0, end: 117.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 2.0, color: const Color(0xff313131)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 50.0, start: 21.0),
            Pin(size: 50.0, middle: 0.5),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 2.0, color: const Color(0xff313131)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 50.0, start: 21.0),
            Pin(size: 50.0, end: 42.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 2.0, color: const Color(0xff313131)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 50.0, start: 21.0),
            Pin(size: 50.0, middle: 0.5984),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 2.0, color: const Color(0xff313131)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.389),
            child: SizedBox(
              width: 203.0,
              height: 40.0,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 94.0,
                      height: 20.0,
                      child: Text(
                        'Janet McCoy',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: const Color(0xffffffff),
                          letterSpacing: 0.14,
                          fontWeight: FontWeight.w500,
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 17.0, end: 0.0),
                    child: Text(
                      'Hello, this is Janet McCoy. I want ...',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: const Color(0xff828282),
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.185, 0.49),
            child: SizedBox(
              width: 164.0,
              height: 40.0,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 115.0,
                      height: 20.0,
                      child: Text(
                        'Janice Reynolds',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: const Color(0xffffffff),
                          letterSpacing: 0.14,
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 17.0, end: 0.0),
                    child: Text(
                      'Hello, this is Janet McCoy. ...',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: const Color(0xff888888),
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.309, -0.194),
            child: SizedBox(
              width: 126.0,
              height: 40.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 20.0, start: 0.0),
                    child: Text(
                      'Anthony Hoffman',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: const Color(0xffffffff),
                        letterSpacing: 0.14,
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: false,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: 92.0,
                      height: 17.0,
                      child: Text(
                        'Good Morning!!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: const Color(0xff828282),
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 92.0, middle: 0.3039),
            Pin(size: 40.0, end: 122.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 20.0, start: 0.0),
                  child: Text(
                    'Jessica Willis',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.14,
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 17.0, end: 0.0),
                  child: Text(
                    'Good Morning!!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: const Color(0xff828282),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(-0.386, 0.0),
            child: SizedBox(
              width: 95.0,
              height: 40.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 20.0, start: 0.0),
                    child: Text(
                      'Aaron Gilbert',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: const Color(0xffffffff),
                        letterSpacing: 0.14,
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: false,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: 70.0,
                      height: 17.0,
                      child: Text(
                        'Hello there?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: const Color(0xff828282),
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 114.0, middle: 0.3295),
            Pin(size: 40.0, end: 47.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 20.0, start: 0.0),
                  child: Text(
                    'Jonathan Wade',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.14,
                    ),
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: 70.0,
                    height: 17.0,
                    child: Text(
                      'Hello there?',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: const Color(0xff828282),
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(-0.386, 0.194),
            child: SizedBox(
              width: 95.0,
              height: 40.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 20.0, start: 0.0),
                    child: Text(
                      'Aaron Gilbert',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: const Color(0xffffffff),
                        letterSpacing: 0.14,
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: false,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: 75.0,
                      height: 17.0,
                      child: Text(
                        'Thanks Alex..',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: const Color(0xff828282),
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 22.0, end: 21.0),
            Pin(size: 22.0, middle: 0.3278),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff1654e5),
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 8.0, middle: 0.5),
                  Pin(start: 2.0, end: 1.0),
                  child: Text(
                    '5',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.156,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 22.0, end: 21.0),
            Pin(size: 22.0, middle: 0.4228),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff1654e5),
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 8.0, middle: 0.5),
                  Pin(start: 2.0, end: 1.0),
                  child: Text(
                    '2',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.156,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 22.0, end: 21.0),
            Pin(size: 22.0, middle: 0.6127),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff1654e5),
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 8.0, middle: 0.5),
                  Pin(start: 2.0, end: 1.0),
                  child: Text(
                    '9',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.156,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 22.0, end: 21.0),
            Pin(size: 22.0, middle: 0.5177),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff1654e5),
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 8.0, middle: 0.5),
                  Pin(start: 2.0, end: 1.0),
                  child: Text(
                    '8',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.156,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 57.0),
            Pin(size: 12.0, middle: 0.3363),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff49ff3d),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 2.0, color: const Color(0xff221e22)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 57.0),
            Pin(size: 12.0, middle: 0.76),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff49ff3d),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 2.0, color: const Color(0xff221e22)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 57.0),
            Pin(size: 12.0, middle: 0.5238),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff49ff3d),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 2.0, color: const Color(0xff221e22)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 57.0),
            Pin(size: 12.0, end: 42.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff49ff3d),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 2.0, color: const Color(0xff221e22)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 57.0),
            Pin(size: 12.0, middle: 0.6175),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff49ff3d),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 2.0, color: const Color(0xff221e22)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 56.0, end: 21.0),
            Pin(size: 12.0, middle: 0.295),
            child: Text(
              '28 mins ago',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 9,
                color: const Color(0xff6d6d6d),
              ),
              textAlign: TextAlign.right,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 55.0, end: 21.0),
            Pin(size: 12.0, middle: 0.7188),
            child: Text(
              '20 days ago',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 9,
                color: const Color(0xff6d6d6d),
              ),
              textAlign: TextAlign.right,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 56.0, end: 21.0),
            Pin(size: 12.0, end: 150.0),
            child: Text(
              '24 days ago',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 9,
                color: const Color(0xff6d6d6d),
              ),
              textAlign: TextAlign.right,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 46.0, end: 21.0),
            Pin(size: 12.0, end: 75.0),
            child: Text(
              '1 year ago',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 9,
                color: const Color(0xff6d6d6d),
              ),
              textAlign: TextAlign.right,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 42.0, end: 21.0),
            Pin(size: 12.0, middle: 0.3888),
            child: Text(
              '2 hrs ago',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 9,
                color: const Color(0xff6d6d6d),
              ),
              textAlign: TextAlign.right,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 43.0, end: 21.0),
            Pin(size: 12.0, middle: 0.4825),
            child: Text(
              '1 day ago',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 9,
                color: const Color(0xff6d6d6d),
              ),
              textAlign: TextAlign.right,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 43.0, end: 21.0),
            Pin(size: 12.0, middle: 0.5763),
            child: Text(
              '1 day ago',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 9,
                color: const Color(0xff6d6d6d),
              ),
              textAlign: TextAlign.right,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 109.0, start: 21.0),
            Pin(size: 16.0, middle: 0.2399),
            child: Text(
              'unread messages',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 11,
                color: const Color(0xff606060),
                letterSpacing: 0.32999999999999996,
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 92.0, start: 21.0),
            Pin(size: 16.0, middle: 0.6658),
            child: Text(
              'read messages',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 11,
                color: const Color(0xff606060),
                letterSpacing: 0.32999999999999996,
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 166.0, start: 0.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff2a2a2a),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),
                ),
                Container(),
                Align(
                  alignment: Alignment(0.003, -0.31),
                  child: SizedBox(
                    width: 68.0,
                    height: 21.0,
                    child: Text(
                      'All Chats',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: const Color(0xffffffff),
                        letterSpacing: 0.18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 6.6, start: 20.0),
                  Pin(size: 12.8, middle: 0.3558),
                  child: SvgPicture.string(
                    _svg_z930p9,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 19.0, end: 21.0),
                  Pin(size: 42.0, middle: 0.7742),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff333333),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.359, -0.301),
                  child: SizedBox(
                    width: 32.0,
                    height: 20.0,
                    child: SvgPicture.string(
                      _svg_e0owfh,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.341, -0.302),
                  child: SizedBox(
                    width: 14.0,
                    height: 17.0,
                    child: Text(
                      '24',
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
                ),
                Pinned.fromPins(
                  Pin(size: 11.0, start: 35.0),
                  Pin(size: 11.0, middle: 0.7226),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 9.0,
                          height: 9.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            border: Border.all(
                                width: 1.85, color: const Color(0xff848484)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: 3.0,
                          height: 3.0,
                          child: SvgPicture.string(
                            _svg_xgc0j,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 123.0, start: 56.0),
                  Pin(size: 19.0, middle: 0.7347),
                  child: Text(
                    'Search for contact',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: const Color(0xff848484),
                      letterSpacing: 0.13,
                      fontWeight: FontWeight.w500,
                    ),
                    softWrap: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(326.7, 110.0, 36.8, 40.0),
                  child: SizedBox.expand(
                      child: SvgPicture.string(
                    _svg_epiuf7,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                ),
                Pinned.fromPins(
                  Pin(size: 2.0, end: 21.0),
                  Pin(size: 16.0, middle: 0.3533),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(size: 2.0, middle: 0.5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            border: Border.all(
                                width: 1.75, color: const Color(0xffffffff)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(size: 2.0, start: 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            border: Border.all(
                                width: 1.75, color: const Color(0xffffffff)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(size: 2.0, end: 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            border: Border.all(
                                width: 1.75, color: const Color(0xffffffff)),
                          ),
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

const String _svg_z930p9 =
    '<svg viewBox="20.0 54.5 6.6 12.8" ><path transform="translate(-2298.03, 8.3)" d="M 2324.674072265625 59.03472137451172 L 2318.02880859375 52.43400573730469 L 2324.674072265625 46.20000839233398" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_e0owfh =
    '<svg viewBox="233.0 51.0 32.0 20.0" ><path transform="translate(233.0, 51.0)" d="M 10 0 L 22 0 C 27.52284812927246 0 32 4.477152347564697 32 10 C 32 15.52284812927246 27.52284812927246 20 22 20 L 10 20 C 4.477152347564697 20 0 15.52284812927246 0 10 C 0 4.477152347564697 4.477152347564697 0 10 0 Z" fill="#1654e5" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xgc0j =
    '<svg viewBox="11.3 11.3 2.7 2.7" ><path transform="translate(11.34, 11.34)" d="M 2.658333301544189 2.658333301544189 L 0 0" fill="none" stroke="#848484" stroke-width="1.850000023841858" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_epiuf7 =
    '<svg viewBox="326.7 110.0 11.4 16.0" ><path transform="translate(326.74, 110.0)" d="M 7.7266526222229 16 L 3.694459676742554 16 C 3.471924781799316 16 3.290877342224121 15.82074356079102 3.290877342224121 15.60039615631104 L 3.290877342224121 14.80046939849854 C 3.290877342224121 14.57973098754883 3.471924781799316 14.40014362335205 3.694459676742554 14.40014362335205 L 4.871817588806152 14.40014362335205 L 4.871817588806152 12.78444766998291 C 2.834451913833618 12.5283317565918 1.025082230567932 11.3106164932251 0.03245837613940239 9.527854919433594 C -0.01082752179354429 9.42624568939209 -0.01081139408051968 9.309758186340332 0.03245837613940239 9.208173751831055 C 0.0643320232629776 9.101818084716797 0.140806183218956 9.014402389526367 0.2422340959310532 8.968409538269043 L 0.9760861992835999 8.632165908813477 C 1.029477715492249 8.607309341430664 1.086224317550659 8.59470272064209 1.144753336906433 8.59470272064209 C 1.290168881416321 8.59470272064209 1.423567056655884 8.673342704772949 1.492903470993042 8.799928665161133 C 2.350741863250732 10.29631233215332 3.962216138839722 11.22588634490967 5.698458194732666 11.22588634490967 C 5.715274333953857 11.22588634490967 5.731823921203613 11.22580814361572 5.748664855957031 11.2256326675415 C 7.505642414093018 11.20691871643066 9.116609573364258 10.2437915802002 9.952888488769531 8.71208667755127 C 10.01211071014404 8.60307788848877 10.1264123916626 8.535357475280762 10.25119686126709 8.535357475280762 C 10.30171680450439 8.535357475280762 10.35056591033936 8.546365737915039 10.39639568328857 8.568086624145508 L 11.24347972869873 8.959770202636719 C 11.32974720001221 8.997161865234375 11.39430999755859 9.070122718811035 11.42059421539307 9.159932136535645 C 11.44245147705078 9.25386905670166 11.41890048980713 9.350165367126465 11.35599040985107 9.424174308776855 L 11.35599040985107 9.488254547119141 C 10.36328601837158 11.27176284790039 8.554488182067871 12.4887638092041 6.517358779907227 12.7441291809082 L 6.517358779907227 14.40014362335205 L 7.7266526222229 14.40014362335205 C 7.949187278747559 14.40014362335205 8.130236625671387 14.57973098754883 8.130236625671387 14.80046939849854 L 8.130236625671387 15.60039615631104 C 8.130236625671387 15.82074356079102 7.949187278747559 16 7.7266526222229 16 Z M 5.710919380187988 9.599856376647949 C 3.931835412979126 9.599856376647949 2.484438180923462 8.164473533630371 2.484438180923462 6.400143623352051 L 2.484438180923462 3.199712038040161 C 2.484438180923462 1.43538224697113 3.931835412979126 0 5.710919380187988 0 C 7.489609718322754 0 8.936674118041992 1.43538224697113 8.936674118041992 3.199712038040161 L 8.936674118041992 6.400143623352051 C 8.936674118041992 8.164473533630371 7.489609718322754 9.599856376647949 5.710919380187988 9.599856376647949 Z" fill="#848484" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
