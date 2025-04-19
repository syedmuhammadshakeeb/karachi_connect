import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_text/skeleton_text.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/images.dart';

class LoadingImage extends StatelessWidget {
  final String? image;
  final BoxFit boxfit;
  final double? width, height;
  final Color? color;
  final FilterQuality filterquality;
  final bool isLocalAsset;
  final Widget? customImagePlaceHolder;
  final bool isShaderMask;

  const LoadingImage({
    super.key,
    this.image,
    this.boxfit = BoxFit.cover,
    this.height,
    this.width,
    this.color,
    this.isLocalAsset = false,
    this.filterquality = FilterQuality.high,
    this.customImagePlaceHolder,
    this.isShaderMask = false,
  });

  bool isSvgImage(String? imageUrl) {
    return imageUrl?.toLowerCase().endsWith('.svg') ?? false;
  }

  static bool isServerImage(String? imagePath) {
    return imagePath != null &&
        (imagePath.startsWith('http://') || imagePath.startsWith('https://'));
  }

  @override
  Widget build(BuildContext context) {
    if (image == null || image?.isEmpty == true) {
      return Image.asset(
        AppImages.empty,
        width: width,
        height: height,
        fit: boxfit,
      );
    }

    if (!isServerImage(image)) {
      return isSvgImage(image)
          ? SvgPicture.asset(image!,
              width: width,
              height: height,
              fit: boxfit,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null)
          : Image.asset(
              image!,
              width: width,
              height: height,
              fit: boxfit,
              color: color,
            );
    }

    if (isSvgImage(image)) {
      return SvgPicture.network(image!,
          placeholderBuilder: (_) => _buildPlaceholder(),
          width: width,
          height: height,
          fit: boxfit,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null);
    }

    return CachedNetworkImage(
      imageUrl: image!,
      fit: boxfit,
      imageBuilder: (context, imageProvider) => isShaderMask
          ? ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.4),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.5),
                    Colors.black.withValues(alpha: 0.5),
                    AppColors.black
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(bounds);
              },
              blendMode: BlendMode.multiply,
              child: _buildImage(imageProvider),
            )
          : _buildImage(imageProvider),
      placeholder: (_, __) => _buildPlaceholder(),
      errorWidget: (_, __, ___) => Image.asset(
        AppImages.empty,
        width: width,
        height: height,
        fit: boxfit,
      ),
    );
  }

  Widget _buildImage(ImageProvider imageProvider) {
    return Image(
      image: imageProvider,
      filterQuality: filterquality,
      fit: boxfit,
      color: color,
      width: width,
      height: height,
    );
  }

  Widget _buildPlaceholder() {
    return customImagePlaceHolder ??
        SkeletonAnimation(
          borderRadius: BorderRadius.circular(12),
          shimmerColor: AppColors.grey4d,
          shimmerDuration: 1000,
          curve: Curves.decelerate,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey4d,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
  }
}
