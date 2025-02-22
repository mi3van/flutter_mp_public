part of 'app_bar.dart';

class _OverflowImageTopRight extends StatelessWidget {
  const _OverflowImageTopRight({required this.imageLink});

  static final _imageSizeInt =
      PreciousSliverAppBar.defaultExpandedHeight.toInt() +
          PreciousSliverAppBar.defaultWidgetHeight.toInt();
  static final _imageSize = _imageSizeInt.toDouble();
// Calibrate for center with horizontal item.
  static const _imageHorizontalOffset =
      PreciousSliverAppBar.defaultExpandedHeight + 10.0;
  static const _imageVerticalOffset = 8.0;

  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: SizedBox(
        width: _imageHorizontalOffset,
        height: _imageVerticalOffset,
        child: OverflowBox(
          minWidth: _imageSize,
          minHeight: _imageSize,
          maxHeight: _imageSize,
          maxWidth: _imageSize,
          child: Image.asset(
            imageLink,
            fit: BoxFit.contain,
            color: uiLocator.appController.palette.surface[1],
            colorBlendMode: BlendMode.srcIn,
            cacheHeight: _imageSizeInt,
            cacheWidth: _imageSizeInt,
          ),
        ),
      ),
    );
  }
}
