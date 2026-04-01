import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'face_ai_sdk_platform_interface.dart';

/// An implementation of [FaceAiSdkPlatform] that uses method channels.
class MethodChannelFaceAiSdk extends FaceAiSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('face_ai_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String> initializeSDK(Map<String, dynamic> config) async {
    final result = await methodChannel.invokeMethod<String>(
      'initializeSDK',
      {'config': config},
    );
    return result ?? 'Failed to initialize';
  }

  @override
  Future<String?> startEnroll(String faceId, String format) async {
    final result = await methodChannel.invokeMethod<String>(
      'startEnroll',
      {
        'faceId': faceId,
        'format': format,
      },
    );
    return result;
  }
}
