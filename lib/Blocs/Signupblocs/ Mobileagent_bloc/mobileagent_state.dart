part of 'mobileagent_bloc.dart';

@immutable
abstract class MobileagentState {}

class MobileagentInitial extends MobileagentState {}
class MobileagentblocLoading extends MobileagentState{}
class MobileagentblocLoaded extends MobileagentState{}
class MobileagentblocError extends MobileagentState{}
