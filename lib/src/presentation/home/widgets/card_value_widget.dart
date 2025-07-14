import 'package:ds/ds.dart';
import 'package:flutter/material.dart';

class CardValueWidget extends StatelessWidget {
  final DateTime period;
  final double availableValue;
  final double usedValue;
  final double limitValue;
  final VoidCallback? onPressedSettings;

  const CardValueWidget({
    super.key,
    required this.period,
    required this.availableValue,
    required this.usedValue,
    required this.limitValue,
    this.onPressedSettings,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0F0F0F), Color(0xFF2D2D2D)],
          transform: GradientRotation(1.78),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 24,
              right: 24,
              left: 24,
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppText.titleSm(
                          _getMonthNameByIndex(period.month),
                          customTextStyle: TextStyle(
                            color: colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        AppText.titleXs(
                          '/ ${period.year}',
                          customTextStyle: TextStyle(color: colors.neutral30),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(Icons.settings, color: Colors.white, size: 24),
                          onPressed: onPressedSettings,
                        ),
                      ],
                    ),
                    const Divider(color: Colors.white24),
                    AppSpacer.small(),
                    AppText.textSm(
                      'Orçamento disponível',
                      customTextStyle: TextStyle(color: colors.neutral30),
                    ),
                    const SizedBox(height: 8),
                    AppText.titleLg(
                      'R\$ ${availableValue.toStringAsFixed(2).replaceAll('.', ',')}',
                      customTextStyle: TextStyle(color: colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.textXs(
                              'Usado',
                              customTextStyle: TextStyle(
                                color: colors.neutral30,
                              ),
                            ),
                            SizedBox(height: 4),
                            AppText.titleMd(
                              'R\$ ${usedValue.toStringAsFixed(2).replaceAll('.', ',')}',
                              customTextStyle: TextStyle(color: colors.white),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppText.textXs(
                              'Limite',
                              customTextStyle: TextStyle(color: colors.neutral30),
                            ),
                            SizedBox(height: 4),
                            AppText.titleMd(
                              'R\$ ${limitValue.toStringAsFixed(2).replaceAll('.', ',')}',
                              customTextStyle: TextStyle(color: colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ClipRRect(
            child: LinearProgressIndicator(
              value: usedValue / limitValue,
              minHeight: 8,
              backgroundColor: Colors.white24,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFB84DFF)),
            ),
          ),
        ],
      ),
    );
  }

  String _getMonthNameByIndex(int monthIndex) {
    const monthNames = [
      'JAN',
      'FEV',
      'MAR',
      'ABR',
      'MAI',
      'JUN',
      'JUL',
      'AGO',
      'SET',
      'OUT',
      'NOV',
      'DEZ',
    ];
    return monthNames[monthIndex - 1];
  }
}
