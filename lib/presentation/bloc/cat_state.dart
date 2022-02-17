part of 'cat_bloc.dart';

abstract class CatState extends Equatable {
  const CatState();
}

class CatInitial extends CatState {
  @override
  List<Object> get props => [];
}

class CatLoadedState extends CatState {
  final CatImage catImage;

  const CatLoadedState({required this.catImage});

  @override
  List<Object> get props => [catImage];
}
