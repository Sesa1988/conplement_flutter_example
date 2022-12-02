import 'package:flutter/material.dart';

class RetryAction extends StatelessWidget {
  final Function _function;

  const RetryAction(this._function);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.sentiment_dissatisfied_outlined, size: 64),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () => _function(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
