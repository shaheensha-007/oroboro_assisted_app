part of 'customercodecreate_bloc.dart';

@immutable
abstract class CustomercodecreateEvent {}
class FetchCustomercodecreate extends CustomercodecreateEvent{
    final String userId;
  final String data;
  FetchCustomercodecreate({required this.userId,required this.data});
}
