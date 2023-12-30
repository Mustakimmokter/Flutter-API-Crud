
import 'package:flutter/material.dart';
import 'package:flutter_curd_with_api/shared/common_widgets/index.dart';

class CustomModalSheet extends StatelessWidget {
      const CustomModalSheet({super.key,
       required this.titleCTRL,
       required this.descriptionCTRL,
       required this.id,
        required this.onTap,
        required this.buttonTitle,
     });

     final TextEditingController titleCTRL,descriptionCTRL;
     final int id;
     final VoidCallback onTap;
     final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.maxFinite,
      height: size.height / 1.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: titleCTRL,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'Enter title',
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: descriptionCTRL,
                  decoration: const InputDecoration(
                    hintText: 'Enter description',
                  ),
                ),
              ],
            ),
            const Spacer(flex: 1),
            SizedBox(
              width: double.maxFinite,
              child: BottomButton(title: buttonTitle, onPressed: onTap,),
            ),
            const Spacer(flex: 10),
          ],
        ),
      ),
    );
  }
}
