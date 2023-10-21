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

  void initial() async{
    data = await SharedPreferences.getInstance();
    setState(() {
      // user = data.getBool('regist') ?? true;
      name = data.getString('name').toString();
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
        title: Text('Pinjam Barang', style: GoogleFonts.roboto(color: Colors.white),),
        backgroundColor: Color(0xff293462),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            child: Text('User : $name', style: GoogleFonts.roboto(textStyle: s16w600),),
          )
        ],
      ),
    );
  }
}
