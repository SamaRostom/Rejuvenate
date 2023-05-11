import 'package:flutter/material.dart';
import 'package:rejuvenate_mobile_app/utils/validations.dart';

enum AnswerTypeEnum { Yes, NO }

class AnswerType extends StatefulWidget {
  const AnswerType({super.key});

  @override
  State<AnswerType> createState() => _AnswerTypeState();
}

class _AnswerTypeState extends State<AnswerType> {
  AnswerTypeEnum? _answerTypeEnum;
  // final _answerTypeEnum = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile<AnswerTypeEnum>(
            activeColor: const Color.fromARGB(255, 1, 6, 29),
            value: AnswerTypeEnum.Yes,
            groupValue: _answerTypeEnum,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
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
          width: 10,
        ),
        Expanded(
          child: RadioListTile<AnswerTypeEnum>(
            activeColor: const Color.fromARGB(255, 1, 6, 29),
            value: AnswerTypeEnum.NO,
            groupValue: _answerTypeEnum,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
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
