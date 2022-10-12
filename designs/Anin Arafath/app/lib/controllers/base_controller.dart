import 'package:karmalab_assignment/helper/dialog_helper.dart';
import 'package:karmalab_assignment/services/base/app_exceptions.dart';

class BaseController {
  void handleError(error) {
    // print(error);
    if (error is BadRequestException) {
      var message = error.message;
      // print(error);
      DialogHelper.showErrorDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      // var message = error.message;
      DialogHelper.showErrorDialog(description: "It took longer to respond.");
    } else if (error is InvalidException) {
      DialogHelper.showErrorDialog(
          description: error.message, title: "Oops 🥸");
    }
  }
}
