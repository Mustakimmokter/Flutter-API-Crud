
import 'package:flutter/material.dart';
import 'package:flutter_curd_with_api/shared/common_widgets/index.dart';


class PostScreen extends StatelessWidget {
  PostScreen({super.key});
  
  final TextEditingController titleCTRL = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 1,),
            IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back,color: Colors.cyan,),
            ),
            const Spacer(flex: 5,),
            CustomTextField(
              hintText: 'Enter title',
              controller: titleCTRL,
            ),
            //const Text('Required title',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500),),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'Enter description',
              controller: titleCTRL,
            ),
            //const Text('Required title',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500),),
            const SizedBox(height: 30),
            BottomButton(
              title: 'Submit',
              onPressed: (){},
            ),
            const Spacer(flex: 5,),
          ],
        ),
      ),
    );
  }
}
