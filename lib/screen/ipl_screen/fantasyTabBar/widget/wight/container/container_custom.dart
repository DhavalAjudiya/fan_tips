import 'package:flutter/cupertino.dart';

class AppContainer extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final DecorationImage? image;
  final BoxBorder? border;

  final GestureTapCallback? onTap;

  const AppContainer({
    Key? key,
    this.color,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.borderRadius,
    this.image,
    this.onTap,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        child: child,
        margin: margin,
        width: width,
        decoration: BoxDecoration(
          border: border,
          borderRadius: borderRadius,
          color: color,
          image: image,
        ),
      ),
    );
  }
}
