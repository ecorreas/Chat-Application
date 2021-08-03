import 'package:app/app/controller/app/app_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider {
  static List<SingleChildWidget> get listProviders => [
        Provider(create: (_) => AppController()),
      ];
}
