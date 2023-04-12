import 'package:flutter/material.dart';
import 'package:test_example/screens/tab/complaint_page/complaint_page.dart';



// ignore: must_be_immutable
class ComplaintCommentaryWidget extends StatefulWidget {
   ComplaintCommentaryWidget({Key? key,required this.complainText}) : super(key: key);
  String complainText;
  @override
  State<ComplaintCommentaryWidget> createState() => _ComplaintCommentaryWidgetState();
}

class _ComplaintCommentaryWidgetState extends State<ComplaintCommentaryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          complaintText,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'Отправьте жалобу, если пользователь рассылает рекламные сообщения, комментарии или другим способом распространяет рекламу в непредназначенных для этого местах.',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Комментарий (необязательно)',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color(0xff808C9A)),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
