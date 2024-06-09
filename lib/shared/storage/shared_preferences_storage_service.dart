import 'package:chat_bot_poc/shared/storage/local_storage_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: LocalStorageService)
class SharedPreferencesService implements LocalStorageService {
  SharedPreferencesService({required this.preferences});
  static const firstInitKey = 'firstInit';

  final SharedPreferences preferences;

  Future<void> clear() async {
    await preferences.clear();
  }

  @override
  bool isOnboardingCompleted() {
    return preferences.getBool(firstInitKey) ?? false;
  }

  @override
  void setOnboardingCompleted() {
    preferences.setBool(firstInitKey, true);
  }
}
