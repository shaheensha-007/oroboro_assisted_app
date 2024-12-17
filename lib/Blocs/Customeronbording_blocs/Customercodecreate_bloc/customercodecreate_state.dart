part of 'customercodecreate_bloc.dart';

@immutable
abstract class CustomercodecreateState {}

class CustomercodecreateInitial extends CustomercodecreateState {}
class CustomercodecreateblocLoading extends CustomercodecreateState{}
class CustomercodecreateblocLoaded extends CustomercodecreateState{
  final CustomercodecreateModel customercodecreateModel;
  CustomercodecreateblocLoaded({required this.customercodecreateModel});
}
class CustomerCodecreateblocError extends CustomercodecreateState{
  final String Errormessage;
  CustomerCodecreateblocError({required this.Errormessage});
}
