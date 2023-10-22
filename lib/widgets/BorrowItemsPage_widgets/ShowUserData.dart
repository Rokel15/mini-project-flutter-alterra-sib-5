import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/FontStyle.dart';

class ShowDataUser extends StatefulWidget {
  String name;
  String npm;

  ShowDataUser({
    required this.name,
    required this.npm
  });

  @override
  State<ShowDataUser> createState() => _ShowDataUserState();
}

class _ShowDataUserState extends State<ShowDataUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('User : ', style: GoogleFonts.roboto(textStyle: s16w600)),
              Container(
                child: widget.name!='null'?
                Text(widget.name, style: GoogleFonts.roboto(textStyle: s16w600)) :
                Text('registrasi terlebih dahulu', style: GoogleFonts.roboto(textStyle: warning_s16w600),),
              ),
            ],
          ),
          Row(
            children: [
              Text('Npm : ', style: GoogleFonts.roboto(textStyle: s16w600)),
              Container(
                child: widget.npm!='null'?
                Text(widget.npm, style: GoogleFonts.roboto(textStyle: s16w600)) :
                Text('registrasi terlebih dahulu', style: GoogleFonts.roboto(textStyle: warning_s16w600),),
              ),
            ],
          ),
        ],),
    );
  }
}
