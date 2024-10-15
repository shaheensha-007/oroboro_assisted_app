part of 'customerverifiyotp_bloc.dart';

@immutable
abstract class CustomerverifiyotpEvent {}
class FetchCustomerVerifiyotp extends CustomerverifiyotpEvent{
  final String userId;
  final String mobilenumber;
  final String Mobilenumberotp;
  final BuildContext ctx;
  FetchCustomerVerifiyotp({
    required this.userId,
    required this.mobilenumber,
    required this.Mobilenumberotp,
    required this.ctx
});
}
