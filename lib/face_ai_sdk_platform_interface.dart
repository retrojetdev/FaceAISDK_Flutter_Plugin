import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'face_ai_sdk_method_channel.dart';

abstract class FaceAiSdkPlatform extends PlatformInterface {
  /// Constructs a FaceAiSdkPlatform.
  FaceAiSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static FaceAiSdkPlatform _instance = MethodChannelFaceAiSdk();

  /// The default instance of [FaceAiSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelFaceAiSdk].
  static FaceAiSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FaceAiSdkPlatform] when
  /// they register themselves.
  static set instance(FaceAiSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> initializeSDK(Map<String, dynamic> config) {
    throw UnimplementedError('initializeSDK() has not been implemented.');
  }

  Future<String?> startEnroll(String faceId, String format) {
    throw UnimplementedError('startEnroll() has not been implemented.');
  }
}
