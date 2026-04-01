import 'face_ai_sdk_platform_interface.dart';

class FaceAiSdk {
  Future<String?> getPlatformVersion() {
    return FaceAiSdkPlatform.instance.getPlatformVersion();
  }

  /// Initialize the FaceAI SDK. Must be called before any other method.
  Future<String> initializeSDK(Map<String, dynamic> config) {
    return FaceAiSdkPlatform.instance.initializeSDK(config);
  }

  /// 1:1 Face Verification against a stored faceId.
  ///
  /// [faceId] - Unique identifier for the face to verify against.
  /// [threshold] - Recognition threshold [0.75-0.95], default 0.85.
  /// [livenessType] - 0=NONE, 1=MOTION, 2=MOTION+COLOR, 3=COLOR, 4=SILENT.
  /// [motionStepSize] - Number of motion steps [1-2].
  /// [motionTimeout] - Motion timeout in seconds [3-22].
  /// [motionTypes] - Comma-separated motion types: 1=mouth, 2=smile, 3=blink, 4=shake, 5=nod.
  /// [format] - Result image format: "base64" or "filePath".
  ///
  /// Returns Map with: code, faceID, msg, similarity, livenessValue, faceImage.
  Future<Map<String, dynamic>> startVerification({
    required String faceId,
    double threshold = 0.85,
    int livenessType = 0,
    int motionStepSize = 1,
    int motionTimeout = 10,
    String motionTypes = "1,2,3",
    String format = "base64",
  }) {
    return FaceAiSdkPlatform.instance.startVerification(
      faceId: faceId,
      threshold: threshold,
      livenessType: livenessType,
      motionStepSize: motionStepSize,
      motionTimeout: motionTimeout,
      motionTypes: motionTypes,
      format: format,
    );
  }

  /// Liveness detection only (no face matching).
  ///
  /// [livenessType] - 1=MOTION, 2=MOTION+COLOR, 3=COLOR, 4=SILENT.
  /// [motionStepSize] - Number of motion steps [1-2].
  /// [motionTimeout] - Motion timeout in seconds [3-22].
  /// [motionTypes] - Comma-separated motion types: 1=mouth, 2=smile, 3=blink, 4=shake, 5=nod.
  /// [format] - Result image format: "base64" or "filePath".
  ///
  /// Returns Map with: code, msg, livenessValue, faceImage.
  Future<Map<String, dynamic>> startLiveness({
    int livenessType = 1,
    int motionStepSize = 1,
    int motionTimeout = 10,
    String motionTypes = "1,2,3",
    String format = "base64",
  }) {
    return FaceAiSdkPlatform.instance.startLiveness(
      livenessType: livenessType,
      motionStepSize: motionStepSize,
      motionTimeout: motionTimeout,
      motionTypes: motionTypes,
      format: format,
    );
  }

  /// Enroll a face for 1:1 verification.
  ///
  /// [faceId] - Unique identifier for the face being enrolled.
  /// [format] - Result image format: "base64" or "filePath".
  ///
  /// Returns Map with: code, faceID, msg, faceImage.
  Future<Map<String, dynamic>> startEnroll({
    required String faceId,
    String format = "base64",
  }) {
    return FaceAiSdkPlatform.instance.startEnroll(
      faceId: faceId,
      format: format,
    );
  }

  /// Add a face to the search database.
  ///
  /// [faceId] - Unique identifier for the face being added.
  /// [format] - Result image format: "base64" or "filePath".
  ///
  /// Returns Map with: code, faceID, msg, faceImage.
  Future<Map<String, dynamic>> addFace({
    required String faceId,
    String format = "base64",
  }) {
    return FaceAiSdkPlatform.instance.addFace(
      faceId: faceId,
      format: format,
    );
  }
}
