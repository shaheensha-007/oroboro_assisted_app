part of 'ifsc_bloc.dart';

@immutable
abstract class IfscState {}

class IfscInitial extends IfscState {}
class IfscblocLoding extends IfscState{}
class IfscblocLoaded extends IfscState{}
class IfscblocError extends IfscState{}