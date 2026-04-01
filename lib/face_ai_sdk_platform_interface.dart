import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'face_ai_sdk_method_channel.dart';

abstract class FaceAiSdkPlatform extends PlatformInterface {
  FaceAiSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static FaceAiSdkPlatform _instance = MethodChannelFaceAiSdk();

  static FaceAiSdkPlatform get instance => _instance;

  static set instance(FaceAiSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('getPlatformVersion() has not been implemented.');
  }

  Future<String> initializeSDK(Map<String, dynamic> config) {
    throw UnimplementedError('initializeSDK() has not been implemented.');
  }

  Future<Map<String, dynamic>> startVerification({
    required String faceId,
    double threshold = 0.85,
    int livenessType = 0,
    int motionStepSize = 1,
    int motionTimeout = 10,
    String motionTypes = "1,2,3",
    String format = "base64",
  }) {
    throw UnimplementedError('startVerification() has not been implemented.');
  }

  Future<Map<String, dynamic>> startLiveness({
    int livenessType = 1,
    int motionStepSize = 1,
    int motionTimeout = 10,
    String motionTypes = "1,2,3",
    String format = "base64",
  }) {
    throw UnimplementedError('startLiveness() has not been implemented.');
  }

  Future<Map<String, dynamic>> startEnroll({
    required String faceId,
    String format = "base64",
  }) {
    throw UnimplementedError('startEnroll() has not been implemented.');
  }

  Future<Map<String, dynamic>> addFace({
    required String faceId,
    String format = "base64",
  }) {
    throw UnimplementedError('addFace() has not been implemented.');
  }
}
