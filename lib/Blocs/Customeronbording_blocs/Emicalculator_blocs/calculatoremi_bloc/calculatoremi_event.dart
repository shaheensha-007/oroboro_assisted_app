part of 'calculatoremi_bloc.dart';

@immutable
abstract class CalculatoremiEvent {}
class Fetchcalculatoremi extends CalculatoremiEvent{
  final String userid;
  final String Customercode;
  final String ApplicationId;
  final String partnercode;
  final String agentcode;
  final String Loanamout;
  final String ProductId;
  final String Tenure;
  final String Frequency;
  final BuildContext ctx;
  Fetchcalculatoremi({
   required this.userid,
   required this.Customercode,
   required this.ApplicationId,
   required this.partnercode,
   required this.agentcode,
   required this.Loanamout,
   required this.ProductId,
   required this.Tenure,
   required this.Frequency,
    required this.ctx
});
}
