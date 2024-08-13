part of 'bankregstration_bloc.dart';

@immutable
abstract class BankregstrationEvent {}
class FetchBankregstration extends BankregstrationEvent{
  final String clientId;
  final String PAN;
  final String PartnerCode;
  final String OnboardingFor;
  final String AcoountNumber;
  final String IFSC;
  final String AccountType;
  final String BankName;
  final String BranchName;
  final String AccountHolderName;
  final BuildContext ctx;
  FetchBankregstration({
    required this.clientId,
    required this.PAN,
    required this.PartnerCode,
    required this.OnboardingFor,
    required this.AcoountNumber,
    required this.IFSC,
    required this.AccountType,
    required this.BankName,
    required this.BranchName,
    required this.AccountHolderName,
    required this.ctx
  });
}
