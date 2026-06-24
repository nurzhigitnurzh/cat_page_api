import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/cat_repository.dart';
import 'cat_event.dart';
import 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatRepository _repository;
  CatBloc(this._repository) : super(CatInitial()) {
    on<FetchCatsEvent>(_onFetchCats);
  }
  Future<void> _onFetchCats(
    FetchCatsEvent event,
    Emitter<CatState> emit,
  ) async {
    emit(CatLoading());
    try {
      final cats = await _repository.getCats();
      emit(CatLoaded(cats));
    } catch (e) {
      emit(CatError(e.toString()));
    }
  }
}