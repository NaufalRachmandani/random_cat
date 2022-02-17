import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:random_cat/data/repositories/cat_repository.dart';
import 'package:random_cat/presentation/bloc/cat_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerLazySingleton<CatBloc>(() => CatBloc(locator()));
  // repository
  locator.registerLazySingleton<CatRepository>(() => CatRepository(locator()));
  // external i.e. http client
  locator.registerLazySingleton<Client>(() => Client());
}