import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/Message.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Services/dbServices.dart';
import 'package:get/get.dart';


class ContatacsXController extends GetxController {
  @override
  void onInit() {
    getAllUsers();
    // log(idni)
    super.onInit();
  }
  var nbrMsg = -1.obs;
  var listAllContacts = [].obs;
  var listUserEx = <UserM>[].obs;
  var listMessages = <Messages>[].obs;


  Future<List<dynamic>> getAllUsers() async {
    dbServices().getContactsCollection().snapshots().listen((event) {
      dbServices().getContactsRecup().then((querySnapshot) async {
        nbrMsg=querySnapshot.docs.length;
        listAllContacts.clear();
        listUserEx.clear();
        late String id;
        for (var docs in querySnapshot.docs) {
          for (var el in docs.data()["idEx"]) {
            if (el != AppData.Uid) {
              id = el;
            }
          }
          await dbServices().getUserM(id).then((usr) {
            listUserEx.add(usr);
          });
          listAllContacts.add(docs.data());
          // UserM us = UserM.fromFirestor(docs);
          // if (!ListAllUsers.contains(us)) {
          //   ListAllUsers.add(us);
          // }
          // UserM sup = docs.data() as UserM;
        }
      });
    });
    return listAllContacts;
  }
}
