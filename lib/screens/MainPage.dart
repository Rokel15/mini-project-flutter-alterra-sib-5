import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_flutter_alterra_sib_5/bloc/miniproject_bloc.dart';
import 'package:mini_project_flutter_alterra_sib_5/screens/AllRecordsPage.dart';
import 'package:mini_project_flutter_alterra_sib_5/screens/AvailableItemsPage.dart';
import 'package:mini_project_flutter_alterra_sib_5/screens/BorrowItemsPage.dart';
import 'package:mini_project_flutter_alterra_sib_5/screens/RegistNamePage.dart';
import 'package:mini_project_flutter_alterra_sib_5/screens/SplashScreen.dart';
import 'package:mini_project_flutter_alterra_sib_5/widgets/MainPage_widgets/MyNote.dart';
import 'package:mini_project_flutter_alterra_sib_5/widgets/MainPage_widgets/OptionalnavigationWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
                      return const RegistNamePage();
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
                    const Head(),
                    const SizedBox(height: 25,),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Column(
                        children: [
                          //Barang Tersedia
                          OptionalnavigationWidget(
                            label: 'Barang Tersedia',
                            color: const Color(0xff3F497F),
                            icon : const Icon(Icons.business, size: 30, color: Colors.white),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const AvailableItemsPage();
                                }),
                              );
                            },
                          ),
                          const SizedBox(height: 15),
                          //Pinjam Barang
                          OptionalnavigationWidget(
                            label: 'Pinjam Barang',
                            color: Colors.purple.shade800,
                            icon: const Icon(Icons.edit, size: 30, color: Colors.white),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return BorrowItemsPage();
                                }),
                              );
                            },
                          ),
                          const SizedBox(height: 15),
                          //All Records
                          OptionalnavigationWidget(
                            label: 'All Records',
                            color: const Color(0xff545B77),
                            icon: const Icon(Icons.list_alt, size: 30, color: Colors.white),
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