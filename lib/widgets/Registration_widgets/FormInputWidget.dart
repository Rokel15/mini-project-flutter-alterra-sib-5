import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/FontStyle.dart';

class FormInputWidget extends StatelessWidget {
  String label;
  TextEditingController textEditingController = TextEditingController();
  String hintText;
  bool inputNumberOnly;

  FormInputWidget({
    required this.label,
    required this.textEditingController,
    required this.hintText,
    required this.inputNumberOnly
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.roboto(textStyle: s18w600),),
        TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.roboto(textStyle: s16w600),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(18))
          ),
          keyboardType: inputNumberOnly==false? TextInputType.text : TextInputType.number,
          inputFormatters: inputNumberOnly == true ?
          <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))] :
          <TextInputFormatter>[],
        ),
      ],
    );
  }
}