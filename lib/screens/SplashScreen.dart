import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_flutter_alterra_sib_5/data/FontStyle.dart';

import '../data/Images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(color: Colors.white,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Powered by : ', style: GoogleFonts.roboto(textStyle: s16w600),),
              SizedBox(height: 8),
              Image.asset(
                imgSplashScreen1,
                width: MediaQuery.of(context).size.width/1.8,
                height: MediaQuery.of(context).size.height/10,
              ),
              SizedBox(height: 5),
              Image.asset(
                imgSplashScreen2,
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/15,
              ),
            ],
          ),
      ),
    );
  }
}
