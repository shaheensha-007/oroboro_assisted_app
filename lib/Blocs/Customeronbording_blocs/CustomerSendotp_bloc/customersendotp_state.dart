part of 'customersendotp_bloc.dart';

@immutable
abstract class CustomersendotpState {}

class CustomersendotpInitial extends CustomersendotpState {}
class CustomersendotpblocLoading extends CustomersendotpState{}
class CustomersendotpblocLoaded extends CustomersendotpState{}
class CustomersendotpblocError extends CustomersendotpState{}
