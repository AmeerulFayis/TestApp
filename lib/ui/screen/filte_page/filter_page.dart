import 'package:flutter/material.dart';
import 'package:testapp/ui/screen/filte_page/second_sort.dart';
import 'package:testapp/ui/widgets/app_text_view.dart';
import 'package:testapp/util/app_color.dart';
import 'package:testapp/util/app_constants.dart';

import 'first_sort.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.darkGreen,
        title: Text("Sort by Age or Name"),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: (){
 Navigator.push(context, MaterialPageRoute(builder: (context)=>const FirstSort()));
            },
            child: Container(
              height: 60,
              padding: commonPaddingAll,
              margin: commonPaddingAll5,
              decoration: BoxDecoration(
                color:Colors.green.shade900,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appTextView(name: "0 to 10",fontWeight: FontWeight.bold,size: 20,color: AppColor.white),
                  Icon(Icons.arrow_forward_ios_outlined,color: AppColor.white,)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SecondSort()));
            },
            child: Container(
              height: 60,
              padding: commonPaddingAll,
              margin: commonPaddingAll5,
              decoration: BoxDecoration(
                  color:Colors.green.shade900,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appTextView(name: "10 to 20",fontWeight: FontWeight.bold,size: 20,color: AppColor.white),
                  Icon(Icons.arrow_forward_ios_outlined,color: AppColor.white,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
