import 'package:api_call/models/my_model.dart';
import 'package:equatable/equatable.dart';

abstract class MyFeatureState extends Equatable {
  @override
  List<Object> get props => [];
}

class MyFeatureInitial extends MyFeatureState {}

class MyFeatureLoading extends MyFeatureState {}

class MyFeatureLoaded extends MyFeatureState {
  final List<Product> products;

  MyFeatureLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class MyFeatureError extends MyFeatureState {
  final String error;

  MyFeatureError(this.error);

  @override
  List<Object> get props => [error];
}
