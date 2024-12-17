part of 'productcollateral_bloc.dart';

@immutable
abstract class ProductcollateralState {}

class ProductcollateralInitial extends ProductcollateralState {}
class ProductcollateralblocLoading extends ProductcollateralState{}
class ProductcollateralblocLoaded extends ProductcollateralState{
  final ProductcollateralModel productcollateralModel;
  ProductcollateralblocLoaded({required this.productcollateralModel});
}
class ProductcollateralblocError extends ProductcollateralState{
  final String Errormessage;
  ProductcollateralblocError({required this.Errormessage});
}
