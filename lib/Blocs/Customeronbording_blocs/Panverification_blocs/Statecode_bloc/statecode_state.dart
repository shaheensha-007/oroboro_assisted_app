part of 'statecode_bloc.dart';

@immutable
abstract class StatecodeState {}

class StatecodeInitial extends StatecodeState {}
class StatecodeblocLoading extends StatecodeState{}
class StatecodeblocLoaded extends StatecodeState{
  final StatecodeModel  statecodeModelstatus;
  StatecodeblocLoaded({required this.statecodeModelstatus});
}
class StatecodeblocError extends StatecodeState{}