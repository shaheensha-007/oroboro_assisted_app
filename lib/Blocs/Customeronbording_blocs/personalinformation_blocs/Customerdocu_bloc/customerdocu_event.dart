part of 'customerdocu_bloc.dart';

@immutable
abstract class CustomerdocuEvent {}
class FetchCustomerdocu extends CustomerdocuEvent{
  final String userId;
  final String IdentityType;
  final String Identity;
  final String applicationId;
  final String DocType;
  final String DocBase64;
  final BuildContext ctx;
  FetchCustomerdocu({
    required this.userId,
    required this.IdentityType,
    required this.Identity,
    required this.applicationId,
    required this.DocType,
    required this.DocBase64,
    required this.ctx
});
}