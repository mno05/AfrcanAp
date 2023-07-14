import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/GetXControllers/UserController.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/LocalApp/ContactPersonProfil.dart';
import 'package:african_ap/Vue/Widgets/BottomNavigation.dart';
import 'package:african_ap/Vue/Widgets/ChangePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:toast/toast.dart';

class Contacts extends StatefulWidget {
  final UserM superUser;
  const Contacts({
    super.key,
    required this.superUser,
  });

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  UserController uc = Get.put(UserController());
  List<UserM> superUsers = [];
  List<UserM> superUsersT = [];

  // final Stream<QuerySnapshot> _usersStream =
  //     FirebaseFirestore.instance.collection('users').snapshots();

  @override
  void initState() {
    // remplirUsers();
    super.initState();
    uc.GetAllUsers().then((listUsers) {
      setState(() {
        superUsers = listUsers;
      });
    });
  }

  TextEditingController tx = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    double h = Media.height(context);
    double w = Media.width(context);
    // log(superUsers.length.toString());

    // remplirUsers;
    // log(superUsers.length.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppData.BasicColor,
        toolbarHeight: h * 0.08,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(widget.superUser.imagePath!),
            radius: 10,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChearcheTF(),
            ),
            ActionContainer(
              Icons.message,
              tap: () {},
            )
          ],
        ),
        // actions: [],
      ),
      body: Obx(
        () => superUsers.length == 0
            ? Center(
                child: Container(
                  width: w * .3,
                  child: Lottie.asset("assets/Load.json"),
                ),
                // ):StreamBuilder(builder: builder,)
              )
            : ListView.builder(
                itemCount: superUsers.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(superUsers[index].imagePath!),
                        radius: 25,
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(
                        "${superUsers[index].prenom} ${superUsers[index].nom}",
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: w * .035,
                        ),
                      ),
                      subtitle: Text("${superUsers[index].domainesExpertise}"),
                      trailing: Text(
                        (superUsers[index].type.isNull)?
                        "Utilisateur simple":
                        "Membre ${superUsers[index].type != "Honneur" ? superUsers[index].type != "Effectif" ? superUsers[index].type != "Adherent" ? superUsers[index].type : "adhérent" : "effectif" : "d'honneur"}",
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: w * .03,
                        ),
                      ),
                      onTap: () {
                        ChangePage.SliderPush(
                            context: context,
                            push: ContactPersoView(
                              superUser: superUsers[index],
                              idEx: AppData.Uid,
                            ));
                      },
                    ),
                  ]);
                },
                // itemBuilder: (context, index) =>
              ),
      ),
      bottomNavigationBar: BottomNavigation(isSearch: true),
    );
  }

  Container Contact(
    double h,
    double w, {
    required String path,
    required String nom,
    required String prenom,
    required String domaine,
    required String type,
  }) {
    return Container(
      height: h * 0.08,
      width: w,
      padding: EdgeInsets.all((8)),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(path),
              radius: 18,
            ),
            title: Text(
              "$prenom $nom",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text("$domaine"),
            // trailing: Text(
            //   "Membre $type",
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ),
        ],
      ),
    );
  }

  Widget ChearcheTF() {
    return Container(
      height: Media.height(context) * 0.06,
      width: Media.width(context) / 1.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
          border: Border.all(
            color: Colors.black45,
            width: 0,
          )),
      child: Padding(
        padding: EdgeInsets.only(left: 3, top: 0),
        child: TextField(
          controller: tx,
          // onEditingComplete: () {
          //   BasicsWidgets.Load(context);
          //   setState(() {});
          // },

          onChanged: (value) {
            if (value.length != 0) {
              superUsersT = superUsers;
              superUsers = [];
              superUsers = superUsersT
                  .where((element) =>
                      element.nom
                          .toString()
                          .toLowerCase()
                          .contains(value.toLowerCase()) ||
                      element.prenom
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                  .toList();
              for (var element in superUsers) {
                if (element.nom.contains(value) ||
                    element.prenom.contains(value)) {}
              }
              setState(() {
                superUsers = superUsers;
              });
            } else {
              setState(() {
                superUsers = uc.ListAllUsers;
              });
            }
          },
          onTap: () {
            print("");
          },
          decoration: InputDecoration(
            icon: Icon(Icons.search),
            hintText: "Rechercher",
            hintStyle: TextStyle(
              fontSize: 16,
              // fontFamily: "Milky",
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget ActionContainer(IconData icon, {required void Function()? tap}) {
    return InkWell(
      onTap: tap,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white30,
          ),
          child: Icon(icon),
        ),
      ),
    );
  }
}
