import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:app/app/models/message_model.dart';

void main() async {
  final server = await ServerSocket.bind(InternetAddress.anyIPv4, 4567);

  server.listen((client) {
    handleConnection(client);
  });
}

void handleConnection(Socket client) {
  print('Connection from'
      ' ${client.remoteAddress.address}:${client.remotePort}');

  // listen for events from the client
  client.listen(
    // handle data from the client
    (Uint8List data) async {
      final message = String.fromCharCodes(data);
      final json = jsonDecode(message);
      print(json['message']);
      await Future.delayed(Duration(seconds: 2));

      var line = stdin.readLineSync();
      client.write(
          MessageModel(message: line!.trim(), indentification: 'Server')
              .toJson());
    },

    // handle errors
    onError: (error) {
      print(error);
      client.close();
    },

    // handle the client closing the connection
    onDone: () {
      print('Client left');
      client.close();
    },
  );
}
