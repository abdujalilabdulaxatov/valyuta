import 'package:valyuta_calculator/data/models/valyuta.dart';

sealed class ValyutaState {}

final class InitialState extends ValyutaState {}

final class LoadingState extends ValyutaState {}

final class LoadedState extends ValyutaState {
  List<Valyuta> lst = [];

  LoadedState(this.lst);
}

final class ErrorState extends ValyutaState {
  String message;

  ErrorState(this.message);
}
