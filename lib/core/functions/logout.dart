import 'package:robocare/core/navigation.dart';
import 'package:robocare/core/networks/cache_helper.dart';
import 'package:robocare/features/opening/presentation/opening_view.dart';
import 'package:robocare/main.dart';

void logout(context) {
  token = null;
  CacheHelper.removeData(key: "token");
  navigateAndFinish(context, const OpeningView());
}
