import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SyncingContent extends StatelessWidget {
  const SyncingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 550),
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Syncing POS...',
                style: AppStyles.h1.copyWith(color: AppColors.brand600),
              ),
              const SizedBox(height: 30),
              const SizedBox(
                width: 100,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballSpinFadeLoader,
                  colors: [AppColors.gray400, AppColors.gray600],
                  pathBackgroundColor: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'POS is syncing with server, this may take a few minutes, please do not turn off the application.',
                style: AppStyles.body,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
