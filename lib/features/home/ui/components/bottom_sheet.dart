
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_curd_with_api/features/home/provider/home_provider.dart';
import 'package:flutter_curd_with_api/shared/common_widgets/index.dart';
import 'package:flutter_curd_with_api/shared/models/products.dart';
import 'package:provider/provider.dart';

class CustomModalSheet extends StatelessWidget {
      const CustomModalSheet({super.key,
       required this.titleCTRL,
       required this.descriptionCTRL,
        required this.buttonTitle,
        required this.id,
     });

     final TextEditingController titleCTRL,descriptionCTRL;
     final String buttonTitle;
     final int id;

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
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
              child:  Consumer<HomeProvider>(
                builder: (context, products, child) {
                  return BottomButton(
                    onPressed:  ()async{
                      if(titleCTRL.text.isNotEmpty && descriptionCTRL.text.isNotEmpty){
                        final  body = Products(
                            title: titleCTRL.text,
                            description: descriptionCTRL.text
                        );
                        final response = await homeProvider.updateData(id,body);
                        if(response.statusCode == 200){
                          const snackBar = SnackBar(content: Text('Successfully updated'),duration: Duration(seconds: 1),);
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          descriptionCTRL.clear();
                          titleCTRL.clear();
                        }

                      }else{

                      }
                    },
                    child: Row(
                      children: [
                        Spacer(flex: products.isUpdate ? 8: 10,),
                        const Text('Submit',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        const Spacer(flex: 6,),
                        products.isUpdate ? const SizedBox():
                        const SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(color: Colors.white,),
                        ),
                        const Spacer(flex: 2,),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Spacer(flex: 10),
          ],
        ),
      ),
    );
  }
}
