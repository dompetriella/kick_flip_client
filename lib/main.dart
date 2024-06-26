import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kick_flip_client/app/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await dotenv.load(fileName: "dotenv");
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: dotenv.env['BASE_URL'].toString(),
      anonKey: dotenv.env['API_KEY'].toString());
  runApp(const ProviderScope(child: App()));
}

final supabase = Supabase.instance.client;
