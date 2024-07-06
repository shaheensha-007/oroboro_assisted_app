part of 'verifypan_bloc.dart';

@immutable
abstract class VerifypanEvent {}
class FetchVerifypan extends VerifypanEvent {
  final String clientId;
  final String PAN;
  final String OnboardingFor;
  final BuildContext ctx;

  FetchVerifypan(
      {required this.clientId, required this.PAN, required this.OnboardingFor, required this.ctx});
}