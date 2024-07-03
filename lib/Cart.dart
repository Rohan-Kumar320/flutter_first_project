import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class cartapp extends StatelessWidget {
  const cartapp({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("My Cart",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.comment_bank_outlined),
          )
        ],
      ),


      body: SingleChildScrollView(

        child: Column(
          children: [
            SizedBox(height: 20,),
            ListView.builder(
              itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 1,vertical: 10),
                          width: screenWidth ,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),

                        Positioned(
                            left: 10,
                            top: 8,
                            child: Container(
                              width: screenWidth * 0.3,
                              height: 115,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKo1atZN750uN-jAZh7I6bI48pmbmpigfZTQ&s"
                                    )
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),

                            )
                        ),

                        Positioned(
                          left: 170,
                          top: 25,
                          child: Text("Stylish Chair",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        ),
                        Positioned(
                          left: 170,
                          top: 65,
                          child: Icon(Icons.currency_pound_outlined,size: 32,color: Colors.grey,),
                        ),
                        Positioned(
                          left: 200,
                          top: 65,
                          child: Text("150.99",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        ),

                        Positioned(
                            left: 325,
                            top: 30,
                            child: Container(
                              width: 80,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20,top: 3),
                                child: Text("- 1 +",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                              ),
                            )
                        )
                      ]
                  );
                },
            ),
            
            SizedBox(height: 20,),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Discount:",
                    style: TextStyle(fontSize: 25, color: Colors.grey),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "300.00",
                          style: TextStyle(fontSize: 25, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    "Total:",
                    style: TextStyle(fontSize: 25,),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20,left: 20),
                        child: Text(
                          "329.00",
                          style: TextStyle(fontSize: 25,),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),


            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                      backgroundColor:  MaterialStateProperty.all<Color>(Colors.black)
                ),
                  onPressed: (){},
                  child: Center(child: Text("Buy Now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
              ),
            ),

          ],
        ),
      ),

      // body: SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Column(
      //     children: [
      //       SizedBox(height: 50,),
      //       Stack(
      //         children: [
      //           Container(
      //             margin: EdgeInsets.symmetric(horizontal: 1),
      //             width: screenWidth ,
      //             height: 130,
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(25),
      //             ),
      //           ),
      //
      //           Positioned(
      //             left: 10,
      //               top: 8,
      //               child: Container(
      //                 width: screenWidth * 0.3,
      //                 height: 115,
      //                 decoration: BoxDecoration(
      //                   image: DecorationImage(
      //                     fit: BoxFit.cover,
      //                     image: NetworkImage(
      //                         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKo1atZN750uN-jAZh7I6bI48pmbmpigfZTQ&s"
      //                     )
      //                   ),
      //                   borderRadius: BorderRadius.circular(25),
      //                 ),
      //
      //               )
      //           ),
      //
      //           Positioned(
      //             left: 170,
      //               top: 25,
      //               child: Text("Stylish Chair",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
      //           ),
      //           Positioned(
      //             left: 170,
      //             top: 65,
      //             child: Icon(Icons.currency_pound_outlined,size: 32,color: Colors.black,),
      //           ),
      //           Positioned(
      //             left: 200,
      //             top: 65,
      //             child: Text("150.99",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
      //           ),
      //
      //           Positioned(
      //             left: 325,
      //               top: 30,
      //               child: Container(
      //            width: 80,
      //            height: 35,
      //            decoration: BoxDecoration(
      //              borderRadius: BorderRadius.circular(20),
      //              color: Colors.black
      //            ),
      //                 child: Padding(
      //                   padding: const EdgeInsets.only(left: 20,top: 3),
      //                   child: Text("- 1 +",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
      //                 ),
      //           )
      //           )
      //         ]
      //       )x`
      //     ],
      //   ),
      // ),
    );
  }
}
