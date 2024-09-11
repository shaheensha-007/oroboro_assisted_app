part of 'customer_regsitration_bloc.dart';

@immutable
abstract class CustomerRegsitrationState {}

class CustomerRegsitrationInitial extends CustomerRegsitrationState {}
class CustomerRegsitrationblocLoading extends CustomerRegsitrationState{}
class CustomerRegsitrationblocLoaded extends CustomerRegsitrationState{}
class CustomerRegsitrationblocError extends CustomerRegsitrationState{}
