part of 'emailupadate_bloc.dart';

@immutable
abstract class EmailupadateState {}

class EmailupadateInitial extends EmailupadateState {}
class EmailupadateblocLoading extends EmailupadateState{}
class EmailupadateblocLoaded extends EmailupadateState{}
class EmailupadateblocError extends EmailupadateState{}