part of 'get_receipts_cubit.dart';

@immutable
sealed class GetReceiptsState {}

final class GetReceiptsInitial extends GetReceiptsState {}
final class GetReceiptsLoading extends GetReceiptsState {}
final class GetReceiptsSuccess extends GetReceiptsState {
  final List<ReceiptModel> receipts;
  GetReceiptsSuccess(this.receipts);
}
final class GetReceiptsFailed extends GetReceiptsState{
  final String message;
  GetReceiptsFailed(this.message);
}
