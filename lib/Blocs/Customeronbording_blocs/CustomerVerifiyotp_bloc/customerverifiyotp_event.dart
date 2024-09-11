part of 'customerverifiyotp_bloc.dart';

@immutable
abstract class CustomerverifiyotpEvent {}
class FetchCustomerVerifiyotp extends CustomerverifiyotpEvent{
  final String userId;
  final String mobilenumber;
  final String Mobilenumberotp;
  FetchCustomerVerifiyotp({
    required this.userId,
    required this.mobilenumber,
    required this.Mobilenumberotp,
});
}
