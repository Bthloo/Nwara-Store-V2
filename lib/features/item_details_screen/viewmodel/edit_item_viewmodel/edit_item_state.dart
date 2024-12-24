part of 'edit_item_cubit.dart';

@immutable
sealed class EditItemState {}

final class EditItemInitial extends EditItemState {}
final class EditItemLoading extends EditItemState {}
final class EditItemSuccess extends EditItemState {
  final String message;
  EditItemSuccess(this.message);
}
final class EditItemFailed extends EditItemState {
  final String message;
  EditItemFailed(this.message);
}
