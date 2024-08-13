part of 'mobileotpverify_bloc.dart';

@immutable
abstract class MobileotpverifyState {}

class MobileotpverifyInitial extends MobileotpverifyState {}
class MobileotpverifyblocLoading extends MobileotpverifyState{}
class MobileotpverifyblocLoaded extends MobileotpverifyState{}
class MobileotpverifyblocError extends MobileotpverifyState{}