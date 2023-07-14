import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController legende = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Nous contactez"),
        backgroundColor: AppData.BasicColor,
      ),
      body: Container(
        height: h,
        width: w,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Votre adresse email servira pour envoyer le mail",
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(8),
                width: w,
                height: h / 5,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                  keyboardType: TextInputType.multiline,
                  controller: legende,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Ecrivez nous",
                    hintStyle: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: h * .08),
              ElevatedButton(
                onPressed: ()
                    // BasicsWidgets.Load(context);
                    async {
                  final Uri _emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'ndjadim@gmail.com',
                      queryParameters: {
                        'subject': 'Contact via l\'application mobile',
                        'body': legende.text
                      });

                  // String url = _emailLaunchUri.toString();

                  if (await canLaunchUrl(_emailLaunchUri)) {
                    await launchUrl(_emailLaunchUri);
                  } else {
                    // throw 'Could not launch $url';
                  }

                  // Timer(
                  //   Duration(seconds: 3),
                  //   () {
                  //     Navigator.pop(context);
                  //     Toast.show("Message envoyer");
                  //     Navigator.pop(context);
                  //   },
                  // );
                },
                child: Text("Envoyer"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppData.BasicColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
