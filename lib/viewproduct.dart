import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furniture_shop_teamwork/Cart.dart';


class viewproduct extends StatefulWidget {
  const viewproduct({super.key});

  @override
  State<viewproduct> createState() => _viewproductState();
}

class _viewproductState extends State<viewproduct> {

  void cart(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const cartapp()),
    );
  }
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(

      body:
          // Stack(
          //   children: [
          //     Container(
          //       width: screenWidth,
          //       height: 750,
          //       decoration: BoxDecoration(
          //         color: Colors.grey,
          //         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80),bottomRight: Radius.circular(80))
          //       ),
          //     ),
          //
          //     Positioned(
          //       left: 100,
          //       top: 700,
          //       child: Container(
          //         width: screenWidth * 0.7,
          //         height: 300,
          //         decoration: BoxDecoration(
          //             color: Colors.blue
          //         ),
          //       ),
          //     ),
      Stack(
        children: [
          Column(
            children: [
              Container(
                width: screenWidth,
                height: 700,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://www.home-designing.com/wp-content/uploads/2022/06/plush-upholstered-round-rocking-chair-modern-papasan-chairs-for-sale-online-wooden-base-black-metal-frame-orange-diamond-tufted-velvet-upholstery-luxe-rocker-600x600.jpg"
                    )
                  )
                ),
              ),
            ],
          ),
          Positioned(
            left: screenWidth * 0.05, // Center horizontally
            top: 520, // Half of the second container's height
            child: Container(
              width: screenWidth * 0.9,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0.3, 0.3),
                    spreadRadius: 8,
                    blurRadius: 8
                  )
                ]
              ),
            ),
          ),
            Positioned(
              left: screenWidth * 0.1,
                top: 540,
                child: Text("Curved Chair",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)
            ),

          Positioned(
              left: screenWidth * 0.1,
              top: 590,
              child: Row(
                children: [
                  Icon(Icons.euro_outlined,size: 35,),
                  Text(" 320",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                ],
              )
          ),


          Positioned(
            left: screenWidth * 0.1,
              top: 640,
              child: Row(
                children: [
                  Icon(Icons.star,color: Colors.yellow[700],size: 32,),
                  Text(" 4.8",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("   (347 reviews)",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
                ],
              )
          ),
              Positioned(
                left: screenWidth * 0.1,
                top: 680,
                  child: Container(
                    width: screenWidth * 0.6,
                      child: Text("Our Products Combine Functional Utility With Elegance...",style: TextStyle(fontWeight: FontWeight.bold),)
                  ),
              ),

            Positioned(
              left: screenWidth * 0.17,
              top: 735,
              child: Container(
                width: screenWidth * 0.67,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:  MaterialStateProperty.all<Color>(Colors.black)
                  ),
                    onPressed: (){},
                    child: Text("Buy Now",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                ),
              ),
            ),

          Positioned(
            left: screenWidth * 0.17,
            top: 775,
            child: Container(
              width: screenWidth * 0.67,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:  MaterialStateProperty.all<Color>(Colors.black)
                  ),
                  onPressed: (){ return cart(); },
                  child: Text("Add To Cart",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
              ),
            ),
          ),

            Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                    ),
                  ),

                  Spacer(),

                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Icon(Icons.favorite,color: Colors.red,),
                  ),





            ],
          )
        ],
      ),


    );
  }
}
