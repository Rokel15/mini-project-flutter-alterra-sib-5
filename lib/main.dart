import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mini_project_flutter_alterra_sib_5/screens/MainPage.dart';
import 'package:mini_project_flutter_alterra_sib_5/screens/SplashScreen.dart';
import 'bloc/miniproject_bloc.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MiniprojectBloc()..add(OpenApp()),
      child: MaterialApp(
        title: 'mini project flutter alterra sib 5',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  const MainPage(),
      ),
    );

  }
}
