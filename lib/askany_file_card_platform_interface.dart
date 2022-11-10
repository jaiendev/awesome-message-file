import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'askany_file_card_method_channel.dart';

abstract class AskanyFileCardPlatform extends PlatformInterface {
  /// Constructs a AskanyFileCardPlatform.
  AskanyFileCardPlatform() : super(token: _token);

  static final Object _token = Object();

  static AskanyFileCardPlatform _instance = MethodChannelAskanyFileCard();

  /// The default instance of [AskanyFileCardPlatform] to use.
  ///
  /// Defaults to [MethodChannelAskanyFileCard].
  static AskanyFileCardPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AskanyFileCardPlatform] when
  /// they register themselves.
  static set instance(AskanyFileCardPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
