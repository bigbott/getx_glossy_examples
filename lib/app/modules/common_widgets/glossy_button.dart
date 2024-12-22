import 'package:flutter/material.dart';
import 'package:glossy/glossy.dart';

class GlossyButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color color;
  final VoidCallback onPressed;
  final Widget child;

  const GlossyButton({
    super.key,
    this.width,
    this.height,
    required this.color,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GlossyContainer(
      width: width ?? double.infinity,
      height: height ?? 60,
      borderRadius: BorderRadius.circular(height == null ? 20 : height! / 3),
      color: color,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(height == null ? 20 : height! / 3),
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 60,
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
