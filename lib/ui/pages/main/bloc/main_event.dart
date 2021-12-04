import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {}

class GetPageEvent extends MainEvent {
  final int index;

  GetPageEvent(this.index);

  @override
  List<Object?> get props => [];
}
