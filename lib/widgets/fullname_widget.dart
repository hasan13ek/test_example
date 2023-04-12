import 'package:flutter/material.dart';

class FullNameWidget extends StatelessWidget {
  const FullNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Container(
      height: 64,
      width: 64,
      decoration: const BoxDecoration(
          color: Color(0xffE6E8EB),
          shape: BoxShape.circle
      ),
      child:  const Center(child: Text('K',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 32),),),
    ),
        const SizedBox(height: 8,),
        const Text('Константин Володарский',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        const SizedBox(height: 14,),
        Container(
          width: double.infinity,
          height: 1.4,
          color: const Color(0xffE6E8EB),
        ),
      ],
    );


  }
}
