part of 'loanmessage_bloc.dart';

@immutable
abstract class LoanmessageEvent {}
class Fetchloanmessage extends LoanmessageEvent{
  final  String LoanId;
  final BuildContext ctx;
  Fetchloanmessage({
   required this.LoanId,
   required this.ctx
});
}
