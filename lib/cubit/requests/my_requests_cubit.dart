import 'package:bloc/bloc.dart';

part 'my_requests_state.dart';

class MyRequestsCubit extends Cubit<MyRequestsState> {
  MyRequestsCubit() : super(MyRequestsState(false));

  convertToCurrentState() {
    emit(MyRequestsState(true));
  }

  convertToPreviousState() {
    emit(MyRequestsState(false));
  }
}
