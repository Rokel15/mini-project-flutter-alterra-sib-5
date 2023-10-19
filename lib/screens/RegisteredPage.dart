import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'MainPage.dart';

class RegisteredPage extends StatefulWidget {
  const RegisteredPage({Key? key}) : super(key: key);

  @override
  State<RegisteredPage> createState() => _RegisteredPageState();
}

class _RegisteredPageState extends State<RegisteredPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Resgistered', style: GoogleFonts.roboto(color: Colors.white)),
          backgroundColor: const Color(0xff293462),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              );
            },),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('your name have been registered '),
              Text('nama'),
              Text('npm'),
              ElevatedButton(
                  child: Text('Unregister'),
                  onPressed: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  }
              )
            ],
          ),
        ),
      ),
      onWillPop: () async{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
        return false;
        },
    );
  }
}
