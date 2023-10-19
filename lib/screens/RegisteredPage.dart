import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_flutter_alterra_sib_5/data/FontStyle.dart';
import 'package:mini_project_flutter_alterra_sib_5/widgets/RegisteredPage_widgets/ShowUsernameData.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MainPage.dart';

class RegisteredPage extends StatefulWidget {
  const RegisteredPage({Key? key}) : super(key: key);

  @override
  State<RegisteredPage> createState() => _RegisteredPageState();
}

class _RegisteredPageState extends State<RegisteredPage> {
  late SharedPreferences data;
  String? name;
  String? npm;

  void initial() async{
    data = await SharedPreferences.getInstance();
    setState(() {
      name = data.getString('name').toString();
      npm = data.getString('npm').toString();
    });
  }

  @override
  void initState() {
    initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Resgistered', style: GoogleFonts.roboto(color: Colors.white)),
          backgroundColor: const Color(0xff293462),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              );
            },),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowUsernameData(name: name!, npm: npm!),

              SizedBox(height: 10),

              ElevatedButton(
                  child: Text('Unregister', style: GoogleFonts.roboto(textStyle: white_s16w600),),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[900],),
                  onPressed: (){
                    data.setBool('regist', true);
                    data.remove('name');
                    data.remove('npm');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  }
              )
            ],
          ),
        ),
      ),
      onWillPop: () async{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
        return false;
        },
    );
  }
}
