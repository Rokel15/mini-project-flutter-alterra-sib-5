import 'package:flutter/material.dart';
import 'package:mini_project_flutter_alterra_sib_5/data/FontStyle.dart';
import 'package:mini_project_flutter_alterra_sib_5/data/SOP%20Peminjaman%20barang.dart';
import 'package:google_fonts/google_fonts.dart';

class Head extends StatefulWidget {
  const Head({Key? key}) : super(key: key);

  @override
  State<Head> createState() => _HeadState();
}

class _HeadState extends State<Head> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 15), width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.black)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('sop peminjaman barang : ', style: GoogleFonts.roboto(textStyle: s18w600),),
            Text(SOP().no1, style: GoogleFonts.roboto(textStyle: s16w600),),
            Text(SOP().no2, style: GoogleFonts.roboto(textStyle: s16w600),),
            Text(SOP().no3, style: GoogleFonts.roboto(textStyle: s16w600),),
          ],
        ),
      ),
    );
  }
}
