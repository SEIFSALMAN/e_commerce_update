part of 'bestseller_cubit.dart';

@immutable
abstract class BestSellerState {}

class BestSellerInitial extends BestSellerState {}
class BestSellerLoadingState extends BestSellerState {}
class BestSellerSuccessState extends BestSellerState {}
class BestSellerErrorState extends BestSellerState {}
