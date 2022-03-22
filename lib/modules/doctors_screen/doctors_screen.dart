import 'package:flutter/material.dart';
import 'package:medical/shared/widgets/custom_text.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Doctors Screen',
        ),
      ),
      body: const Center(
        child: CustomText(
          text: 'Doctors Screen',
          textStyle: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
