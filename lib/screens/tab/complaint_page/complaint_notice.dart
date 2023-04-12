import 'package:flutter/material.dart';

class ComplaintNoticeWidget extends StatefulWidget {
  const ComplaintNoticeWidget({Key? key}) : super(key: key);

  @override
  State<ComplaintNoticeWidget> createState() => _ComplaintNoticeWidgetState();
}

class _ComplaintNoticeWidgetState extends State<ComplaintNoticeWidget> {
  @override
  Widget build(BuildContext context) {
    return

     Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/success.png',scale: 1.6,),
              Positioned(top: 30,left: 26,child: Image.asset('assets/images/img.png',scale: 1.6,))
            ],
          ),
            const SizedBox(height: 24,),
            const Text('Спасибо!',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
          const SizedBox(height: 12,),
          const Text('Модераторы скоро рассмотрят вашу жалобу.',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
          const SizedBox(height: 24,),
        ],
      );

  }
}
