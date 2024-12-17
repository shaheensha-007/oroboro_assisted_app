part of 'productcollateral_bloc.dart';

@immutable
abstract class ProductcollateralEvent {}
class FetchProductcollateral extends ProductcollateralEvent{
  final String userId;
  final String Customercode;
  final String ApplicationId;
  final String ProductName;
  final String BrandName;
  final String ModelName;
  final String ProductValue;
  final String ProductId;
  final String AddOnId;
  final BuildContext ctx;
  FetchProductcollateral({
    required this.userId,
    required this.Customercode,
    required this.ApplicationId,
    required this.ProductName,
    required this.BrandName,
    required this.ModelName,
    required this.ProductValue,
    required this.ProductId,
    required this.AddOnId,
    required  this.ctx,

});

}