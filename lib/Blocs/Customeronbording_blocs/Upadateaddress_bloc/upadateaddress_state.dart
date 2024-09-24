part of 'upadateaddress_bloc.dart';

@immutable
abstract class UpadateaddressState {}

class UpadateaddressInitial extends UpadateaddressState {}
class UpadateaddressblocLoading extends UpadateaddressState{}
class UpadateaddressblocLoaded extends UpadateaddressState{}
class UpadateaddressblocError extends UpadateaddressState{}
