part of 'previewdocument_bloc.dart';

@immutable
abstract class PreviewdocumentEvent {}
class FetchPreviewdocument extends PreviewdocumentEvent{
  final String clientId;
  final String PAN;
  final String OnboardingFor;
  final BuildContext ctx;
  FetchPreviewdocument({required this.clientId,required this.PAN,required this.OnboardingFor,required this.ctx});
}