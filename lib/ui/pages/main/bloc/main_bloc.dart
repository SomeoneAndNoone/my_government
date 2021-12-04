import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_government/ui/pages/main/bloc/main_event.dart';
import 'package:my_government/ui/pages/main/bloc/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(OrganisationsPageState()) {
    on<GetPageEvent>(
      (event, emit) async {
        print('new event: $event');
        switch (event.index) {
          case 0:
            emit(OrganisationsPageState());
            break;
          case 1:
            emit(NewsPageState());
            break;
          case 2:
            emit(LeadersPageState());
            break;
          case 3:
            emit(SavedMessagesPageState());
            break;
        }
      },
      transformer: restartable(),
    );
  }
}
