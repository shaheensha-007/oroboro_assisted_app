part of 'ifsc_bloc.dart';

@immutable
abstract class IfscEvent {}
class FetchIfsc extends IfscEvent{
  final String clientId;
  final String IFSC;
  final BuildContext ctx;
  FetchIfsc({required this.clientId,required this.IFSC,required this.ctx});
}
