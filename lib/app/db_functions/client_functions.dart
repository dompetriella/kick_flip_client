import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kick_flip_client/main.dart';

Future addPlayerToRoom(String username, String roomCode) async {
  try {
    await supabase
        .from('clients')
        .insert({'username': username, 'room_code': roomCode})
        .select()
        .count();
  } catch (e) {
    print('Failure to reach db, Error: ${e.toString()}');
  }
}
