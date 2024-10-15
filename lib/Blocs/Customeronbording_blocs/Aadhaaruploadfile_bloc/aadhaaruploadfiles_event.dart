part of 'aadhaaruploadfiles_bloc.dart';

@immutable
abstract class AadhaaruploadfilesEvent {}
class FetchAadhaaruploadfile extends AadhaaruploadfilesEvent{
  final String userId;
  final String IdentityType;
  final String IdentityValue;
  final String DocID_Value;
  final String DocType;
  final String DocBase64;
  final BuildContext ctx;

  FetchAadhaaruploadfile({
   required this.userId,
   required this.IdentityType,
   required this.IdentityValue,
   required this.DocID_Value,
   required this.DocType,
   required this.DocBase64,
  required this.ctx
});
}
