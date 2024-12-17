part of 'productdetalis_bloc.dart';

@immutable
abstract class ProductdetalisState {}

class ProductdetalisInitial extends ProductdetalisState {}
class ProductdetalisblocLoading extends ProductdetalisState{}
class ProductdetalisblocLoaded extends ProductdetalisState{
  final ProductdetalisModel productdetalisModel;
  ProductdetalisblocLoaded({required this.productdetalisModel});
}
class ProductdetalisblocError extends ProductdetalisState{
  final String Errormessage;
  ProductdetalisblocError({required this.Errormessage});

}
