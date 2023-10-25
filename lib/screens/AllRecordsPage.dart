import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllRecordsPage extends StatefulWidget {
  const AllRecordsPage({Key? key}) : super(key: key);

  @override
  State<AllRecordsPage> createState() => _AllRecordsPageState();
}

class _AllRecordsPageState extends State<AllRecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Records', style: GoogleFonts.roboto(color: Colors.white),),
        backgroundColor: Color(0xff293462),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(),
    );
  }
}
