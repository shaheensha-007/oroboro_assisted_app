part of 'mobileotpverify_bloc.dart';

@immutable
abstract class MobileotpverifyEvent {}
class FetchMobileotpverify extends MobileotpverifyEvent{
  final String clientId;
  final String Mobile;
  final String Otp;
  final String OnboardingFor;
  final BuildContext ctx;
  FetchMobileotpverify({required this.clientId,required this.Mobile,required this.Otp, required this .OnboardingFor, required this.ctx});
}
