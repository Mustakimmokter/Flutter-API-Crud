
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_curd_with_api/features/home/ui/screens/home_screen.dart';
import 'package:flutter_curd_with_api/features/post/provider/post_provider.dart';
import 'package:flutter_curd_with_api/shared/common_widgets/index.dart';
import 'package:flutter_curd_with_api/shared/models/post_model.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: PostScreenBody(),
    );
  }
}

class PostScreenBody extends StatelessWidget {
  PostScreenBody({super.key});
  
  final TextEditingController _titleCTRL = TextEditingController();
  final TextEditingController _descriptionCTRL = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
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
              controller: _titleCTRL,
            ),
            //const Text('Required title',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500),),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'Enter description',
              controller: _descriptionCTRL,
            ),
            //const Text('Required title',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500),),
            const SizedBox(height: 30),
            BottomButton(
             child: Consumer<PostProvider>(
               builder: (context, postUpdate, child) {
                 return Row(
                   children: [
                     Spacer(flex: postUpdate.isUploaded? 8: 10,),
                     const Text('Submit',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                     const Spacer(flex: 6,),
                     postUpdate.isUploaded? SizedBox():
                     const SizedBox(
                       width: 25,
                       height: 25,
                       child: CircularProgressIndicator(color: Colors.white,),
                     ),
                     const Spacer(flex: 2,),
                   ],
                 );
               },
             ),
              onPressed: ()async{
                if(_titleCTRL.text.isNotEmpty && _descriptionCTRL.text.isNotEmpty){
                  final  body = PostModel(
                      title: _titleCTRL.text,
                      body: _descriptionCTRL.text
                  );
                  final response = await  postProvider.postData(body);
                  if(response.statusCode == 201){
                    const snackBar = SnackBar(content: Text('Successful Added'),duration: Duration(seconds: 1),);
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>HomeScreen()), (route) => false);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    _descriptionCTRL.clear();
                    _titleCTRL.clear();
                  }
                }

              },
            ),
            const Spacer(flex: 5,),
          ],
        ),
      ),
    );
  }
}
