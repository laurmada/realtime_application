import 'package:flutter_modular/flutter_modular.dart';
import 'package:realtime_application/screens/home_page.dart';
import 'package:realtime_application/services/firebase_service.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }

  @override
  void binds(i) {
    i.addLazySingleton<FirebaseService>(FirebaseService.new);
  }
}
