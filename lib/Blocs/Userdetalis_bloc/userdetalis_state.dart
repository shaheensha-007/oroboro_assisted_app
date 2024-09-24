part of 'userdetalis_bloc.dart';

@immutable
abstract class UserdetalisState {}

class UserdetalisInitial extends UserdetalisState {}
class UserdetalisblocLoading extends UserdetalisState{}
class UserdetalisblocLoaded extends UserdetalisState{}
class UserdetalisblocError extends UserdetalisState{}
