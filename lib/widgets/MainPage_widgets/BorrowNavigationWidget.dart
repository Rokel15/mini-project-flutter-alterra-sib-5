import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/FontStyle.dart';

class BorrowNavigationWidget extends StatefulWidget {
  String label;
  Color color;
  Function() onTap;

  BorrowNavigationWidget({
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  State<BorrowNavigationWidget> createState() => _BorrowNavigationWidgetState();
}

class _BorrowNavigationWidgetState extends State<BorrowNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.purple[800],
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.edit, size: 30, color: Colors.white),
          SizedBox(height: 10,),
          GestureDetector(
            child: Row(
              children:[
                Text(widget.label, style: GoogleFonts.roboto(textStyle: white_s18w600),),
                const SizedBox(width: 8,),
                const Icon(Icons.arrow_circle_right, size: 25, color: Colors.white,)
              ],
            ),
            onTap: widget.onTap,
          ),
        ],
      ),
    );
  }
}