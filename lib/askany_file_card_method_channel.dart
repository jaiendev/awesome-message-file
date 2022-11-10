import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'askany_file_card_platform_interface.dart';

/// An implementation of [AskanyFileCardPlatform] that uses method channels.
class MethodChannelAskanyFileCard extends AskanyFileCardPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('askany_file_card');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
