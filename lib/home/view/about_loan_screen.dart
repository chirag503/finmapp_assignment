import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:my_app/home/model/about_loan_model.dart';
import 'package:my_app/home/view/about_loan_detail_screen.dart';
import 'package:my_app/home/widget/section_questions_widget.dart';
import 'package:my_app/home/widget/single_question_with_footer_widget.dart';
import 'package:my_app/utils/helper_methods.dart';

class AboutLoanScreen extends StatefulWidget {
  const AboutLoanScreen({Key? key}) : super(key: key);

  @override
  State<AboutLoanScreen> createState() => _AboutLoanScreenState();
}

class _AboutLoanScreenState extends State<AboutLoanScreen> {
  int selectedIndex = 0;
  QuestionModel? data;
  QuestiionModelField? questiionModelField;

  @override
  void initState() {
    _parseJson();
    super.initState();
  }

  // Load and parse JSON data when the screen initializes
  Future<void> _parseJson() async {
    data = await HelperMethods().parseJson();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "About loan",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 22),
              child: Row(
                children: List.generate(
                  data?.schema?.fields?.length ?? 0,
                  (index) => Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == index ? Colors.green : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.only(right: 5),
                      height: 4,
                    ),
                  ),
                ),
              ),
            ),
            // Check if the current question is not of type "Section"
            if ((data?.schema?.fields?[selectedIndex].type ?? "") != "Section")
              SingleChoiceQuestionWithFooterWidget(
                showFooterRow: true,
                onchanged: (p0) {
                  data?.schema?.fields?[selectedIndex].schema?.answer =
                      p0?.value;
                  setState(() {});
                },
                onBack: () {
                  setState(() {
                    if (selectedIndex > 0) {
                      selectedIndex--;
                    }
                  });
                },
                onNext: () {
                  if ((data?.schema?.fields?.length ?? 0) - 1 > selectedIndex) {
                    if (data?.schema?.fields?[selectedIndex].schema?.name ==
                        "typeOFLoan") {
                      final isQuestionHidden = (data
                              ?.schema?.fields?[selectedIndex].schema?.answer !=
                          "Balance transfer & Top-up");
                      if (!isQuestionHidden) {
                        questiionModelField = data?.schema?.fields?.removeAt(3);
                      } else {
                        if (questiionModelField != null) {
                          data?.schema?.fields?.insert(3, questiionModelField!);
                        }
                      }
                    }
                    selectedIndex++;
                    setState(() {});
                  }
                },
                key: Key(selectedIndex.toString()),
                initialSelectedOption: data
                    ?.schema?.fields![selectedIndex].schema!.options
                    ?.firstWhereOrNull((element) =>
                        element.value ==
                        data?.schema?.fields![selectedIndex].schema!.answer),
                schema: (data?.schema?.fields![selectedIndex].schema ??
                    QuestiionModelSchema2()),
              )
            else
              SectionQuestionsWidget(
                fields: data?.schema?.fields![selectedIndex].schema!.fields,
                onBack: () {
                  setState(() {
                    if (selectedIndex > 0) {
                      selectedIndex--;
                    }
                  });
                },
                onNext: () {
                  final moreQuestionAvailable =
                      (data?.schema?.fields?.length ?? 0) - 1 > selectedIndex;
                  if (moreQuestionAvailable) {
                    selectedIndex++;
                    setState(() {});
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AboutLoanDetailScreen(
                            questionModel: data!,
                          );
                        },
                      ),
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
