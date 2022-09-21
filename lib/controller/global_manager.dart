// import 'package:base_src/data/source/storage/base_storage.dart';

// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:package_info_plus/package_info_plus.dart';

class GlobalManager {
  factory GlobalManager() {
    return _singleton;
  }

  GlobalManager._internal();

  static final GlobalManager _singleton = GlobalManager._internal();

  // final BaseStorage _storage = BaseStorage();

  // FirebaseRemoteConfig? _remoteConfig;

}
