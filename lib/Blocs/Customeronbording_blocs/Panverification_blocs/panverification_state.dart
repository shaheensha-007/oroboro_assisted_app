part of 'panverification_bloc.dart';

@immutable
abstract class PanverificationState {}

class PanverificationInitial extends PanverificationState {}
class PanverificationblocLoading extends PanverificationState{}
class PanverificationblocLoaded extends PanverificationState{}
class PanverificationblocError extends PanverificationState{}
