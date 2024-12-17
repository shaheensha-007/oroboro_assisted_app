part of 'upadateaddress_bloc.dart';

@immutable
abstract class UpadateaddressEvent {}
class FetchUpadteaddress extends UpadateaddressEvent{
  final String userid;
  final String Customercode;
  final String applicationId;
  final String Address1;
  final String Address2;
  final String Address3;
  final String City;
  final String State;
  final String Pincode;
  final String District;
  final BuildContext ctx;
  FetchUpadteaddress({
    required this.userid,
    required this.Customercode,
    required this.applicationId,
    required this.Address1,
    required this.Address2,
    required this.Address3,
    required this.City,
    required this.State,
    required this.Pincode,
    required  this.District,
    required this.ctx
});
}
