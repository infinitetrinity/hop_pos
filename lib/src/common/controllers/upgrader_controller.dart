import 'package:hop_pos/src/common/models/api_response.dart';
import 'package:hop_pos/src/common/services/api_service.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upgrader_controller.g.dart';

@riverpod
class UpgraderController extends _$UpgraderController {
  @override
  void build() {
    return;
  }

  Future<String> getCurrentVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<String> getBinaryUrl(version) async {
    return "https://github.com/infinitetrinity/hop_pos/releases/download/v$version/hop_pos.exe";
  }

  Future<String?> getLatestVersion() async {
    final apiService = ref.watch(apiServiceProvider);
    const path = "https://api.github.com/repos/infinitetrinity/hop_pos/releases/latest";

    try {
      ApiResponse? response = await apiService.getFromUrl(path);
      if (response?.body == null) {
        return null;
      }

      return response!.body!["tag_name"].substring(1);
    } catch (e, stackTrace) {
      final logger = Logger();
      logger.e("Upgrade check failed in getting latest version.", error: e, stackTrace: stackTrace);
      return null;
    }
  }

  Future<String?> getChangelog() async {
    final apiService = ref.watch(apiServiceProvider);
    const path = "https://api.github.com/repos/infinitetrinity/hop_pos/releases/latest";

    try {
      ApiResponse? response = await apiService.getFromUrl(path);
      if (response?.body == null) {
        return null;
      }

      return response!.body!["body"];
    } catch (e, stackTrace) {
      final logger = Logger();
      logger.e("Upgrade check failed in getting change log.", error: e, stackTrace: stackTrace);
    }
    return null;
  }
}
