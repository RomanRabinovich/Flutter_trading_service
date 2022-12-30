import 'package:flutter/material.dart';
import 'package:tplatfom/_infra/environment/environment.dart';
import 'package:tplatfom/presentation/app/tplatform_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Environment.setup();

  runApp(const TPlatformApp());
}
