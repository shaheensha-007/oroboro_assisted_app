part of 'customerupdate_bloc.dart';

@immutable
abstract class CustomerupdateState {}

class CustomerupdateInitial extends CustomerupdateState {}
class CustomerupdateblocLoading extends CustomerupdateState{}
class CustomerupadateblocLoaded extends CustomerupdateState{}
class CustomerupadateblocError extends CustomerupdateState{}
