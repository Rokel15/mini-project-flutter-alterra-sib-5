import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mini_projext_event.dart';
part 'mini_projext_state.dart';

class MiniProjextBloc extends Bloc<MiniProjextEvent, MiniProjextState> {
  MiniProjextBloc() : super(MiniProjextInitial()) {
    on<MiniProjextEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
