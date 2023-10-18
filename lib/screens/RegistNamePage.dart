import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_flutter_alterra_sib_5/data/FontStyle.dart';
import 'package:mini_project_flutter_alterra_sib_5/widgets/RegistNamePage_widgets/FormInput.dart';

class RegistNamePage extends StatefulWidget {
  const RegistNamePage({Key? key}) : super(key: key);

  @override
  State<RegistNamePage> createState() => _RegistNamePageState();
}

class _RegistNamePageState extends State<RegistNamePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController npmController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    npmController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration', style: GoogleFonts.roboto(color: Colors.white)),
        backgroundColor: Color(0xff293462),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [

          //input nama
          Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            width: double.infinity,
            child: FormInput(
              label: "Nama : ",
              textEditingController: nameController,
              hintText: 'input nama',
            ),
          ),

          //input npm
          Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
            width: double.infinity,
            child: FormInput(
              label: "NPM : ",
              textEditingController: npmController,
              hintText: 'input NPM',
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              child: Text('Regist', style: GoogleFonts.roboto(textStyle: white_s16w600),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[900],),
              onPressed: (){},
            ),
          ),

        ],
      ),
    );
  }
}
