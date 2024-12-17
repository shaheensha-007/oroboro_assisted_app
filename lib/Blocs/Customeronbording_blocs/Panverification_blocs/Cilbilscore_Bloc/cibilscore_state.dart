part of 'cibilscore_bloc.dart';

@immutable
abstract class CibilscoreState {}

class CibilscoreInitial extends CibilscoreState {}
class CibilscoreblocLoading extends CibilscoreState{}
class CibilscoreblocLoaded extends CibilscoreState{
  final CibilscoreModel  cibilscoreModel;
  CibilscoreblocLoaded({required this.cibilscoreModel});
}
class CibilscoreblocError extends CibilscoreState{
  final String Errormessage;
  CibilscoreblocError({required this.Errormessage});
}
