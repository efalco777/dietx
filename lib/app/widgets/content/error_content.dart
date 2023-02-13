import 'package:flutter/material.dart';

class ErrorContent extends StatelessWidget {
  final VoidCallback onRefresh;

  const ErrorContent({
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('An error has occured!'),
          ElevatedButton(
            onPressed: onRefresh,
            child: const Text('Refresh'),
          ),
        ],
      ),
    );
  }
}
