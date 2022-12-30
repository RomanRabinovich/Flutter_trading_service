import 'package:flutter/material.dart';
import 'package:tplatfom/_infra/environment/environment.dart';
import 'package:tplatfom/presentation/app/tplatform_app.dart';
import 'package:provider/provider.dart';
import 'package:tplatfom/providers/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Environment.setup();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const TPlatformApp()));
}
