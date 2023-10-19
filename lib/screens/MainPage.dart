import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_flutter_alterra_sib_5/bloc/miniproject_bloc.dart';
import 'package:mini_project_flutter_alterra_sib_5/data/FontStyle.dart';
import 'package:mini_project_flutter_alterra_sib_5/screens/RegistNamePage.dart';
import 'package:mini_project_flutter_alterra_sib_5/screens/SplashScreen.dart';

import '../widgets/MainPage_widgets/AvailableItems.dart';
import '../widgets/MainPage_widgets/BorrowNavigationWidget.dart';
import '../widgets/MainPage_widgets/head.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peminjaman Fasilitas Lab ACSL', style: GoogleFonts.roboto(color: Colors.white),),
        backgroundColor: Color(0xff293462),
        actions: [
          IconButton(
            icon: Icon(Icons.person_2, color: Colors.white,),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){return RegistNamePage();}));
            },
          )
        ],
      ),
      body: BlocBuilder<MiniprojectBloc, MiniprojectState>(
        builder: (context, state) {
          if(state is AppLoading){
            return Center(child: SplashScreen());
          } else if(state is AppLoaded){
            return Material(
              color: Color(0xff3C486B),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),),
                  color: Colors.white,
                ),
                child: ListView(children: [
                  Head(),

                  SizedBox(height: 25,),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 2)
                    ),
                    child: Column(
                      children: [
                        AvailableItems(),
                        SizedBox(height: 15),
                        BorrowNavigationWidget(),
                      ],
                    ),
                  ),

                  SizedBox(height: 25,),

                  Container(margin: EdgeInsets.symmetric(horizontal: 15), width: double.infinity,
                    child: Column(crossAxisAlignment : CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.list_alt, size: 30,),
                                SizedBox(width: 5,),
                                Text('Daftar Barang yang anda pinjam', style: GoogleFonts.roboto(textStyle: s18w600),),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5), width: double.infinity, height: 2.5,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],),
              ),
            );
          }
          return Container();
        },),
    );
  }
}
