part of 'loan_eligable_bloc.dart';

@immutable
abstract class LoanEligableState {}

class LoanEligableInitial extends LoanEligableState {}
class LoanEligableblocLoading extends LoanEligableState{}
class LoanEligableblocLoaded extends LoanEligableState{
  final LoanEligableModel loanEligableModel;
  LoanEligableblocLoaded({required this.loanEligableModel});
}
class LoanEligableblocError extends LoanEligableState{
  final String Errormessasge;
  LoanEligableblocError({required this.Errormessasge});
}