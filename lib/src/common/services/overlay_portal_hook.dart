import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

OverlayPortalController useOverlayPortalController() {
  return use(const _OverlayPortalControllerHook());
}

class _OverlayPortalControllerHook extends Hook<OverlayPortalController> {
  const _OverlayPortalControllerHook();

  @override
  _OverlayPortalControllerHookState createState() => _OverlayPortalControllerHookState();
}

class _OverlayPortalControllerHookState extends HookState<OverlayPortalController, _OverlayPortalControllerHook> {
  late OverlayPortalController controller;

  @override
  void initHook() {
    super.initHook();
    controller = OverlayPortalController();
  }

  @override
  OverlayPortalController build(BuildContext context) {
    return controller;
  }
}
