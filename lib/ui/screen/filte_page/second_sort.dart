import 'package:flutter/material.dart';
import 'package:testapp/ui/screen/person_details_page/person_details_page.dart';
import 'package:testapp/ui/widgets/app_text_view.dart';
import 'package:testapp/util/app_constants.dart';

class SecondSort extends StatefulWidget {
  const SecondSort({Key? key}) : super(key: key);

  @override
  State<SecondSort> createState() => _SecondSortState();
}

class _SecondSortState extends State<SecondSort> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount:3,
                itemBuilder: (BuildContext context, int index) {

                  return Container(
                    padding: commonPaddingAll5,
                    margin: commonPaddingAll,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Container(
                          child: appTextView(name:"Name"),
                        ),
                        Container(
                          child: appTextView(name:"Age"),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          )),
    );
  }
}
