import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_theme.dart';

class RecentHistoryCard extends StatelessWidget {
  const RecentHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 4,
            width: 48,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Recent History',
            style: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 20),
          _HistoryItem(
            label: 'Verification: User_992',
            value: '99.8% Conf.',
            valueColor: AppColors.primary,
          ),
          const SizedBox(height: 16),
          _HistoryItem(
            label: 'Liveness Check',
            value: 'PASSED',
            valueColor: AppColors.secondary,
          ),
          const SizedBox(height: 16),
          _HistoryItem(
            label: 'Search: Dataset_A',
            value: '3 matches',
            valueColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const _HistoryItem({
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.onSurface,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontFamily: 'monospace',
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
