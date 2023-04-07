

import 'package:sapakem/model/process_response.dart';

mixin Helpers {

  ProcessResponse get errorResponse => ProcessResponse(message: 'Something Went Wrong ,Try Again',success: false);

}