import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_flutter_alterra_sib_5/bloc/miniproject_bloc.dart';
import 'package:mini_project_flutter_alterra_sib_5/screens/AllRecordsPage.dart';
import 'package:mini_project_flutter_alterra_sib_5/screens/AvailableItemsPage.dart';
import 'package:mini_project_flutter_alterra_sib_5/screens/BorrowItemsPage.dart';
import 'package:mini_project_flutter_alterra_sib_5/screens/RegistNamePage.dart';
import 'package:mini_project_flutter_alterra_sib_5/screens/SplashScreen.dart';
import 'package:mini_project_flutter_alterra_sib_5/widgets/MainPage_widgets/AllRecordsNavigationWidget.dart';
import 'package:mini_project_flutter_alterra_sib_5/widgets/MainPage_widgets/MyNote.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/MainPage_widgets/AvailableItemsNavigationWidget.dart';
import '../widgets/MainPage_widgets/BorrowNavigationWidget.dart';
import '../widgets/MainPage_widgets/head.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late SharedPreferences data;

  // bool? user;
  String? name;
  String? npm;

  void initial() async {
    data = await SharedPreferences.getInstance();
    setState(() {
      name = data.getString('name').toString();
      npm = data.getString('npm').toString();
    });
  }

  @override
  void initState() {
    initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MiniprojectBloc, MiniprojectState>(
      builder: (context, state) {
        if (state is AppLoading) {
          return const Center(child: SplashScreen());
        } else if (state is AppLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Peminjaman Fasilitas Lab ACSL',
                style: GoogleFonts.roboto(color: Colors.white),
              ),
              backgroundColor: const Color(0xff293462),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.person_2,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RegistNamePage();
                    }));
                  },
                )
              ],
            ),
            body: Material(
              color: const Color(0xff3C486B),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: ListView(
                  children: [
                    Head(),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 2)),
                      child: Column(
                        children: [
                          AvailableItemsNavigationWidget(
                            label: 'Barang Tersedia',
                            color: const Color(0xff3F497F),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return AvailableItemsPage();
                                }),
                              );
                            },
                          ),
                          const SizedBox(height: 15),
                          BorrowNavigationWidget(
                            label: 'Pinjam Barang',
                            color: Colors.purple.shade800,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const BorrowItemsPage();
                                }),
                              );
                            },
                          ),
                          const SizedBox(height: 15),
                          AllRecordsNavigationWidget(
                            label: 'All Records',
                            color: Color(0xff545B77),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const AllRecordsPage();
                                }),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const MyNote(),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}