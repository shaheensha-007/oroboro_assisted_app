part of 'esign_bloc.dart';

@immutable
abstract class EsignEvent {}
class FetchEsin extends EsignEvent{
  final String clientId;
  final String PAN;
  final String OnboardingFor;
  final BuildContext ctx;
  FetchEsin({required this.clientId,required this.PAN,required this.OnboardingFor,required this.ctx});
}
