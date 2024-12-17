part of 'emailupadate_bloc.dart';

@immutable
abstract class EmailupadateState {}

class EmailupadateInitial extends EmailupadateState {}
class EmailupadateblocLoading extends EmailupadateState{}
class EmailupadateblocLoaded extends EmailupadateState{
  final EmailupdateModel emailupdateModel;
  EmailupadateblocLoaded({required this.emailupdateModel});
}
class EmailupadateblocError extends EmailupadateState{
  final String errormessage;
  EmailupadateblocError({required this.errormessage});
}