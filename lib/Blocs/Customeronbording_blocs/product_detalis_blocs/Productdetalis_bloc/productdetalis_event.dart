part of 'productdetalis_bloc.dart';

@immutable
abstract class ProductdetalisEvent {}

class FetchProductdetalis extends ProductdetalisEvent {
  final String userId;

  final BuildContext ctx;

  FetchProductdetalis({
    required this.userId,
    required this.ctx
  });
}
