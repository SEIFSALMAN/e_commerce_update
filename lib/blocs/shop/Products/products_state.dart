part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}
class ProductsErrorState extends ProductsState {}

class ProductsSuccessState extends ProductsState {}
class ProductsLoadingState extends ProductsState {}

