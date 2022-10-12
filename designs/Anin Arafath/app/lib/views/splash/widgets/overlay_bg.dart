import 'package:flutter/material.dart';

class OverlayBg extends StatelessWidget {
  const OverlayBg({
    Key? key,
    required this.bg,
    this.left,
    this.bottom,
    this.right,
    this.top,
  }) : super(key: key);
  final Color bg;
  final double? left;
  final double? top;
  final double? bottom;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: right,
      bottom: bottom,
      right: right,
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          color: bg,
        ),
      ),
    );
  }
}
