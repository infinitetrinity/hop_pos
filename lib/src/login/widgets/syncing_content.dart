import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/login/models/syncing_progress.dart';
import 'package:hop_pos/src/login/state/syncing_state.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SyncingContent extends HookConsumerWidget {
  const SyncingContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SyncingProgress syncingState = ref.watch(syncingStateProvider);
    final controller = useAnimationController(duration: const Duration(seconds: 1))..forward();

    useEffect(() {
      controller.animateTo(syncingState.progress);
      return null;
    }, [syncingState.progress]);

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
                width: 50,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballSpinFadeLoader,
                  colors: [AppColors.gray400, AppColors.gray600],
                  pathBackgroundColor: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              LinearProgressIndicator(
                value: syncingState.progress > 0 ? syncingState.progress : null,
                semanticsLabel: 'Syncing progress indicator',
              ),
              const SizedBox(height: 5),
              if (syncingState.progress > 0) Text('Syncing ${syncingState.currentPage} out of ${syncingState.lastPage}'),
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
