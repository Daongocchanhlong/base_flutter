// import 'package:base_src/controller/global_manager.dart';
// import 'package:base_src/global/app_log.dart';
import 'package:base_src/global/app_log.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseManager {
  static final FirebaseManager share = FirebaseManager();

  // late FirebaseRemoteConfig _remoteConfig;

  // late String token;

  Future<FirebaseApp> init() async {
    try {
      final FirebaseApp result = await Firebase.initializeApp();

      await setupRemoteConfig();

      return result;
    } catch (e) {
      AppLog.log.printError(e);
      rethrow;
    }
  }

  Future<void> setupRemoteConfig(
      {Duration minimumFetchInterval = Duration.zero}) async {
    //   try {
    //     _remoteConfig = FirebaseRemoteConfig.instance;

    //     await _remoteConfig.setConfigSettings(RemoteConfigSettings(
    //       fetchTimeout: const Duration(seconds: 10),
    //       minimumFetchInterval: minimumFetchInterval,
    //     ));

    //     RemoteConfigValue(null, ValueSource.valueStatic);

    //     await _remoteConfig.fetch().catchError((Object error) {
    //       AppLog.log.printError('_remoteConfig.fetch :$error');
    //     });
    //     await _remoteConfig.fetchAndActivate().catchError((Object error) {
    //       AppLog.log.printError('_remoteConfig.fetchAndActivate :$error');
    //     });
    //     GlobalManager().setupFirebseConfig(_remoteConfig);
    //   } catch (error) {
    //     AppLog.log.printError('Error setupRemoteConfig :$error');
    //   }
  }
}
