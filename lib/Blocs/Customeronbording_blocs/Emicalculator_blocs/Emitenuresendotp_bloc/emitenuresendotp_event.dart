part of 'emitenuresendotp_bloc.dart';

@immutable
abstract class EmitenuresendotpEvent {}
class FetchEmitenuresendotp extends EmitenuresendotpEvent{
  final String userid;
  final String Customercode;
  final String mobilenumber;
  final String Loanamout;
  final String Tenure;
  final String Emi;
  final BuildContext ctx;
  FetchEmitenuresendotp({
    required this.userid,
    required this.Customercode,
    required this.mobilenumber,
    required this.Loanamout,
    required this.Tenure,
    required this.Emi,
    required this.ctx
});
}
