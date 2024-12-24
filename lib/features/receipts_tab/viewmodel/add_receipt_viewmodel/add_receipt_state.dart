part of 'add_receipt_cubit.dart';

@immutable
sealed class AddReceiptState {}

final class AddReceiptInitial extends AddReceiptState {}
final class AddReceiptLoading extends AddReceiptState {}
final class AddReceiptSuccess extends AddReceiptState {
  final String message;
  AddReceiptSuccess(this.message);
}
final class AddReceiptFailed extends AddReceiptState{
  final String message;
  AddReceiptFailed(this.message);
}
