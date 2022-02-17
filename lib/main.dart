import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:random_cat/presentation/bloc/cat_bloc.dart';
import 'package:random_cat/presentation/home/home_page.dart';

import 'data/repositories/cat_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatBloc(
        CatRepository(
          Client(),
        ),
      )..add(GetCatEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
