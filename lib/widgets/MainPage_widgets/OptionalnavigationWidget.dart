import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/FontStyle.dart';

class OptionalnavigationWidget extends StatefulWidget {
  String label;
  Color color;
  Icon icon;
  Function() onTap;

  OptionalnavigationWidget({
    required this.label,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  @override
  State<OptionalnavigationWidget> createState() => _OptionalnavigationWidgetState();
}

class _OptionalnavigationWidgetState extends State<OptionalnavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.icon,
          const SizedBox(height: 10,),
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
