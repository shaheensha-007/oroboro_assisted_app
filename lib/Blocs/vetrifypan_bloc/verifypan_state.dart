part of 'verifypan_bloc.dart';

@immutable
abstract class VerifypanState {}

class VerifypanInitial extends VerifypanState {}
class VerifypanblocLoading extends VerifypanState{}
class VerifypanblocLoaded extends VerifypanState{}
class VerifypanblocError extends VerifypanState{}

