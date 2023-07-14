import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Services/dbServices.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    GetAllUsers();
    // log(idni)
    super.onInit();
  }
  var ListAllUsers = <UserM>[].obs;

  Future<List<UserM>> GetAllUsers() async {

    dbServices().getCollection().snapshots().listen((event) { 
    dbServices().GetAllMembre().get().then((querySnapshot) {
      ListAllUsers.clear();
      for (var docs in querySnapshot.docs) {
        print(docs.data());
        UserM us = UserM.fromFirestor(docs);
        if (!ListAllUsers.contains(us)) {
          ListAllUsers.add(us);
        }
        // UserM sup = docs.data() as UserM;
      }
    });
    });
  return ListAllUsers;
  }
}
