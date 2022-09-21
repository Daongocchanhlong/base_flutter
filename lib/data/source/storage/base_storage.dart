import 'package:base_src/controller/account_manager.dart';
import 'package:get_storage/get_storage.dart';

class BaseStorage {
  T? read<T>(String key) {
    return GetStorage()
        .read<T>('${AccountManager().loginMethod?.token ?? ''}_$key');
  }

  Future<void> write(String key, dynamic value) async {
    await GetStorage()
        .write('${AccountManager().loginMethod?.token ?? ''}_$key', value);
  }

  bool hasData(String key) {
    return GetStorage()
        .hasData('${AccountManager().loginMethod?.token ?? ''}_$key');
  }
}
