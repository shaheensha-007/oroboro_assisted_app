part of 'bankupdate_bloc.dart';

@immutable
abstract class BankupdateEvent {}
class FetchBankupdate extends BankupdateEvent{
  final String userId;
  final String Customercode;
  final String Accountnumber;
  final String Accounttype;
  final String ifsccode;
  final BuildContext ctx;
  FetchBankupdate({
    required this.userId,
    required this.Customercode,
    required this.Accountnumber,
    required this.Accounttype,
    required this.ifsccode,
    required this.ctx
});
}
