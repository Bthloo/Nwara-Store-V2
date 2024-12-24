part of 'add_item_cubit.dart';

@immutable
sealed class AddItemState {}

final class AddItemInitial extends AddItemState {}
final class AddItemLoading extends AddItemState {}
final class AddItemSuccess extends AddItemState {
  final String message;
  AddItemSuccess(this.message);
}
final class AddItemFailed extends AddItemState{
  final String message;
  AddItemFailed(this.message);
}
