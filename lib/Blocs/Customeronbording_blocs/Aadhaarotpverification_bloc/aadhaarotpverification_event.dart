part of 'aadhaarotpverification_bloc.dart';

@immutable
abstract class AadhaarotpverificationEvent {}

class FetchAadhaarotpverification extends AadhaarotpverificationEvent {
  final String userId;
  final String Customercode;
  final String Aadhaarotp;
  final String Requestid;
  final String applicationId;

  final BuildContext ctx;
  FetchAadhaarotpverification(
      {required this.userId,
      required this.Customercode,
      required this.Aadhaarotp,
      required this.Requestid,
      required this.applicationId,
      required this.ctx});
}
