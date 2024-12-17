part of 'loan_view_bloc.dart';

@immutable
abstract class LoanViewEvent {}
class FetchLoanView extends LoanViewEvent{
  final String userId;
  final int index;
  final int pageSize;
  final String GroupName;
  final String ApplicationStatus;
  final String Fromdate;
  final String Todate;
  final BuildContext ctx;
  FetchLoanView({
   required this.userId,
   required this.index,
   required this.pageSize,
   required this.GroupName,
   required this.ApplicationStatus,
   required this.Fromdate,
   required this.Todate,
    required this.ctx,
});
}
