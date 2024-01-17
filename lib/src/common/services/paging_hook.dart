import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

PagingController usePagingController({required int firstPageKey}) {
  return use(_PagingControllerHook(firstPageKey: firstPageKey));
}

class _PagingControllerHook extends Hook<PagingController> {
  final int firstPageKey;

  const _PagingControllerHook({required this.firstPageKey});

  @override
  _PagingControllerHookState createState() => _PagingControllerHookState();
}

class _PagingControllerHookState extends HookState<PagingController, _PagingControllerHook> {
  late PagingController controller;

  @override
  void initHook() {
    super.initHook();
    controller = PagingController(firstPageKey: hook.firstPageKey);
  }

  @override
  PagingController build(BuildContext context) {
    return controller;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
