import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:kick_flip_client/app/pages/home_page.dart';
import 'package:kick_flip_client/app/pages/waiting_room.dart';

part 'routes.g.dart';

@TypedGoRoute<HomePageRoute>(
  path: '/',
)
class HomePageRoute extends GoRouteData {
  const HomePageRoute();
  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

@TypedGoRoute<WaitingRoomRoute>(
  path: '/waiting_room',
)
class WaitingRoomRoute extends GoRouteData {
  const WaitingRoomRoute();
  static const path = '/waiting_room';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WaitingRoom();
}
