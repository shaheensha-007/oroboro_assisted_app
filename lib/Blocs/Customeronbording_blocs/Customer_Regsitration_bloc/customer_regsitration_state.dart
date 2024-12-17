part of 'customer_regsitration_bloc.dart';

@immutable
abstract class CustomerRegsitrationState {}

class CustomerRegsitrationInitial extends CustomerRegsitrationState {}
class CustomerRegsitrationblocLoading extends CustomerRegsitrationState{}
class CustomerRegsitrationblocLoaded extends CustomerRegsitrationState{
  final CustomerRegsitrationModel customerRegistrationStatus;
  CustomerRegsitrationblocLoaded({required this.customerRegistrationStatus});
}
class CustomerRegsitrationblocError extends CustomerRegsitrationState{
  final String Errormessage;
  CustomerRegsitrationblocError({required this.Errormessage});
}
