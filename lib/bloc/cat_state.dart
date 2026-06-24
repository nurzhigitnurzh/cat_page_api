import 'package:equatable/equatable.dart';
import '../models/cat_model.dart';

abstract class CatState extends Equatable {
  @override
  List<Object?> get props =>[];
}
class CatInitial extends CatState {}
class CatLoading extends CatState {}
class CatLoaded extends CatState {
  final List<CatModel> cats;
  CatLoaded(this.cats);
  @override
  List<Object?> get props => [cats];
}
class CatError extends CatState {
  final String message;
  CatError(this.message);
  @override
  List<Object?> get props=> [message];
}