import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
   const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  //Build Ui
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container( 
        
        //padding inside 

        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          //Color of button
          color: Theme.of(context).colorScheme.secondary,

          //curved 

          borderRadius: BorderRadius.circular(12),
        ),
        
        
         child:Center(child: Text(text, style: TextStyle(fontWeight: FontWeight.bold,
         fontSize: 16,))),),
    );
  }
}