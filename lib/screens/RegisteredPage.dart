import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisteredPage extends StatefulWidget {
  const RegisteredPage({Key? key}) : super(key: key);

  @override
  State<RegisteredPage> createState() => _RegisteredPageState();
}

class _RegisteredPageState extends State<RegisteredPage> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Resgistered', style: GoogleFonts.roboto(color: Colors.white)),
          backgroundColor: Color(0xff293462),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('your name have been registered '),
              Text('nama'),
              Text('npm'),
            ],
          ),
        ),
      );
  }
}
