import 'package:equatable/equatable.dart';
import 'package:my_government/models/organisation.dart';

abstract class MainState extends Equatable {}

class MainInitalState extends MainState {
  @override
  List<Object?> get props => [];
}

// STATE -------------- PAGES STATE ------------
abstract class PagesState extends MainState {
  int get index;
}

class OrganisationsPageState extends PagesState {
  final List<Organisation> mainOrganisations;
  final List<Organisation> bestRatingOrganisations;

  OrganisationsPageState({
    required this.mainOrganisations,
    required this.bestRatingOrganisations,
  });

  @override
  List<Object?> get props => [
        mainOrganisations,
        bestRatingOrganisations,
      ];

  @override
  int get index => 0;
}

class NewsPageState extends PagesState {
  @override
  List<Object?> get props => [];

  @override
  int get index => 1;
}

// class LeadersPageState extends PagesState {
//   @override
//   List<Object?> get props => [];
//
//   @override
//   int get index => 2;
// }

class SavedMessagesPageState extends PagesState {
  final List<Organisation> organisations;

  SavedMessagesPageState(this.organisations);

  @override
  List<Object?> get props => [];

  @override
  int get index => 2;
}

class AccountPageState extends PagesState {
  @override
  List<Object?> get props => [];

  @override
  int get index => 3;
}
// END -------------- PAGES STATE ------------

// STATE -------------- MESSAGES STATE ------------
class MessagesPageState extends MainState {
  final String message;

  MessagesPageState(this.message);

  @override
  List<Object?> get props => [];
}
// END -------------- MESSAGES STATE ------------
