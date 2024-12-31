import 'package:flutter_bloc_firebase_starter/utils/helpers/snackbars.dart';
import 'package:url_launcher/url_launcher.dart';

///for url helper
class UrlHelper {
  void launch(String url, {LaunchMode? mode}) async {
    Uri uri = Uri.parse(url);

    try {
      if (!await launchUrl(
        uri,
        mode: mode ?? LaunchMode.externalApplication,
      )) {
        CustomSnackbar.showToastMessage(
            message:
                "Cannot launch Url. Please ask your app admin or check your internet connection.");
      }
    } catch (e) {
      CustomSnackbar.showToastMessage(
          message:
              "Cannot launch Url. Please ask your app admin or check your internet connection.");
    }
  }
}
