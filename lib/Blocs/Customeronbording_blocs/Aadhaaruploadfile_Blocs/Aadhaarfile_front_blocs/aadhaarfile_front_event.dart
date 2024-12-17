part of 'aadhaarfile_front_bloc.dart';

@immutable
abstract class AadhaarfileFrontEvent {}
class FetchAadhaarfilesFront extends AadhaarfileFrontEvent{
  final String userId;
  final String IdentityType;
  final String IdentityValue;
  final String DocID_Value;
  final String DocType;
  final String DocBase64;
  final String applicationId;
  final BuildContext ctx;
  FetchAadhaarfilesFront({
    required this.userId,
    required this.IdentityType,
    required this.IdentityValue,
    required this.DocID_Value,
    required this.DocType,
    required this.DocBase64,
    required this.applicationId,
    required this.ctx,
});
}
