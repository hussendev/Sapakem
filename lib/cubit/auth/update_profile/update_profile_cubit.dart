import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/api/controller/auth/auth_api_controller.dart';
import 'package:sapakem/cubit/auth/update_profile/update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileStates> {
  UpdateProfileCubit() : super(InitialUpdateProfileState());

  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  UsersApiController usersApiController = UsersApiController();

  void updateProfile({
    required String name,
    required String email,
    required String mobile,
    required BuildContext context,
  }) async {
    emit(LoadingUpdateProfileState());
    try {
      var response = await usersApiController.updateProfile(
        email: email,
        mobile: mobile,
        name: name,
      );
      if (response.success) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        emit(SuccessUpdateProfileState(response.success, response.message));
      } else {
        emit(ErrorDataUpdateProfileState(response.message, response.success));
      }
    } catch (e) {
      Logger().e(e.toString());
      emit(ErrorUpdateProfileState(e.toString()));
    }
  }
}
