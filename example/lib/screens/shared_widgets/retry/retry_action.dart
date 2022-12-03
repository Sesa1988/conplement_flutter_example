import 'package:flutter/material.dart';

class RetryAction extends StatelessWidget {
  final Function _function;
  final Widget _content;

  const RetryAction(this._function, this._content);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        fit: StackFit.expand,
        children: [
          _contentWrapper(),
          Column(
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
        ],
      ),
    );
  }

  Widget _contentWrapper() {
    return AbsorbPointer(
      child: AnimatedOpacity(
        child: _content,
        opacity: 0.2,
        duration: const Duration(milliseconds: 300),
      ),
    );
  }
}
