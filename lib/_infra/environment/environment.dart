import 'package:package_info_plus/package_info_plus.dart';
import 'package:tplatfom/_infra/environment/environment_variables.dart';

late final Environment _currentEnvironment;
late final EnvironmentVariables _currentEnvironmentVariables;

enum Environment {
  staging,
  production;

  static Environment get current => _currentEnvironment;

  EnvironmentVariables get variables => _currentEnvironmentVariables;

  static Future<void> setup() async {
    final packageInfo = await PackageInfo.fromPlatform();

    if (packageInfo.packageName.toLowerCase().endsWith(".staging")) {
      _currentEnvironment = Environment.staging;
      _currentEnvironmentVariables = EnvironmentVariables.staging();
    } else {
      _currentEnvironment = Environment.production;
      _currentEnvironmentVariables = EnvironmentVariables.production();
    }
  }
}
