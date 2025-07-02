import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';

class MiddleWare1 extends GetMiddleware{
  @override
  RouteSettings? redirect(String? route){
    bool isLogin = true;
    if(!isLogin){
      return RouteSettings(name: NAV_DISPLAY_PAGE_VIEW);
    }
    return null;
  }
}