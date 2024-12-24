part of 'delete_item_cubit.dart';

@immutable
sealed class DeleteItemState {}

final class DeleteItemInitial extends DeleteItemState {}
final class DeleteItemLoading extends DeleteItemState {}
final class DeleteItemSuccess extends DeleteItemState {
  final String message;
  DeleteItemSuccess(this.message);
}
final class DeleteItemFailed extends DeleteItemState {
  final String message;
  DeleteItemFailed(this.message);
}
