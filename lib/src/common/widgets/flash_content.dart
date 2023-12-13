import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';

class FlashContent extends StatelessWidget {
  const FlashContent({super.key, required this.message});
  final FlashMessage message;

  @override
  Widget build(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);

    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            color: message.bgColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.headerText,
                      style: AppStyles.body.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      message.message!,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: () => fToast.removeCustomToast(),
            child: const Icon(
              Icons.close,
              color: AppColors.white,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}
