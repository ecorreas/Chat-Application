import 'controller/chat/chat_controller.dart';

main(List<String> args) async {
  final controller = ChatController();
  await controller.initConection();
  controller.sendMessage("hello");
}
