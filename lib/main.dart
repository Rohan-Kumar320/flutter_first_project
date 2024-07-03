import 'package:flutter/material.dart';
import 'package:furniture_shop_teamwork/mainview.dart';
import 'package:furniture_shop_teamwork/viewproduct.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainNavbar(),
    );
  }
}
// Stack(
// children: [
// Container(
// margin: EdgeInsets.symmetric(horizontal: 1),
// width: screenWidth ,
// height: 130,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(25),
// ),
// ),
//
// Positioned(
// left: 10,
// top: 8,
// child: Container(
// width: screenWidth * 0.3,
// height: 115,
// decoration: BoxDecoration(
// image: DecorationImage(
// fit: BoxFit.cover,
// image: NetworkImage(
// "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKo1atZN750uN-jAZh7I6bI48pmbmpigfZTQ&s"
// )
// ),
// borderRadius: BorderRadius.circular(25),
// ),
//
// )
// ),
//
// Positioned(
// left: 170,
// top: 25,
// child: Text("Stylish Chair",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
// ),
// Positioned(
// left: 170,
// top: 65,
// child: Icon(Icons.currency_pound_outlined,size: 32,color: Colors.black,),
// ),
// Positioned(
// left: 200,
// top: 65,
// child: Text("150.99",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
// ),
//
// Positioned(
// left: 325,
// top: 30,
// child: Container(
// width: 80,
// height: 35,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// color: Colors.black
// ),
// child: Padding(
// padding: const EdgeInsets.only(left: 20,top: 3),
// child: Text("- 1 +",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
// ),
// )
// )
// ]
// )
//
//
