import 'package:flutter/material.dart';

import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/circular_container.dart';

/// Most of the styling is already defined in the Utils Themes Chip Theme.
class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) != null;

    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      shape: isColor ? const CircleBorder() : null,
      labelStyle: TextStyle(
        color: selected ? Colors.white : null,
      ),
      labelPadding: isColor ? const EdgeInsets.all(0) : null,
      padding: isColor ? const EdgeInsets.all(0) : null,
      backgroundColor: isColor ? THelperFunctions.getColor(text) : null,
      avatar: isColor
          ? TCircularContainer(
        width: 50,
        height: 50,
        backgroundColor: THelperFunctions.getColor(text)!,
      )
          : null,
    );
  }
}
