import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:random_cat/domain/models/cat_image.dart';

import '../../data/repositories/cat_repository.dart';

part 'cat_event.dart';

part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatRepository _repository;

  CatBloc(this._repository) : super(CatInitial()) {
    on<GetCatEvent>(_getCatEvent);
  }

  void _getCatEvent(GetCatEvent event, Emitter<CatState> emit) async {
    CatImage catImage = await _repository.getCatImage();
    emit(CatLoadedState(catImage: catImage));
  }
}
