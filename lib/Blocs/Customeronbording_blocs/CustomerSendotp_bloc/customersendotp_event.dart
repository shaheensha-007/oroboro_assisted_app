part of 'customersendotp_bloc.dart';

@immutable
abstract class CustomersendotpEvent {}
class FetchCustomersendotp extends CustomersendotpEvent{
  final String userId;
  final String mobilenumber;
  final BuildContext ctx;
  FetchCustomersendotp({required this.userId,required this.mobilenumber,required this.ctx});
}

