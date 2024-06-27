import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kick_flip_client/routing/router.dart';
import 'package:kick_flip_client/routing/routes.dart';
import 'package:kick_flip_client/app/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'App',
      themeMode: ThemeMode.light,
      theme: lightTheme,
      routerConfig: ref.watch(routerProvider),
    );
  }
}
