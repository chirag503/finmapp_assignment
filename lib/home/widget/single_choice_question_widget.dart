import 'package:flutter/material.dart';
import 'package:my_app/home/model/about_loan_model.dart';
import 'package:my_app/home/widget/radio_button_tile.dart';

// Widget for rendering a single-choice question with an optional footer row
class SingleChoiceQuestionWidget extends StatefulWidget {
  final QuestiionModelSchema2 schema;
  final Option? initialSelectedOption;
  final bool showFooterRow;
  final void Function()? onBack;
  final void Function()? onNext;
  final void Function(Option?)? onchanged;

  const SingleChoiceQuestionWidget({
    Key? key,
    required this.schema,
    this.initialSelectedOption,
    this.onBack,
    this.onNext,
    required this.showFooterRow,
    this.onchanged,
  }) : super(key: key);

  @override
  State<SingleChoiceQuestionWidget> createState() =>
      _SingleChoiceQuestionWidgetState();
}

class _SingleChoiceQuestionWidgetState
    extends State<SingleChoiceQuestionWidget> {
  @override
  void initState() {
    widget.initialSelectedOption;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.schema.label ?? "",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        ListView.separated(
          padding: const EdgeInsets.only(top: 5),
          shrinkWrap: true,
          itemCount: widget.schema.options?.length ?? 0,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemBuilder: (context, index) {
            return RadioButtonTile(
                schema: widget.schema,
                isSelected: widget.initialSelectedOption ==
                    widget.schema.options?[index],
                option: widget.schema.options![index],
                onchanged: widget.onchanged);
          },
        ),
      ],
    );
  }
}
