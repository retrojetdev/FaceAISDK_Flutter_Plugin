import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'face_ai_sdk_platform_interface.dart';

class MethodChannelFaceAiSdk extends FaceAiSdkPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('face_ai_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
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
  Future<Map<String, dynamic>> startVerification({
    required String faceId,
    double threshold = 0.85,
    int livenessType = 0,
    int motionStepSize = 1,
    int motionTimeout = 10,
    String motionTypes = "1,2,3",
    String format = "base64",
  }) async {
    final result =
        await methodChannel.invokeMethod<Map<Object?, Object?>>(
      'startVerification',
      {
        'faceId': faceId,
        'threshold': threshold,
        'livenessType': livenessType,
        'motionStepSize': motionStepSize,
        'motionTimeout': motionTimeout,
        'motionTypes': motionTypes,
        'format': format,
      },
    );
    return Map<String, dynamic>.from(result ?? {});
  }

  @override
  Future<Map<String, dynamic>> startLiveness({
    int livenessType = 1,
    int motionStepSize = 1,
    int motionTimeout = 10,
    String motionTypes = "1,2,3",
    String format = "base64",
  }) async {
    final result =
        await methodChannel.invokeMethod<Map<Object?, Object?>>(
      'startLiveness',
      {
        'livenessType': livenessType,
        'motionStepSize': motionStepSize,
        'motionTimeout': motionTimeout,
        'motionTypes': motionTypes,
        'format': format,
      },
    );
    return Map<String, dynamic>.from(result ?? {});
  }

  @override
  Future<Map<String, dynamic>> startEnroll({
    required String faceId,
    String format = "base64",
  }) async {
    final result =
        await methodChannel.invokeMethod<Map<Object?, Object?>>(
      'startEnroll',
      {
        'faceId': faceId,
        'format': format,
      },
    );
    return Map<String, dynamic>.from(result ?? {});
  }

  @override
  Future<Map<String, dynamic>> addFace({
    required String faceId,
    String format = "base64",
  }) async {
    final result =
        await methodChannel.invokeMethod<Map<Object?, Object?>>(
      'addFace',
      {
        'faceId': faceId,
        'format': format,
      },
    );
    return Map<String, dynamic>.from(result ?? {});
  }
}
