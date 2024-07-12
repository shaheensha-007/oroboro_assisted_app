part of 'agentkyc_bloc.dart';

@immutable
abstract class AgentkycEvent {}
class FetchAgentKyc extends AgentkycEvent{
  final String clientId;
  final String PartnerCode;
  final String PAN;
  final String Mobile;
  final String Email;
  final String OnboardingFor;
  final BuildContext ctx;
  FetchAgentKyc({required this .clientId,required this.PartnerCode,required this .PAN,required this.Mobile,required this.Email,required this.OnboardingFor,required this.ctx});
}
