import 'dart:io';
import 'package:flutter/material.dart';

class AsyncNetImage extends StatelessWidget {
  final String? networkUrl;
  final String? localPath;
  final double? height;
  final BorderRadius? radius;

  const AsyncNetImage({
    super.key,
    this.networkUrl,
    this.localPath,
    this.height,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (localPath != null) {
      child = Image.file(File(localPath!), fit: BoxFit.cover);
    } else {
      child = Image.network(networkUrl!, fit: BoxFit.cover);
    }
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(0),
      child: SizedBox(height: height, child: child),
    );
  }
}
