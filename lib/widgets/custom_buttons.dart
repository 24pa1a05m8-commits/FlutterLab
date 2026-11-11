import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// PrimaryActionButton provides a customized, elevated CTA button
/// with an icon and responsive touch effects.
class PrimaryActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isFullWidth;

  const PrimaryActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppTheme.primary,
        foregroundColor: foregroundColor ?? Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        elevation: 2,
        shadowColor: (backgroundColor ?? AppTheme.primary).withOpacity(0.35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );

    if (isFullWidth) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }
    return button;
  }
}

/// SecondaryActionButton provides an outlined action button
/// with consistent border and typography.
class SecondaryActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? borderColor;
  final Color? foregroundColor;
  final bool isFullWidth;

  const SecondaryActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.borderColor,
    this.foregroundColor,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final button = OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor ?? AppTheme.primary,
        side: BorderSide(
          color: borderColor ?? AppTheme.primary,
          width: 1.5,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );

    if (isFullWidth) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }
    return button;
  }
}

/// SocialIconButton displays an interactive branded social media icon.
class SocialIconButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final Color color;
  final VoidCallback onTap;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(
              color: color.withOpacity(0.25),
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            size: 19,
            color: color,
          ),
        ),
      ),
    );
  }
}

/// SocialLinksRow groups LinkedIn, Instagram, and Website social links.
class SocialLinksRow extends StatelessWidget {
  final VoidCallback onLinkedInTap;
  final VoidCallback onInstagramTap;
  final VoidCallback onWebsiteTap;

  const SocialLinksRow({
    super.key,
    required this.onLinkedInTap,
    required this.onInstagramTap,
    required this.onWebsiteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SocialIconButton(
          icon: Icons.business_center_outlined, // LinkedIn representation
          tooltip: 'Connect on LinkedIn',
          color: const Color(0xFF0077B5),
          onTap: onLinkedInTap,
        ),
        const SizedBox(width: 8),
        SocialIconButton(
          icon: Icons.camera_alt_outlined, // Instagram representation
          tooltip: 'Follow on Instagram',
          color: const Color(0xFFE1306C),
          onTap: onInstagramTap,
        ),
        const SizedBox(width: 8),
        SocialIconButton(
          icon: Icons.language_outlined, // Website
          tooltip: 'Visit Official Website',
          color: AppTheme.primary,
          onTap: onWebsiteTap,
        ),
      ],
    );
  }
}
