part of 'agentbusiness_bloc.dart';

@immutable
abstract class AgentbusinessEvent {}
class FetchAgentbusiness extends AgentbusinessEvent{
  final String clientId;
  final String PAN;
  final String PartnerCode;
  final String OnboardingFor;
  final String GSTNUMBER;
  final String REGISTRATIONTYPE;
  final String AGENTNAME;
  final String BRANDNAME;
  final String TANNUMBER;
  final String TELEPHONE;
  final String SIGNATURE;
  final String LATITUDE;
  final String LONGITUDE;
  final BuildContext ctx;
  FetchAgentbusiness({
    required this.clientId,
    required this.PAN,
    required this.PartnerCode,
    required this.OnboardingFor,
    required this.GSTNUMBER,
    required this.REGISTRATIONTYPE,
    required this.AGENTNAME,
    required this.BRANDNAME,
    required this.TANNUMBER,
    required this .TELEPHONE,
    required this.SIGNATURE,
    required this.LATITUDE,
    required this.LONGITUDE,
    required this.ctx
});
}

