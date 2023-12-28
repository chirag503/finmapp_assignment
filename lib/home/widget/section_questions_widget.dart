import 'package:flutter/material.dart';
import 'package:my_app/home/model/about_loan_model.dart';
import 'package:my_app/home/widget/about_loan_footer_row.dart';
import 'package:my_app/home/widget/single_choice_question_widget.dart';
import 'package:my_app/home/widget/textfeild_question_widget.dart';
import 'package:collection/collection.dart';

// Widget for rendering a set of questions within a section
class SectionQuestionsWidget extends StatefulWidget {
  final List<QuestiionModelField>? fields;
  final void Function()? onBack;
  final void Function()? onNext;

  const SectionQuestionsWidget({
    Key? key,
    this.fields,
    this.onBack,
    this.onNext,
  }) : super(key: key);

  @override
  State<SectionQuestionsWidget> createState() => _SectionQuestionsWidgetState();
}

class _SectionQuestionsWidgetState extends State<SectionQuestionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 5),
              shrinkWrap: true,
              itemCount: widget.fields?.length ?? 0,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemBuilder: (context, index) {
                return widget.fields?[index].type == "SingleSelect"
                    ? SingleChoiceQuestionWidget(
                        onchanged: (p0) {
                          widget.fields![index].schema?.answer = p0?.value;
                          setState(() {});
                        },
                        showFooterRow: false,
                        schema: widget.fields![index].schema!,
                        initialSelectedOption: widget
                            .fields?[index].schema?.options
                            ?.firstWhereOrNull((element) =>
                                element.value ==
                                widget.fields?[index].schema?.answer),
                      )
                    : TextFeildQuestionWidget(
                        keyboardType: widget.fields?[index].type == "Numeric"
                            ? TextInputType.number
                            : TextInputType.text,
                        initialValue: widget.fields?[index].schema?.answer,
                        onChanged: (val) {
                          widget.fields?[index].schema?.answer = val;
                          setState(() {});
                        },
                        label: widget.fields?[index].schema?.label ?? "",
                      );
              },
            ),
          ),
          // Render the footer row with "Back" and "Next" buttons
          AboutLoanFooterRow(
            onBack: widget.onBack,
            onNext: () {
              // Check if any question in the section has an empty answer
              if (!(widget.fields?.firstWhereOrNull((element) =>
                      (element.schema?.answer == null ||
                          element.schema!.answer!.isEmpty)) !=
                  null)) {
                widget.onNext?.call();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 2),
                    content: Text("Please select the all feild")));
              }
            },
          )
        ],
      ),
    );
  }
}
