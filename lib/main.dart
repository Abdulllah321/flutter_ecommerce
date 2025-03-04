import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/helpers/network_manager.dart';

import 'data/repositories/authenticatoin/authentication_repository.dart';
import 'firebase_options.dart';

void main() async {
  final WidgetsBinding widgetBinding = WidgetsFlutterBinding
      .ensureInitialized();

  await GetStorage.init();

  Get.put(NetworkManager());

  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));


  runApp(const App());
}
