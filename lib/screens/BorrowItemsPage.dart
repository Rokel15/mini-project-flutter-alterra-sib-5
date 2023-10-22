import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_flutter_alterra_sib_5/data/FontStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BorrowItemsPage extends StatefulWidget {
  const BorrowItemsPage({Key? key}) : super(key: key);

  @override
  State<BorrowItemsPage> createState() => _BorrowItemsPageState();
}

class _BorrowItemsPageState extends State<BorrowItemsPage> {
  late SharedPreferences data;

  // bool? user;
  String? name;
  String? npm;

  void initial() async {
    data = await SharedPreferences.getInstance();
    setState(() {
      // user = data.getBool('regist') ?? true;
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pinjam Barang',
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        backgroundColor: Color(0xff293462),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            width: double.infinity,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('User : ', style: GoogleFonts.roboto(textStyle: s16w600)),
                    Container(
                      child: name!='null'?
                      Text(name!, style: GoogleFonts.roboto(textStyle: s16w600)) :
                      Text('registrasi terlebih dahulu', style: GoogleFonts.roboto(textStyle: warning_s16w600),),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Npm : ', style: GoogleFonts.roboto(textStyle: s16w600)),
                    Container(
                      child: npm!='null'?
                      Text(npm!, style: GoogleFonts.roboto(textStyle: s16w600)) :
                      Text('registrasi terlebih dahulu', style: GoogleFonts.roboto(textStyle: warning_s16w600),),
                    ),
                  ],
                ),
            ],),
          ),
        ],
      ),
    );
  }
}
