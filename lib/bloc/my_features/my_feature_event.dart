import 'package:equatable/equatable.dart';

abstract class MyFeatureEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchProductsWithHttpEvent extends MyFeatureEvent {}

class FetchProductsWithDioEvent extends MyFeatureEvent {}
