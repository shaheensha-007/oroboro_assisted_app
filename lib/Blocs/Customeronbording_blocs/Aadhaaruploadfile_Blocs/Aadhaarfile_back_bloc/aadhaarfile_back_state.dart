part of 'aadhaarfile_back_bloc.dart';

@immutable
abstract class AadhaarfileBackState {}

class AadhaarfileBackInitial extends AadhaarfileBackState {}
class AadhaarfileBackblocLoading extends AadhaarfileBackState{}
class AadhaarfileBackblocLoaded extends AadhaarfileBackState{
  final AadhaaruploadfilesModel aadhaaruploadfilesModel;
  AadhaarfileBackblocLoaded({required this.aadhaaruploadfilesModel});
}
class AadhaarfileBackblocError extends AadhaarfileBackState{
  final String Errormessage;
  AadhaarfileBackblocError({required this.Errormessage});
}
