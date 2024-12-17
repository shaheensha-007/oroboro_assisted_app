part of 'loan_eligable_bloc.dart';

@immutable
abstract class LoanEligableEvent {}
class FetchLoanEligable extends LoanEligableEvent{
  final String userid;
  final String Customercode;
  final String partnercode;
  final String agentcode;
  final BuildContext ctx;
  FetchLoanEligable({
    required this.userid,
    required this.Customercode,
    required this.partnercode,
    required this.agentcode,
    required this.ctx
});
}
