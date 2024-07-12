part of 'mobileagent_bloc.dart';

@immutable
abstract class MobileagentEvent {}
class FetchMobileagent extends MobileagentEvent{
  final String clientId;
  final String mobile;
  final String OnboardingFor;
  final BuildContext ctx;
  FetchMobileagent({required this.clientId,required this.mobile,required this.OnboardingFor,required this.ctx});
}
