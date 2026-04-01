import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:face_ai_sdk/face_ai_sdk.dart';

import '../theme/app_theme.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final _nameController = TextEditingController();
  final _faceAiSdk = FaceAiSdk();
  _EnrollState _enrollState = _EnrollState.idle;
  String? _enrollResult;

  bool get _canEnroll =>
      _nameController.text.trim().isNotEmpty &&
      _enrollState != _EnrollState.loading;

  Future<void> _enroll() async {
    if (!_canEnroll) return;

    final faceId = _nameController.text.trim();
    setState(() => _enrollState = _EnrollState.loading);

    try {
      // Initialize SDK before each enrollment
      await _faceAiSdk.initializeSDK({'apiKey': 'demo-key'});
      if (!mounted) return;

      final result = await _faceAiSdk.startEnroll(faceId: faceId);
      if (!mounted) return;

      setState(() {
        _enrollResult = result.toString();
        _enrollState = _EnrollState.success;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _enrollResult = e.toString();
        _enrollState = _EnrollState.error;
      });
    }

    // Auto-dismiss feedback after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted && _enrollState != _EnrollState.loading) {
        setState(() => _enrollState = _EnrollState.idle);
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Face AI SDK',
          style: GoogleFonts.manrope(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.onSurface,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 120),
        children: [
          // ── Editorial Header ──
          Text(
            'IDENTITY ENROLLMENT',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.8,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Add Face '),
                TextSpan(
                  text: 'Feature Data',
                  style: TextStyle(color: AppColors.primary),
                ),
              ],
            ),
            style: GoogleFonts.manrope(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
              height: 1.1,
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Securely capture facial landmarks to register a new identity '
            'into the biometric database.',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.onSurfaceVariant,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 32),

          // ── Form Card ──
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subject Information',
                  style: GoogleFonts.manrope(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.onSurface,
                  ),
                ),
                const SizedBox(height: 24),

                // Name field
                const Text(
                  'FACE ID / NAME',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.onSurfaceVariant,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _nameController,
                  onChanged: (_) => setState(() {}),
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.onSurface,
                  ),
                  decoration: InputDecoration(
                    hintText: 'e.g. Julian Montgomery',
                    hintStyle: const TextStyle(color: AppColors.outline),
                    filled: true,
                    fillColor: AppColors.surfaceContainerHighest,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // Enroll button
                SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _canEnroll ? _enroll : null,
                      borderRadius: BorderRadius.circular(100),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: _canEnroll
                              ? const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    AppColors.primary,
                                    AppColors.primaryContainer,
                                  ],
                                )
                              : null,
                          color: _canEnroll
                              ? null
                              : AppColors.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: _canEnroll
                              ? [
                                  BoxShadow(
                                    color: AppColors.primary
                                        .withValues(alpha: 0.2),
                                    blurRadius: 16,
                                    offset: const Offset(0, 6),
                                  ),
                                ]
                              : null,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (_enrollState == _EnrollState.loading)
                                const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              else ...[
                                Text(
                                  'Enroll Subject',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: _canEnroll
                                        ? Colors.white
                                        : AppColors.outline,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  Icons.person_add_rounded,
                                  size: 20,
                                  color: _canEnroll
                                      ? Colors.white
                                      : AppColors.outline,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ── Feedback Notifications ──
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: _enrollState == _EnrollState.success
                ? _FeedbackCard(
                    key: const ValueKey('success'),
                    icon: Icons.check_circle_rounded,
                    iconColor: AppColors.primary,
                    bgColor: AppColors.primary.withValues(alpha: 0.1),
                    title: 'Face Enrolled',
                    subtitle: _enrollResult ?? 'Face data stored successfully.',
                  )
                : _enrollState == _EnrollState.error
                    ? _FeedbackCard(
                        key: const ValueKey('error'),
                        icon: Icons.error_rounded,
                        iconColor: AppColors.error,
                        bgColor: AppColors.error.withValues(alpha: 0.1),
                        title: 'Enrollment Failed',
                        subtitle: _enrollResult ?? 'Unknown error occurred.',
                      )
                    : const SizedBox.shrink(),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// ── Feedback Card ──

class _FeedbackCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String title;
  final String subtitle;

  const _FeedbackCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: iconColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum _EnrollState { idle, loading, success, error }
