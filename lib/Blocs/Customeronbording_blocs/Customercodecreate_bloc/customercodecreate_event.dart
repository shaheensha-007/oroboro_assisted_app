part of 'customercodecreate_bloc.dart';

@immutable
abstract class CustomercodecreateEvent {}
class FetchCustomercodecreate extends CustomercodecreateEvent{
    final String userId;
  final String data;
    final BuildContext ctx;
  FetchCustomercodecreate({required this.userId,required this.data,required this.ctx});
}
