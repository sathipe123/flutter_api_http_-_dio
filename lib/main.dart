import 'package:api_call/bloc/my_features/my_feature_bloc.dart';
import 'package:api_call/repository/my_repository.dart';
import 'package:api_call/screens/my_ui_Screen.dart';
import 'package:api_call/services/api_services_dio.dart';
import 'package:api_call/services/api_services_http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final apiServiceHttp = ApiServiceHttp('https://fakestoreapi.com');
  final apiServiceDio = ApiServiceDio('https://fakestoreapi.com');
  final repository = MyRepository(
      apiServiceHttp: apiServiceHttp, apiServiceDio: apiServiceDio);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final MyRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => MyFeatureBloc(repository),
        child: MyScreen(),
      ),
    );
  }
}
