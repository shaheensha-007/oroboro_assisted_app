part of 'loan_view_bloc.dart';

@immutable
abstract class LoanViewState {}

class LoanViewInitial extends LoanViewState {}
class LoanViewblocLoading extends LoanViewState{}
class LoanViewblocLoaded extends LoanViewState{
  final LoanViewModel loanViewModel;
  LoanViewblocLoaded({required this.loanViewModel});
}
class LoanViewblocError extends LoanViewState{
  final String Errormessage;
  LoanViewblocError({required this.Errormessage});
}
