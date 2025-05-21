import 'dart:async';

import 'package:flutter/material.dart';

/// A widget that displays a loading indicator at the center of the screen.
/// After a specified timeout, it can show a retry button.
class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key, this.onRetry, this.timeoutSeconds = 10});
  final VoidCallback? onRetry;
  final int timeoutSeconds;

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  bool _showRetry = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.onRetry != null) {
      _timer = Timer(Duration(seconds: widget.timeoutSeconds), () {
        if (mounted) {
          setState(() {
            _showRetry = true;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_showRetry)
              CircularProgressIndicator(color: Theme.of(context).colorScheme.primary),
            if (_showRetry && widget.onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(onPressed: widget.onRetry, child: const Text('Try Again')),
            ],
          ],
        ),
      ),
    );
  }
}
