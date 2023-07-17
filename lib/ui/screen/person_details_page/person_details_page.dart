import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:testapp/ui/screen/filte_page/filter_page.dart';
import 'package:testapp/ui/widgets/app_text_view.dart';

import '../../../util/app_color.dart';
import '../../../util/app_constants.dart';

class PersonDetails extends StatefulWidget {
  const PersonDetails({Key? key}) : super(key: key);

  @override
  State<PersonDetails> createState() => _PersonDetailsState();
}

class _PersonDetailsState extends State<PersonDetails> {
  TextEditingController searchController = TextEditingController();


 Future<void>getData()async{
   final ref = FirebaseDatabase.instance.ref();
   final snapshot = await ref.child('Persons').get();
   for(var element in snapshot.children){
     log("++++++++++++++++++++${element.child("Name").value}");
     log("++++++++++++++++++++${element.child("Age").value}");
     persons.add(PersonsModel(element.child("Name").value.toString(),element.child("Age").value.toString()));
     setState(() {

     });
   }

 }

  @override
  void initState() {
   getData();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: commonPaddingAll,
                height: 40,
                padding: const EdgeInsets.only(left: 5),
                width: screenWidth(context) / 1.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColor.blue)),
                child: TextField(
                  controller: searchController,
                  enabled: true,
                  textInputAction: TextInputAction.search,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColor.grey,
                    ),
                    border: InputBorder.none,
                    hintText: "Search Products...",
                    hintStyle: TextStyle(color: AppColor.blue, fontSize: 15),
                  ),
                ),
              ),
              IconButton(onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterPage()));
              }, icon: const Icon(Icons.filter_list))
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: persons.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: commonPaddingAll,
                margin: commonPaddingAll,
                decoration: BoxDecoration(
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    appTextView(name:persons[index].name),
                    dividerSSH(),
                    appTextView(name: persons[index].age),
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
class PersonsModel{
String name;
String age;
PersonsModel(this.name, this.age);
}
List<PersonsModel>persons=[];