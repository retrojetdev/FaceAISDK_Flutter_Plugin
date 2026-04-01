
import 'face_ai_sdk_platform_interface.dart';

class FaceAiSdk {
  Future<String?> getPlatformVersion() {
    return FaceAiSdkPlatform.instance.getPlatformVersion();
  }

  /// Start face enrollment process
  /// [faceId] - Unique identifier for the face (e.g., "user123")
  /// [format] - Format for face data (e.g., "base64")
  /// Returns face feature string
  Future<String?> startEnroll(String faceId, {String format = 'base64'}) {
    return FaceAiSdkPlatform.instance.startEnroll(faceId, format);
  }

  Future<String> initializeSDK(Map<String, dynamic> config) {
    return FaceAiSdkPlatform.instance.initializeSDK(config);
  }
}
