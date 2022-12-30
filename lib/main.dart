import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tplatfom/_infra/environment/environment.dart';
import 'package:tplatfom/presentation/app/tplatform_app.dart';
import 'package:tplatfom/services/api.dart';

final apiProvider = Provider((ref) => Api());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Environment.setup();

  runApp(const ProviderScope(child: TPlatformApp()));
}
