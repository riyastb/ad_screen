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
    
    // Default asset image to use if no image URL is provided
    const defaultAssetImage = 'assets/images/image.png';
    
    // Check if OfferDescription is an image URL
    final isImageUrl = offerDescription.isNotEmpty && _isValidHttpUrl(offerDescription);
    print('🎯 OfferDescriptionBanner - Is Image URL: $isImageUrl');
    
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
        child: isImageUrl
            ? Image.network(
                offerDescription,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  print('❌ OfferDescriptionBanner - Network image load error: $error');
                  // Fallback to asset image if network image fails
                  return Image.asset(
                    defaultAssetImage,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Center(
                          child: Icon(
                            Icons.broken_image,
                            size: responsive.getIconSize(48),
                            color: Colors.grey[600],
                          ),
                        ),
                      );
                    },
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    print('✅ OfferDescriptionBanner - Network image loaded successfully');
                    return child;
                  }
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
              )
            : Image.asset(
                defaultAssetImage,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  print('❌ OfferDescriptionBanner - Asset image load error: $error');
                  return Container(
                    color: Colors.grey[300],
                    child: Center(
                      child: Icon(
                        Icons.broken_image,
                        size: responsive.getIconSize(48),
                        color: Colors.grey[600],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

