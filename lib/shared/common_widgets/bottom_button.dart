import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key,this.title, required this.onPressed, this.child});
  final String? title;
  final VoidCallback onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
          elevation: MaterialStateProperty.all<double>(5),
        ),
        onPressed: onPressed,
        child: child ?? Text(title!,style: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
