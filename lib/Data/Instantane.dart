import 'dart:convert';

import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:nb_utils/nb_utils.dart';

class Instantane {
  static UserM getUser(){
    log("This isssssssssssssssssssssss"+ getStringAsync(AppData.userPref));
    return UserM.fromJson(json.decode(getStringAsync(AppData.userPref)));
  }
}