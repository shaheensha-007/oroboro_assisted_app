part of 'customercodecreate_bloc.dart';

@immutable
abstract class CustomercodecreateState {}

class CustomercodecreateInitial extends CustomercodecreateState {}
class CustomercodecreateblocLoading extends CustomercodecreateState{}
class CustomercodecreateblocLoaded extends CustomercodecreateState{}
class CustomerCodecreateblocError extends CustomercodecreateState{}
