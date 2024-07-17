import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valyuta_calculator/cubits/valyuta_state.dart';
import 'package:valyuta_calculator/services/get_services_valyuta.dart';

class ValyutaCubit extends Cubit<ValyutaState> {
  ValyutaCubit() : super(InitialState());

  Future<void> getValyuta() async {
    final getValyuta = GetServicesValyuta();

    try {
      emit(LoadingState());
      var lst = await getValyuta.getValyuta();
      emit(LoadedState(lst));
    } catch (e) {
      emit(ErrorState("$e"));
    }
  }
}
