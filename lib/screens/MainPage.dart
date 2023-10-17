import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_flutter_alterra_sib_5/widgets/MainPage_widget/AvailableItems.dart';
import 'package:mini_project_flutter_alterra_sib_5/widgets/MainPage_widget/BorrowNavigationWidget.dart';

import '../widgets/MainPage_widget/head.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peminjaman Fasilitas Lab ACSL', style: GoogleFonts.roboto(color: Colors.white),),
        backgroundColor: Color(0xff293462),
        actions: [
          IconButton(icon: Icon(Icons.person_2, color: Colors.white,), onPressed: (){},)
        ],
      ),
      body: Material(
        color: Color(0xff3C486B),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white
          ),
          child: ListView(children: [
            Head(),
            AvailableItems(),
            BorrowNavigationWidget()
          ],),
        ),
      ),
    );
  }
}
