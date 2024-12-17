part of 'panverification_bloc.dart';

@immutable
abstract class PanverificationState {}

class PanverificationInitial extends PanverificationState {}
class PanverificationblocLoading extends PanverificationState{}
class PanverificationblocLoaded extends PanverificationState{
  final PanverificationModel panverificationModel;
  PanverificationblocLoaded({required this.panverificationModel});
}
class PanverificationblocError extends PanverificationState{
  final String Errormessage;
PanverificationblocError({required this.Errormessage});
}
