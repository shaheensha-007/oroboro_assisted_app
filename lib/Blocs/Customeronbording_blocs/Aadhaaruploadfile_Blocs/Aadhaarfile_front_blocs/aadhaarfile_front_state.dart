part of 'aadhaarfile_front_bloc.dart';

@immutable
abstract class AadhaarfileFrontState {}

class AadhaarfileFrontInitial extends AadhaarfileFrontState {}
class AadhaarfileFrontblocLoading extends AadhaarfileFrontState{}
class AadhaarfileFrontblocLoaded extends AadhaarfileFrontState{
  final AadhaaruploadfilesModel isaadhaaruploadfilesModel;
  AadhaarfileFrontblocLoaded({required this.isaadhaaruploadfilesModel});
}
class AadhaarfileFrontblocError extends AadhaarfileFrontState{
  final String Errormessage;
  AadhaarfileFrontblocError({required this.Errormessage});
}
