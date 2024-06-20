import 'package:bloc/bloc.dart';

part 'height_state.dart';

class HeightCubit extends Cubit<HeightState> {
  HeightCubit() : super(HeightInitialState(height: 40));

  void onHeightChanged(heightValue) => emit(HeightChangedState(height: heightValue));
}
