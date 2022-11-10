// import 'package:flutter_test/flutter_test.dart';
// import 'package:askany_file_card/askany_file_card.dart';
// import 'package:askany_file_card/askany_file_card_platform_interface.dart';
// import 'package:askany_file_card/askany_file_card_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockAskanyFileCardPlatform
//     with MockPlatformInterfaceMixin
//     implements AskanyFileCardPlatform {
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final AskanyFileCardPlatform initialPlatform =
//       AskanyFileCardPlatform.instance;

//   test('$MethodChannelAskanyFileCard is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelAskanyFileCard>());
//   });

//   test('getPlatformVersion', () async {
//     AskanyFileCard askanyFileCardPlugin = AskanyFileCard();
//     MockAskanyFileCardPlatform fakePlatform = MockAskanyFileCardPlatform();
//     AskanyFileCardPlatform.instance = fakePlatform;

//     // expect(await askanyFileCardPlugin.getPlatformVersion(), '42');
//   });
// }
