import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

CarouselController useCarouselController() {
  return use(const _CarouselControllerHook());
}

class _CarouselControllerHook extends Hook<CarouselController> {
  const _CarouselControllerHook();

  @override
  _CarouselControllerHookState createState() => _CarouselControllerHookState();
}

class _CarouselControllerHookState extends HookState<CarouselController, _CarouselControllerHook> {
  late CarouselController controller;

  @override
  void initHook() {
    super.initHook();
    controller = CarouselController();
  }

  @override
  CarouselController build(BuildContext context) {
    return controller;
  }
}
