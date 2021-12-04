import 'package:bloc/bloc.dart';
import 'package:my_government/ui/pages/main/bloc/main_event.dart';
import 'package:my_government/ui/pages/main/bloc/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitalState());
}
