import 'package:flutter/material.dart';
import 'package:my_app/home/model/about_loan_model.dart';
import 'package:my_app/home/widget/about_loan_footer_row.dart';
import 'package:my_app/home/widget/radio_button_tile.dart';

// Widget for rendering a single-choice question with an optional footer row
class SingleChoiceQuestionWithFooterWidget extends StatefulWidget {
  final QuestiionModelSchema2 schema;
  final Option? initialSelectedOption;
  final bool showFooterRow;
  final void Function()? onBack;
  final void Function()? onNext;
  final void Function(Option?)? onchanged;

  const SingleChoiceQuestionWithFooterWidget({
    Key? key,
    required this.schema,
    this.initialSelectedOption,
    this.onBack,
    this.onNext,
    required this.showFooterRow,
    this.onchanged,
  }) : super(key: key);

  @override
  State<SingleChoiceQuestionWithFooterWidget> createState() =>
      _SingleChoiceQuestionWithFooterWidgetState();
}

class _SingleChoiceQuestionWithFooterWidgetState
    extends State<SingleChoiceQuestionWithFooterWidget> {
  @override
  void initState() {
    widget.initialSelectedOption;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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

          // Render the footer row only if showFooterRow is not set to false
          if (widget.showFooterRow != false) ...[
            const Spacer(),
            AboutLoanFooterRow(
              onBack: widget.onBack,
              onNext: () {
                // Only invoke onNext callback if an answer is selected
                if (widget.schema.answer != null) {
                  widget.onNext?.call();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(milliseconds: 2),
                      content: Text("Please select the feild")));
                }
              },
            )
          ]
        ],
      ),
    );
  }
}
