part of 'customer_regsitration_bloc.dart';

@immutable
abstract class CustomerRegsitrationEvent {}
class FetchCustomerregistration extends CustomerRegsitrationEvent{
   final String userId;
   final String data;
   final BuildContext ctx;
   FetchCustomerregistration({required this.userId,required this.data,required this.ctx});
}
