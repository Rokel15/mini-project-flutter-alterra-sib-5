import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'miniproject_event.dart';
part 'miniproject_state.dart';

class MiniprojectBloc extends Bloc<MiniprojectEvent, MiniprojectState> {
  MiniprojectBloc() : super(MiniprojectInitial()) {
    on<OpenApp>((event, emit) async{
      emit(AppLoading());
      await Future.delayed(const Duration(seconds: 3));
      emit(AppLoaded());
    });
  }
}
