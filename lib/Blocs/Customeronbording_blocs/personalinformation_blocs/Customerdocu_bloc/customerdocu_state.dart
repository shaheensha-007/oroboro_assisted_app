part of 'customerdocu_bloc.dart';

@immutable
abstract class CustomerdocuState {}

class CustomerdocuInitial extends CustomerdocuState {}
class CustomerdocublocLoding extends CustomerdocuState{}
class CustomerdocublocLoaded extends CustomerdocuState{
  final CustomerdocuModel customerdocuModel;
  CustomerdocublocLoaded({required this.customerdocuModel});
}
class CustomerdocublocError extends CustomerdocuState{
  final String Errormessage;
  CustomerdocublocError({required this.Errormessage});
}
