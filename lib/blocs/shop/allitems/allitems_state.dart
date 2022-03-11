part of 'allitems_cubit.dart';

@immutable
abstract class AllItemsState {}

class AllItemsInitial extends AllItemsState {}
class AllItemsLoadingState extends AllItemsState {}
class AllItemsSuccessState extends AllItemsState {}
class AllItemsErrorState extends AllItemsState {}
