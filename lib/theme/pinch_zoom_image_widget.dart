import 'package:flutter/material.dart';

class PinchZoomImage extends StatefulWidget {
  const PinchZoomImage({super.key, required this.url});

  final String url;

  @override
  State<PinchZoomImage> createState() => _PinchZoomImageState();
}

class _PinchZoomImageState extends State<PinchZoomImage>
    with SingleTickerProviderStateMixin {
  late TransformationController controller;
  late AnimationController animationController;
  Animation<Matrix4>? animation;
  OverlayEntry? entry;
  final double minScale = 1;
  final double maxScale = 4;

  @override
  void initState() {
    super.initState();

    controller = TransformationController();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() => controller.value = animation!.value)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        removeOverlay();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();

    super.dispose();
  }

  void showOverlay(BuildContext context) {
    final renderBox = context.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = MediaQuery.of(context).size;

    entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: offset.dx,
          top: offset.dy,
          width: size.width,
          child: buildImage(),
        );
      },
    );

    final overlay = Overlay.of(context);
    overlay.insert(entry!);
  }

  void removeOverlay() {
    entry?.remove();
    entry = null;
  }

  void resetAnimation() {
    animation = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity(),
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.linear),
    );

    animationController.forward(from: 0);
  }

  Widget buildImage() {
    return InteractiveViewer(
      transformationController: controller,
      panEnabled: false,
      minScale: minScale,
      maxScale: maxScale,
      clipBehavior: Clip.none,
      onInteractionStart: (details) {
        if (details.pointerCount < 2) return;

        showOverlay(context);
      },
      onInteractionEnd: (details) {
        resetAnimation();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.network(widget.url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: buildImage());
  }
}
