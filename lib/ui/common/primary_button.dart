import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A simple primary button with text and an optional icon.
///
/// Required parameters:
/// * `text`: The text to display on the button.
/// * `onPressed`: The function to call when the button is tapped.
///
/// Optional parameters:
/// * `icon`: The icon to display after the text.
/// * `leadingIcon`: A widget to display before the button text.
/// * `width`: The width of the button. Default is null (takes available width).
/// * `height`: The height of the button. Default is 48.
/// * `enabled`: Whether the button is enabled or disabled. Default is true.
///
/// Example usage:
///
/// ```dart
/// PrimaryButton(
///   text: 'Sign up',
///   onPressed: () => print('Button tapped'),
///   icon: Icons.arrow_forward,
///   width: 300,
/// )
/// ```
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.icon,
    this.leadingIcon,
    this.width,
    this.height = 48,
    this.enabled = true,
  });

  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double height;
  final bool enabled;
  final IconData? icon;
  final Widget? leadingIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed:
            enabled
                ? () {
                  HapticFeedback.selectionClick();
                  onPressed();
                }
                : null,
        style: ElevatedButton.styleFrom(
          elevation: enabled ? 2 : 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadingIcon != null) ...[leadingIcon!, const SizedBox(width: 8)],
            Flexible(
              child: Text(text, overflow: TextOverflow.ellipsis, style: theme.textTheme.labelLarge),
            ),
            if (icon != null) ...[const SizedBox(width: 8), Icon(icon, size: 18)],
          ],
        ),
      ),
    );
  }
}
