import 'package:advertisment_screen/domain/branch/model/branch.dart';
import 'package:flutter/material.dart';
import 'package:advertisment_screen/core/responsive/responsive_helper.dart';
import 'package:advertisment_screen/advertise/models/branch_theme.dart';

class OfferDescriptionBanner extends StatelessWidget {
  final List<Branch>? branches;
  final BranchTheme theme;

  const OfferDescriptionBanner({
    super.key,
    this.branches,
    required this.theme,
  });

  bool _isValidHttpUrl(String url) {
    if (url.isEmpty) return false;
    final uri = Uri.tryParse(url);
    if (uri == null) return false;
    final hasScheme = uri.scheme == 'http' || uri.scheme == 'https';
    return hasScheme && (uri.host.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final items = branches ?? const <Branch>[];
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    final firstBranch = items.first;
    final offerDescription = (firstBranch.offerDescription ?? '').trim();
    
    print('🎯 OfferDescriptionBanner - OfferDescription: $offerDescription');
    
    if (offerDescription.isEmpty) {
      return const SizedBox.shrink();
    }

    // Check if OfferDescription is an image URL
    final isImageUrl = _isValidHttpUrl(offerDescription);
    print('🎯 OfferDescriptionBanner - Is Image URL: $isImageUrl');
    final backgroundColor = theme.footerBackground;
    final textColor = theme.footerTextColor ?? Colors.white;

    if (isImageUrl) {
      print('🎯 OfferDescriptionBanner - Loading image from URL: $offerDescription');
      return Container(
        width: responsive.width,
        margin: EdgeInsets.symmetric(
          horizontal: responsive.getMargin(10),
          vertical: responsive.getMargin(8),
        ),
        height: responsive.getHeight(0.25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(responsive.getBorderRadius(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: responsive.getPadding(6),
              offset: Offset(0, responsive.getPadding(3)),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(responsive.getBorderRadius(12)),
          child: Image.network(
            offerDescription,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              print('❌ OfferDescriptionBanner - Image load error: $error');
              print('❌ StackTrace: $stackTrace');
              return Container(
                color: Colors.grey[300],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.broken_image,
                        size: responsive.getIconSize(48),
                        color: Colors.grey[600],
                      ),
                      SizedBox(height: responsive.getSpacing(8)),
                      Text(
                        'Failed to load image',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: responsive.getFontSize(12),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                print('✅ OfferDescriptionBanner - Image loaded successfully');
                return child;
              }
              print('⏳ OfferDescriptionBanner - Loading image... ${loadingProgress.cumulativeBytesLoaded}/${loadingProgress.expectedTotalBytes}');
              return Container(
                color: Colors.grey[200],
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

    return Container(
      width: responsive.width,
      margin: EdgeInsets.symmetric(
        horizontal: responsive.getMargin(10),
        vertical: responsive.getMargin(8),
      ),
      decoration: BoxDecoration(
        gradient: backgroundColor == null
            ? const LinearGradient(
                colors: [Color(0xFFFFC107), Color(0xFFFFA000)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(responsive.getBorderRadius(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: responsive.getPadding(6),
            offset: Offset(0, responsive.getPadding(3)),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(responsive.getPadding(20)),
        child: Text(
          offerDescription,
          style: TextStyle(
            fontSize: responsive.getFontSize(20),
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

