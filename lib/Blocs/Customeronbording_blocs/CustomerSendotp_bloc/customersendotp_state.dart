part of 'customersendotp_bloc.dart';

@immutable
abstract class CustomersendotpState {}

class CustomersendotpInitial extends CustomersendotpState {}
class CustomersendotpblocLoading extends CustomersendotpState{}
class CustomersendotpblocLoaded extends CustomersendotpState{
  final CustomersendotpModel customersendotpModel;
  CustomersendotpblocLoaded({required this.customersendotpModel});
}
class CustomersendotpblocError extends CustomersendotpState{
  final String Errormessage;
  CustomersendotpblocError({required this.Errormessage});
}
