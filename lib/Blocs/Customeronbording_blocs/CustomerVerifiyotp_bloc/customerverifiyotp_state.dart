part of 'customerverifiyotp_bloc.dart';

@immutable
abstract class CustomerverifiyotpState {}

class CustomerverifiyotpInitial extends CustomerverifiyotpState {}
class CustomerverifiyotpblocLoading extends CustomerverifiyotpState{}
class CustomerverifiyotpblocLoaded extends CustomerverifiyotpState{}
class CustomerverifiyotpblocError extends CustomerverifiyotpState{}
