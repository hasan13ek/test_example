import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_example/data/models/complaint_model.dart';
import 'package:test_example/screens/tab/complaint_page/complaint_commentary.dart';
import 'package:test_example/screens/tab/complaint_page/complaint_notice.dart';
import 'package:test_example/utils/constants.dart';
import 'package:test_example/utils/my_utils.dart';
import 'package:test_example/view_models/complaint_view_model.dart';
import 'package:test_example/widgets/fullname_widget.dart';
import 'package:test_example/widgets/global_button.dart';



class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

bool question = true;
bool commentary = false;
bool notice = false;
String complaintText = '';
TextEditingController commentaryController = TextEditingController();


class _ComplaintScreenState extends State<ComplaintScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formGlobalKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 60, left: 1, right: 1),
          child:
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(right: 10)),
                commentary == true  ? IconButton(onPressed: (){
                  commentary = false;
                  question = true;
                  notice = false;
                  setState(() {

                  });
                }, icon: Icon(Icons.arrow_back)) : Container(),
                const FullNameWidget(),
                const SizedBox(
                  height: 24,
                ),
                if (question == true)
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      'Что на странице   Контантина кажется вам недопустимым?',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                if (question == true)
                  ...List.generate(Constants.complaints.length, (index) {
                    return ListTile(
                      onTap: () {
                        question = false;
                        commentary = true;
                        complaintText = Constants.complaints[index];
                        setState(() {

                        });
                      },
                      title: Text(
                        Constants.complaints[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                    );
                  }),
                if (notice == false && commentary == true)
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
                    child: Column(
                      children: [
                        ComplaintCommentaryWidget(complainText: complaintText),
                        TextFormField(
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                          onChanged: (v) {},
                          minLines: 6,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          maxLines: 6,
                          validator: (v) =>
                          v != null && v.length < 3
                              ? "Enter at least 4 character !"
                              : null,
                          controller: commentaryController,
                          keyboardType: TextInputType.text,
                          decoration:
                          getInputDecoration(label: "Опишите причину жалобы"),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        GlobalButton(
                          isActive: true,
                          buttonText: 'Отправить жалобу',
                          onTap: () {
                            if (formGlobalKey.currentState!.validate()) {
                              formGlobalKey.currentState!.save();

                              ComplaintModel complaintModel = ComplaintModel(toUserId: 1, category: complaintText, text: commentaryController.text);
                              Provider.of<ComplaintViewModel>(context,listen: false).createComplaint(complaintModel: complaintModel);
                              // if(context.read<ComplaintViewModel>().isSuccess == true){
                                commentary = false;
                                notice = true;
                                commentaryController.clear();
                                setState(() {});
                              // }

                            }

                          },
                        )
                      ],
                    ),
                  ),
                if (question == false && commentary == false)
                  Padding(
                    padding: const EdgeInsets.only(top: 100,left: 16,right: 16),
                    child: Column(
                      children: [
                        ComplaintNoticeWidget(),
                        GlobalButton(isActive: true, buttonText: 'Закрыть', onTap: (){
                          notice = false;
                          question = true;
                          setState(() {

                          });
                        },)
                      ],
                    ),
                  ),
              ],
            ),
          )
        )) ,);

  }
}
