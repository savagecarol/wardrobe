import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  PreferenceService._();

  factory PreferenceService.getInstance() => _instance;

  static final PreferenceService _instance = PreferenceService._();

  static const String filePath = 'file';

  Future<SharedPreferences> _getInstance() async {
    return SharedPreferences.getInstance();
  }

  Future<void> setFilePath(String files) async {
    (await _getInstance()).setString(PreferenceService.filePath, files);
  }

  Future<String> getFilePath() async {
    String? value =
        (await _getInstance()).getString(PreferenceService.filePath);
    return (value != null) ?  value : "";
  }
}
