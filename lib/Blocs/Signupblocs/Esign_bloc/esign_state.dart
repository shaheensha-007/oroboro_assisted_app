part of 'esign_bloc.dart';

@immutable
abstract class EsignState {}

class EsignInitial extends EsignState {}
class EsignblocLoading extends EsignState{}
class EsignblocLoaded extends EsignState{}
class EsignblocError extends EsignState{}
