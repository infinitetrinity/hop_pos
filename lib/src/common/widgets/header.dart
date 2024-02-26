import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/routes/login_routes.dart';
import 'package:hop_pos/routes/order_routes.dart';
import 'package:hop_pos/routes/pos_routes.dart';
import 'package:hop_pos/routes/screening_routes.dart';
import 'package:hop_pos/src/common/widgets/header_logo.dart';
import 'package:hop_pos/src/common/widgets/nav_item.dart';
import 'package:hop_pos/src/common/widgets/sync_button.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.brand600,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1280),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HeaderLogo(),
              Row(
                children: [
                  NavItem(
                    icon: Icons.store,
                    title: 'POS',
                    path: ScreeningRoute().location,
                    samePaths: [
                      LoginRoute().location,
                      PosRoute().location,
                      PosPaymentRoute().location,
                    ],
                  ),
                  const SizedBox(width: 25),
                  NavItem(
                    icon: Icons.list,
                    title: 'Sales',
                    path: OrderRoute().location,
                  ),
                  const SizedBox(width: 25),
                  NavItem(
                    icon: Icons.list,
                    title: 'Incomplete Sales',
                    path: IncompleteOrderRoute().location,
                  ),
                  const SizedBox(width: 25),
                  const SyncButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
