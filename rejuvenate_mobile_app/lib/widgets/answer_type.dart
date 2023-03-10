import 'package:flutter/material.dart';

enum AnswerTypeEnum { Yes, NO }

class AnswerType extends StatefulWidget {
  const AnswerType({super.key});

  @override
  State<AnswerType> createState() => _AnswerTypeState();
}

class _AnswerTypeState extends State<AnswerType> {
  AnswerTypeEnum? _answerTypeEnum;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile<AnswerTypeEnum>(
            value: AnswerTypeEnum.Yes,
            groupValue: _answerTypeEnum,
            tileColor: Colors.cyan.shade200,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(color: Colors.white, width: 2.0)),
            title: Text(AnswerTypeEnum.Yes.name),
            onChanged: (val) {
              setState(() {
                _answerTypeEnum = val;
              });
            },
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Expanded(
          child: RadioListTile<AnswerTypeEnum>(
            value: AnswerTypeEnum.NO,
            groupValue: _answerTypeEnum,
            tileColor: Colors.cyan.shade200,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
            ),
            title: Text(AnswerTypeEnum.NO.name),
            onChanged: (val) {
              setState(
                () {
                  _answerTypeEnum = val;
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
