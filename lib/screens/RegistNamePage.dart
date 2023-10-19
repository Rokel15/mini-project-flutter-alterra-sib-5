import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_flutter_alterra_sib_5/data/FontStyle.dart';
import 'package:mini_project_flutter_alterra_sib_5/screens/RegisteredPage.dart';
import 'package:mini_project_flutter_alterra_sib_5/widgets/RegistNamePage_widgets/FormInputWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistNamePage extends StatefulWidget {
  const RegistNamePage({Key? key}) : super(key: key);

  @override
  State<RegistNamePage> createState() => _RegistNamePageState();
}

class _RegistNamePageState extends State<RegistNamePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController npmController = TextEditingController();
  late SharedPreferences data;
  late bool user;
  String? name;
  String? npm;

  @override
  void dispose() {
    nameController.dispose();
    npmController.dispose();
    super.dispose();
  }

  void checkData() async{
    data = await SharedPreferences.getInstance();
    user = data.getBool('regist') ?? true;

    if(user==false){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context){return RegisteredPage();}),
            (route) => false,);
    }
  }

  @override
  void initState() {
    checkData();
    super.initState();
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
            child: FormInputWidget(
              label: "Nama : ",
              textEditingController: nameController,
              hintText: 'input nama',
              inputNumberOnly: false,
            ),
          ),

          //input npm
          Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
            width: double.infinity,
            child: FormInputWidget(
              label: "NPM : ",
              textEditingController: npmController,
              hintText: 'input NPM',
              inputNumberOnly: true,
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              child: Text('Regist', style: GoogleFonts.roboto(textStyle: white_s16w600),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[900],),
              onPressed: (){
                if(nameController.text.isNotEmpty && npmController.text.isNotEmpty){
                  name = nameController.text;
                  npm = npmController.text;
                  data.setBool('regist', false);
                  data.setString('name', name!);
                  data.setString('npm', npm!);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context){return RegisteredPage();}),
                          (route) => false);
                } else if(nameController.text.isEmpty && npmController.text.isEmpty){
                  SnackBar snackbarMessage = SnackBar(content: Text('nama dan npm tidak boleh kosong'));
                  ScaffoldMessenger.of(context).showSnackBar(snackbarMessage);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}