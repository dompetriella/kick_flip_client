import 'package:flutter/widgets.dart';
import 'package:kick_flip_client/main.dart';
import 'package:kick_flip_client/routing/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future addPlayerToRoom(
    String username, String roomCode, BuildContext context) async {
  PostgrestResponse<List<Map<String, dynamic>>>? uniquePlayerResponse;
  PostgrestResponse<List<Map<String, dynamic>>>? insertPlayerResponse;

  try {
    uniquePlayerResponse = await supabase
        .from('clients')
        .select('username')
        .eq('username', username)
        .eq('room_code', roomCode)
        .count();
  } catch (e) {
    print('Failure to reach db, Error: ${e.toString()}');
  }

  bool playerIsUnique = false;

  if (uniquePlayerResponse != null) {
    List<dynamic>? data = uniquePlayerResponse.data;
    playerIsUnique = data.isEmpty;
  }

  if (playerIsUnique) {
    try {
      insertPlayerResponse = await supabase
          .from('clients')
          .insert({'username': username, 'room_code': roomCode})
          .select()
          .count();
    } catch (e) {
      print('Failure to reach db, Error: ${e.toString()}');
    }

    if (insertPlayerResponse != null) {
      Map<String, dynamic>? data = insertPlayerResponse.data.firstOrNull;
      if (data != null) {
        WaitingRoomRoute().go(context);
      } else {
        print("Data as list returned from db as list of NULL");
      }
    } else {
      print('Response return null- No tables returned');
    }
  } else {
    print('Player is not unique, try again');
  }
}
