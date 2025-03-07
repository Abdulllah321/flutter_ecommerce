import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = "View all" ,
    this.onButtonPressed,
  });

  final String title;
  final String? buttonTitle;
  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (buttonTitle != null && onButtonPressed != null)
          TextButton(
            onPressed: onButtonPressed,
            child: Text(buttonTitle!),
          ),
      ],
    );
  }
}
