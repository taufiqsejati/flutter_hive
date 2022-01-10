// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';
// import 'package:get_it/get_it.dart';

import 'package:flutter_hive/main.dart';
import 'package:flutter_hive/src/common/utils/service_storage.dart';
import 'package:flutter_hive/src/common/utils/setup_locator.dart';

class Config {
  static var configContainer = getIt<StorageService>().getHiveBox('config');

  bool get isLoggedIn => configContainer.get(
        'isLoggedIn',
        defaultValue: false,
      );

  String? get baseUrl => 'http://202.78.200.118';

  Uri? get uri {
    if (baseUrl == null) return null;
    return Uri.parse(baseUrl!);
  }

  static Future set(String k, dynamic v) async {
    // logger.d('mencurigakan1 ${k}');
    // logger.d('mencurigakan2 ${v}');
    configContainer.put(k, v);
    // configContainer.put('Bambang', 'Bangsat');
    // configContainer.put('Suyanto', 'Ngetot');
    // configContainer.values;
    // configContainer.clear();
    // logger.d('mencurigakan3 ${configContainer.toMap().toString()}');
  }

  static Future clear() async {
    configContainer.clear();
  }

  static Future remove(String k) async {
    configContainer.delete(k);
  }
}

initDb() async {
  await getIt<StorageService>().initHiveStorage();

  await getIt<StorageService>().initHiveBox('config');
}

clearLoginInfo() async {
  logger.d('mencurigakan4 ${Config.configContainer.toMap().toString()}');
  // if (Config().uri != null) {
  // logger.d('mencurigakan5 ${Config.configContainer.toMap().toString()}');

  // cookie.delete(
  //   Config().uri!,
  // );
  // }
}
