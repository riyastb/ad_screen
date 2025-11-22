import 'package:flutter/material.dart';
import 'package:advertisment_screen/core/responsive/responsive_helper.dart';
import 'package:advertisment_screen/advertise/models/branch_theme.dart';

class NoDataFoundWidget extends StatelessWidget {
  final String? message;
  final BranchTheme theme;
  final bool isError;

  const NoDataFoundWidget({
    super.key,
    this.message,
    required this.theme,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final displayMessage = message ?? 
        (isError 
            ? 'Unable to load data. Please try again later.' 
            : 'No data found');

    return Container(
      width: responsive.width,
      height: responsive.getHeight(0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(responsive.getBorderRadius(13)),
        color: theme.rateCardBackground?.withOpacity(0.1) ?? 
            Colors.white.withOpacity(0.1),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isError ? Icons.error_outline : Icons.inbox_outlined,
              size: responsive.getIconSize(64),
              color: theme.currencyTextColor ?? Colors.white70,
            ),
            SizedBox(height: responsive.getSpacing(16)),
            Text(
              displayMessage,
              style: TextStyle(
                fontSize: responsive.getFontSize(20),
                fontWeight: FontWeight.w500,
                color: theme.currencyTextColor ?? Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: responsive.getSpacing(8)),
            Text(
              isError 
                  ? 'Please check your connection and try again'
                  : 'There are no exchange rates available at this time',
              style: TextStyle(
                fontSize: responsive.getFontSize(14),
                color: (theme.currencyTextColor ?? Colors.white70).withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

