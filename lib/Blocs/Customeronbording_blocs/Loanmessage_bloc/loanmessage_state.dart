part of 'loanmessage_bloc.dart';

@immutable
abstract class LoanmessageState {}

class LoanmessageInitial extends LoanmessageState {}
class LoanmessageblocLoading extends LoanmessageState{}
class LoanmessageblocLoaded extends LoanmessageState{
  final LoanMessageModel loanMessageModel;
  LoanmessageblocLoaded({required this.loanMessageModel});
}
class LoanmessageblocError extends LoanmessageState{
  final String Errormessage;
  LoanmessageblocError({required this.Errormessage});
}
