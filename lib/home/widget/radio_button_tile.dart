import 'package:flutter/material.dart';
import 'package:my_app/home/model/about_loan_model.dart';

/// Custom radio button tile for displaying options
class RadioButtonTile extends StatefulWidget {
  final Option option;
  final QuestiionModelSchema2 schema;
  final bool isSelected;
  final void Function(Option?)? onchanged;
  const RadioButtonTile({
    Key? key,
    required this.option,
    required this.schema,
    required this.isSelected,
    this.onchanged,
  }) : super(key: key);

  @override
  State<RadioButtonTile> createState() => _RadioButtonTileState();
}

class _RadioButtonTileState extends State<RadioButtonTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: true,
      horizontalTitleGap: 0,
      visualDensity: const VisualDensity(horizontal: -2, vertical: -3.5),
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              width: widget.isSelected ? 2 : 1,
              color: widget.isSelected ? Colors.orange : Colors.black),
          borderRadius: BorderRadius.circular(4)),
      title: Text(
        widget.option.value ?? "", // Display the option's value as the title
        style: TextStyle(
          color: widget.isSelected ? Colors.orange : Colors.black,
        ),
      ),
      leading: Radio<Option?>(
        activeColor: Colors.orange,
        value: widget.option,
        groupValue: widget.isSelected && widget.schema.options != null
            ? widget.option
            : null,
        onChanged: (value) {
          widget.onchanged!(
              value); // Trigger the callback when the option changes
        },
      ),
    );
  }
}
