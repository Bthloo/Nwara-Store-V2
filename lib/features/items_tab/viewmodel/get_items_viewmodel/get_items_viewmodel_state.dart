part of 'get_items_viewmodel_cubit.dart';

@immutable
sealed class GetItemsState {}

final class GetItemsInitial extends GetItemsState {}
final class GetItemsLoading extends GetItemsState {}
final class GetItemsSuccess extends GetItemsState {
  final List<ItemModel> items;
  GetItemsSuccess(this.items);
}
final class GetItemsFailed extends GetItemsState{
  final String message;
  GetItemsFailed(this.message);
}
