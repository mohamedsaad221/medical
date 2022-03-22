import 'package:flutter/material.dart';
import 'package:medical/modules/name_doctors/name_doctors_screen.dart';
import 'package:medical/shared/helper/constance.dart';
import 'package:medical/shared/widgets/components.dart';
import 'package:medical/shared/widgets/custom_text.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Medical Center',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 15),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                navigateTo(context, const NameDoctorsScreen());
              },
              child: Row(
                children:
                [
                  Container(
                    width: 180,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(1, 1), // changes position of shadow
                        ),
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 50,
                          color: primaryColor,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const CustomText(text: 'Heart Center')
                      ],
                    )
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: Container(
                      width: 180,
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(1, 1), // changes position of shadow
                          ),
                        ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.medical_services,
                            size: 50,
                            color: primaryColor,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const CustomText(text: 'Analysis Center')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){
                navigateTo(context, const NameDoctorsScreen());
              },
              child: Row(
                children:
                [
                  Container(
                    width: 180,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(1, 1), // changes position of shadow
                        ),
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.accessibility,
                          size: 50,
                          color: primaryColor,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const CustomText(text: 'Radiology Center')
                      ],
                    )
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: Container(
                      width: 180,
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(1, 1), // changes position of shadow
                          ),
                        ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 50,
                            color: primaryColor,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const CustomText(text: 'Surgery Center')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
