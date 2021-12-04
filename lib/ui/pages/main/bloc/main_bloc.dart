import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_government/fake_data.dart';
import 'package:my_government/ui/pages/main/bloc/main_event.dart';
import 'package:my_government/ui/pages/main/bloc/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc()
      : super(
          OrganisationsPageState(
            mainOrganisations: [
              ...topOrganisationList,
              ...topOrganisationList,
              ...topOrganisationList
            ],
            bestRatingOrganisations: [
              ...engYaxshiOrganisations,
              ...engYaxshiOrganisations,
              ...engYaxshiOrganisations
            ],
          ),
        ) {
    on<GetPageEvent>(
      (event, emit) async {
        print('new event: $event');
        switch (event.index) {
          case 0:
            emit(
              OrganisationsPageState(
                mainOrganisations: [
                  ...topOrganisationList,
                  ...topOrganisationList,
                  ...topOrganisationList
                ],
                bestRatingOrganisations: [
                  ...engYaxshiOrganisations,
                  ...engYaxshiOrganisations,
                  ...engYaxshiOrganisations
                ],
              ),
            );
            break;
          case 1:
            emit(NewsPageState());
            break;
          case 2:
            emit(
              SavedMessagesPageState(
                [
                  ...topOrganisationList.where((e) => e.isLiked),
                  ...engYaxshiOrganisations.where((e) => e.isLiked),
                  ...topOrganisationList.where((e) => e.isLiked),
                  ...engYaxshiOrganisations.where((e) => e.isLiked),
                  ...engYaxshiOrganisations.where((e) => e.isLiked),
                ],
              ),
            );
            break;
          case 3:
            emit(AccountPageState());
            break;
        }
      },
      transformer: restartable(),
    );
  }
}
