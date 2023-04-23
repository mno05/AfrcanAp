import 'package:shared_preferences/shared_preferences.dart';

class IsFirstUse {
  Future<SharedPreferences> intialseSh() async {
    return await SharedPreferences.getInstance();
  }

  setFirstUse() {
    intialseSh().then((sh) => sh.setBool("isFirst", true));
  }

  IsLog() {
    intialseSh().then((sh) => sh.setBool("isFirst", false));
  }
}
