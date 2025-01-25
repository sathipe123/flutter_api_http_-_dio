import 'package:api_call/repository/my_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'my_feature_event.dart';
import 'my_feature_state.dart';

class MyFeatureBloc extends Bloc<MyFeatureEvent, MyFeatureState> {
  final MyRepository repository;

  MyFeatureBloc(this.repository) : super(MyFeatureInitial()) {
    on<FetchProductsWithHttpEvent>((event, emit) async {
      emit(MyFeatureLoading());
      try {
        final products = await repository.fetchProductsWithHttp();
        emit(MyFeatureLoaded(products));
      } catch (e) {
        emit(MyFeatureError(e.toString()));
      }
    });

    on<FetchProductsWithDioEvent>((event, emit) async {
      emit(MyFeatureLoading());
      try {
        final products = await repository.fetchProductsWithDio();
        emit(MyFeatureLoaded(products));
      } catch (e) {
        emit(MyFeatureError(e.toString()));
      }
    });
  }
}
