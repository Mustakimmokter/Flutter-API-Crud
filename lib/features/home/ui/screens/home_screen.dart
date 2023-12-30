import 'package:flutter/material.dart';
import 'package:flutter_curd_with_api/features/post/ui/screen/post_screen.dart';
import 'package:flutter_curd_with_api/shared/common_widgets/index.dart';
import 'package:flutter_curd_with_api/shared/http_request/http_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              padding: const EdgeInsets.all(20),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        // thumbnail
                        GestureDetector(
                          onTap: (){
                            print('View');
                          },
                          child: Hero(
                            tag: 'image$index',
                            child: Container(
                              height: 120,
                              width: 120,
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
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Expanded(
                                    child: Text(
                                      'Products title',
                                      style: TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  // Edite Button
                                  GestureDetector(
                                    onTap: (){

                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.cyan,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Icon(Icons.edit,size: 18,color: Colors.white,),
                                    ),
                                  )
                                ],
                              ),
                              const Text('Products description}',
                                style: TextStyle(overflow: TextOverflow.ellipsis),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
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
                                    ],
                                  ),
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
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
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
