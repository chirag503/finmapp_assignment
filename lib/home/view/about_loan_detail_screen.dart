import 'package:flutter/material.dart';
import 'package:my_app/home/model/about_loan_model.dart';
import 'package:my_app/home/widget/qa_widget.dart';

class AboutLoanDetailScreen extends StatelessWidget {
  final QuestionModel questionModel;
  const AboutLoanDetailScreen({super.key, required this.questionModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "About loan details",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: questionModel.schema?.fields?.length ?? 0,
              itemBuilder: (context, index) {
                final field = questionModel.schema?.fields?[index];

                if (field?.type != "Section") {
                  // Display QAWidget for non-section fields
                  return QAWidget(
                    question: field?.schema?.label ?? "",
                    answer: field?.schema?.answer ?? "",
                  );
                } else {
                  // Display a section with nested QAWidgets
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        field?.schema?.label ?? "",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        shrinkWrap: true,
                        itemCount: field?.schema?.fields?.length ?? 0,
                        itemBuilder: (context, index1) {
                          final subField = field?.schema?.fields?[index1];
                          // Display QAWidget for each sub-field in the section
                          return QAWidget(
                            question: subField?.schema?.label ?? "",
                            answer: subField?.schema?.answer ?? "",
                          );
                        },
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
