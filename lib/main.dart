import 'package:flutter/material.dart';
import 'app.dart';
import 'package:ez_flutter/ez_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EzRunner.run(new App(), "One Cainta App",displayDebugBadge: false);
} 





