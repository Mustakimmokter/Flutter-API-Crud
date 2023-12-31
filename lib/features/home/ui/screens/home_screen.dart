import 'package:flutter/material.dart';
import 'package:flutter_curd_with_api/features/home/ui/components/bottom_sheet.dart';
import 'package:flutter_curd_with_api/features/post/ui/screen/post_screen.dart';
import 'package:flutter_curd_with_api/shared/common_widgets/index.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  late TextEditingController _titleCTRL ;
  late TextEditingController _descriptionCTRL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        color: Colors.cyan,
        onRefresh: ()async {
        },
        child: Stack(
          children: [
            ListView.builder(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 60),
              itemCount: 6,
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
                              gradient: const LinearGradient(
                                colors: [
                                Colors.red,
                                Colors.blue
                              ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter
                              ),
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(14)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Products title',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'products rating}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'products price}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          Text(
                            'Products description}',
                            style: TextStyle(overflow: TextOverflow.ellipsis),
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
                            _titleCTRL = TextEditingController(text: 'Title');
                            _descriptionCTRL = TextEditingController(text: 'Des');
                            showModalBottomSheet(context: context, builder: (context) {
                              return CustomModalSheet(
                                buttonTitle: 'Save',
                                titleCTRL: _titleCTRL,
                                descriptionCTRL: _descriptionCTRL,
                                id: 1,
                                onTap: (){
                                },
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
                          onTap: (){
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
        ),
      ),
    );
  }
}
