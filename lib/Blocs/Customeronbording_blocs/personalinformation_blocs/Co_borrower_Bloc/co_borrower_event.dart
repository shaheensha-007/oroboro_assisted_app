part of 'co_borrower_bloc.dart';

@immutable
abstract class CoBorrowerEvent {}
class FetchCoBorrower extends CoBorrowerEvent{
  final String userId;
  final String Customercode;
  final String ApplicationId;
  final List<Map<String, dynamic>> data;
  final BuildContext ctx;
  FetchCoBorrower({
    required this.userId,
    required this.Customercode,
    required this.ApplicationId,
    required this.data,
    required this.ctx
});
}
