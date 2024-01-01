// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_curd_with_api/features/home/provider/home_provider.dart';
import 'package:flutter_curd_with_api/features/home/ui/components/bottom_sheet.dart';
import 'package:flutter_curd_with_api/features/post/ui/screen/post_screen.dart';
import 'package:flutter_curd_with_api/shared/common_widgets/index.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  late TextEditingController _titleCTRL ;
  late TextEditingController _descriptionCTRL;

  @override
  Widget build(BuildContext context){
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: homeProvider.products.isNotEmpty ?
      Stack(
        children: [
        Consumer<HomeProvider>(
          builder: (context, products, child) {
            return   ListView.builder(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 60),
              itemCount: products.products.length,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // thumbnail
                    GestureDetector(
                      onTap: (){
                        print('View');
                      },
                      child: Hero(
                        tag: 'image$index',
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(14),
                            image: DecorationImage(
                              image: NetworkImage(products.products[index].image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            products.products[index].title!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            'Products description${products.products[index].description}',
                            style: const TextStyle(),
                            maxLines: 2,
                          ),
                          Text(
                            'Rating: ${products.products[index].rating!.rate}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'products price: ${products.products[index].price}',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Edit
                        GestureDetector(
                          onTap: (){
                            _titleCTRL = TextEditingController(text: products.products[index].title);
                            _descriptionCTRL = TextEditingController(text: products.products[index].description);
                            showModalBottomSheet(context: context, builder: (context) {
                              return CustomModalSheet(
                                buttonTitle: 'Save',
                                titleCTRL: _titleCTRL,
                                descriptionCTRL: _descriptionCTRL,
                                id: products.products[index].id!,
                              );
                            },);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(Icons.edit,size: 18,color: Colors.white,),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Delete Button
                        GestureDetector(
                          onTap: ()async{
                            final response = await homeProvider.deleteData(products.products[index].id!);
                            if(response.statusCode == 200){
                              const snackBar = SnackBar(content: Text('Successfully Deleted'),duration: Duration(seconds: 1),);
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(Icons.delete,size: 18,color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 14,
            child: BottomButton(
              title: 'Add New Item',
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>PostScreen()));
              },
            ),
          ),
        ],
      ):
      const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
