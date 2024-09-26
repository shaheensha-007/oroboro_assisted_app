part of 'aadhaarotpverification_bloc.dart';

@immutable
abstract class AadhaarotpverificationState {}

class AadhaarotpverificationInitial extends AadhaarotpverificationState {}
class AadhaarotpverificationblocLoading extends  AadhaarotpverificationState{}
class AadhaarotpvetrificationblocLoaded extends AadhaarotpverificationState{}
class AadhaarotpverificationblocError extends AadhaarotpverificationState{}
