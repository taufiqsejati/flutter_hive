import 'package:flutter_hive/src/common/utils/service_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StorageService>(StorageService());
}
