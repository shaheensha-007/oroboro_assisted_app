part of 'loanbooking_bloc.dart';

@immutable
abstract class LoanbookingEvent {}
class FetchLoanbooking extends LoanbookingEvent{
  final String userid;
  final String Customercode;
  final String ApplicationId;
  final String partnercode;
  final String agentcode;
  final String ProductId;
  final String Tenure;
  final String EmiAmount;
  final String Frequency;
  final String Loanamout;
  final BuildContext ctx;
  FetchLoanbooking({
    required this.userid,
    required this.Customercode,
    required this.ApplicationId,
    required this .partnercode,
    required this.agentcode,
    required this.ProductId,
    required this.Tenure,
    required this.EmiAmount,
    required this.Frequency,
    required this.Loanamout,
    required this.ctx,
});
}
