part of 'aadhaarotpverification_bloc.dart';

@immutable
abstract class AadhaarotpverificationEvent {}
class FetchAadhaarotpverification extends AadhaarotpverificationEvent{
  final String userId;
  final String Customercode;
  final String Aadhaarotp;
  final String Requestid;
  FetchAadhaarotpverification({
    required this.userId,
    required this.Customercode,
    required this.Aadhaarotp,
    required this.Requestid,
});
}
