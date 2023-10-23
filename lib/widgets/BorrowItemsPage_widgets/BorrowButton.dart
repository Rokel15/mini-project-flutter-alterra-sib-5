import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/FontStyle.dart';
import '../../data/firebase_firestore.dart';

class BorrowButton extends StatefulWidget {
  String name;
  String npm;
  List barangList;
  BorrowButton({
    Key? key,
    required this.name,
    required this.npm,
    required this.barangList,
  }) : super(key: key);

  @override
  State<BorrowButton> createState() => _BorrowButtonState();
}

class _BorrowButtonState extends State<BorrowButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 15), width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff2B3467)
              ),
              child: Row(
                children: [
                  Text('pinjam', style: GoogleFonts.roboto(textStyle: white_s16w600),),
                  SizedBox(width: 8,),
                  Icon(Icons.edit, color: Colors.white,)
                ],
              ),
            ),
            onTap: (){
              if (widget.name != 'null' && widget.npm != 'null') {
                if (widget.barangList.isEmpty) {
                  SnackBar snackbarMessage = SnackBar(content: Text('tidak ada barang yang dipinjam'));
                  ScaffoldMessenger.of(context).showSnackBar(snackbarMessage);
                } else {
                  borrowedItems.add({
                    'nama': widget.name,
                    'npm': widget.npm,
                    'barang dipinjam': widget.barangList,
                  });
                  Navigator.pop(context);
                }
              } else {
                SnackBar snackbarMessage = SnackBar(content: Text('registrasi terlebih dahulu'));
                ScaffoldMessenger.of(context).showSnackBar(snackbarMessage);
              }
            },
          ),
        ],
      ),
    );
  }
}
