import 'package:flutter/material.dart';
import 'package:medical/data/doctor_list.dart';
import 'package:medical/shared/widgets/custom_text.dart';


class NameDoctorsScreen extends StatelessWidget {
  const NameDoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Doctors',
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          itemBuilder: (context,index) => buildItem(index),
        itemCount: doctors.length,
      ),
    );
  }

  Widget buildItem(index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(
              doctors[index]['image'].toString(),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              CustomText(text: doctors[index]['name'].toString()),
            ],
          )
        ],
      ),
    );
  }
}
