
// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class MessageClipper extends CustomClipper<Path> {
  final bool type;
  final double bubbleRadius;
  final double nipHeight;
  final double nipWidth;
  final double nipRadius;

  MessageClipper(
      this.type, {
        this.bubbleRadius = 12,
        this.nipHeight = 12,
        this.nipWidth = 16,
        this.nipRadius = 2,
      });

  @override
  Path getClip(Size size) {
    var path = Path();

    if (type) {
      path.lineTo(size.width - nipRadius, 0);
      path.arcToPoint(Offset(size.width - nipRadius, nipRadius),
          radius: Radius.circular(nipRadius));
      path.lineTo(size.width - nipWidth, nipHeight);
      path.lineTo(size.width - nipWidth, size.height - bubbleRadius);
      path.arcToPoint(Offset(size.width - nipWidth - bubbleRadius, size.height),
          radius: Radius.circular(bubbleRadius));
      path.lineTo(bubbleRadius, size.height);
      path.arcToPoint(Offset(0, size.height - bubbleRadius),
          radius: Radius.circular(bubbleRadius));
      path.lineTo(0, bubbleRadius);
      path.arcToPoint(Offset(bubbleRadius, 0),
          radius: Radius.circular(bubbleRadius));
    } else {
      path.lineTo(size.width - bubbleRadius, 0);
      path.arcToPoint(Offset(size.width, bubbleRadius),
          radius: Radius.circular(bubbleRadius));
      path.lineTo(size.width, size.height - bubbleRadius);
      path.arcToPoint(Offset(size.width - bubbleRadius, size.height),
          radius: Radius.circular(bubbleRadius));
      path.lineTo(bubbleRadius + nipWidth, size.height);
      path.arcToPoint(Offset(nipWidth, size.height - bubbleRadius),
          radius: Radius.circular(bubbleRadius));
      path.lineTo(nipWidth, nipHeight);
      path.lineTo(nipRadius, nipRadius);
      path.arcToPoint(Offset(nipRadius, 0), radius: Radius.circular(nipRadius));
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => oldClipper != this;
}