import 'package:flutter/material.dart';

class AsyncNetImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit fit;
  final BorderRadius? radius;

  const AsyncNetImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(12),
      child: Image.network(
        url,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (c, e, s) => Container(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          height: height,
          width: width,
          alignment: Alignment.center,
          child: const Icon(Icons.broken_image_outlined),
        ),
        loadingBuilder: (c, child, prog) =>
            prog == null ? child : Container(
              height: height, width: width,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            ),
      ),
    );
  }
}

