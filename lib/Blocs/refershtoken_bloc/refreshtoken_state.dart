part of 'refreshtoken_bloc.dart';

@immutable
abstract class RefreshtokenState {}

class RefreshtokenInitial extends RefreshtokenState {}
class RefreshtokenblocLoading extends RefreshtokenState {}
class RefreshtokenblocLoaded extends RefreshtokenState {}
class RefreshtokenblocError extends RefreshtokenState {}