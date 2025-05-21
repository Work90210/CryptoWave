import 'package:cryptowave/ui/common/app_bar.dart';
import 'package:cryptowave/ui/common/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// A stateless widget that displays a message and an error SVG image when something goes wrong.
///
/// Required parameters:
/// * `title`: The title of the page.
/// * `onRefreshPage`: A callback function to refresh the page when the 'Refresh' button is pressed.
/// * `errorMessage`: The error message to display.
///
/// Optional parameters:
/// * `onBackPressed`: A callback function to navigate to the previous page when the back button is pressed.
/// * `displayAppBar`: Whether to display the app bar. Defaults to true.
///
/// Example usage:
///
/// ```dart
/// LoadFailedWidget(
///   title: 'Failed to load page',
///   onRefreshPage: () {},
///   errorMessage: 'An error occurred',
///   onBackPressed: () {},
/// )
/// ```
class LoadFailedWidget extends StatelessWidget {
  const LoadFailedWidget({
    required this.title,
    required this.onRefreshPage,
    required this.errorMessage,
    super.key,
    this.displayAppBar = true,
    this.onBackPressed,
  });
  final String title;
  final String errorMessage;
  final bool displayAppBar;
  final void Function() onRefreshPage;
  final void Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: displayAppBar ? CWAppBar(context, title: title) : null,
      body: Center(
        child: Column(
          children: [
            Expanded(flex: 3, child: Lottie.asset('assets/lottie/error.json', width: 500)),
            Text(errorMessage, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 24),
            PrimaryButton(text: 'Refresh', onPressed: onRefreshPage),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
