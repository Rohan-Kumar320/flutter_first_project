import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_teamwork/Cart.dart';
import 'package:furniture_shop_teamwork/add_data.dart';
import 'package:furniture_shop_teamwork/profilepage.dart';
import 'package:furniture_shop_teamwork/viewproduct.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainNavbar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> buttonLabels = ['Chair', 'Sofa', 'Table', 'Lamp', 'Wardrobe'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_basket_outlined),
            onPressed: () {
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_none_sharp),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddData(),));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 10,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Find modern",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 21,
                  fontFamily: 'Arial',
                ),
              ),
              Text(
                "furniture for you",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 21,
                  fontFamily: 'Arial',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search furniture',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: buttonLabels.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4), // Space between buttons
                      child: ElevatedButton(
                        onPressed: () {

                        },
                        child: Text(
                          buttonLabels[index],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),


              StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("product").snapshots(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      var dataLength = snapshot.data!.docs.length;
                      return  SizedBox(
                        height: 250,
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: dataLength,
                            scrollDirection: Axis.horizontal,

                            itemBuilder: (context, index) {

                              String title = snapshot.data!.docs[index]["title"];
                              String desc = snapshot.data!.docs[index]["desc"];
                              String image = snapshot.data!.docs[index]["image"];
                              String price = snapshot.data!.docs[index]["price"];

                              return  Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: GestureDetector(
                                  onDoubleTap: ()async{
                                    await FirebaseFirestore.instance.collection("Cart").add({
                                      "title" : title,
                                      "desc" : desc,
                                      "image" : image,
                                      "price" : price,
                                      "email" : "rohan@gmail.com"
                                    });
                                  },
                                  child: StackItem(
                                    imageUrl: image,
                                    title: title,
                                    description: desc,
                                    price: '\$$price',
                                  ),
                                ),
                              );
                            },),
                        ),
                      );
                    } if (snapshot.hasError) {
                      return Icon(Icons.error_outline);
                    } if(snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    return Container();
                  }),

              Button(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    StackItem(
                      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKo1atZN750uN-jAZh7I6bI48pmbmpigfZTQ&s",
                      title: 'Stylish Chair',
                      description: 'Recliners and living room seating...',
                      price: '\$150.99',
                    ),
                    SizedBox(width: 20),
                    StackItem(
                      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKo1atZN750uN-jAZh7I6bI48pmbmpigfZTQ&s",
                      title: 'Stylish Chair',
                      description: 'Recliners and living room seating...',
                      price: '\$299.99',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class StackItem extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;

  const StackItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  State<StackItem> createState() => _StackItem1State();
}

class _StackItemState extends State<StackItem> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: EdgeInsets.all(0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 180,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: Icon(Icons.favorite,color: Colors.red,
                    ),
                    onPressed: () {},)
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  height: 110,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'NEW',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor : Colors.grey,
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        Text(
                          widget.description,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.price,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(Icons.add_circle_outlined, color: Colors.black),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class Button extends StatefulWidget {
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Popular',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
            Text(
              'View all',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class _StackItem1State extends State<StackItem> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: EdgeInsets.all(0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 180,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: Icon(Icons.favorite,color: Colors.red,
                    ),
                    onPressed: () {},)
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  height: 110,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'NEW',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        Text(
                          widget.description,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.price,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(Icons.add_circle_outlined, color: Colors.black),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MainNavbar extends StatefulWidget {
  const MainNavbar({super.key});

  @override
  State<MainNavbar> createState() => _MainNavbarState();
}

class _MainNavbarState extends State<MainNavbar> {
  int currentIndex = 0;

  void pageShifter(index) {
    setState(() {
      currentIndex = index;
    });
  }

  List myScreens = [
    MyHomePage(),
    const viewproduct(),
    const cartapp(),
    const profilepage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],),
        child: BottomNavigationBar(
          iconSize: 18,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: currentIndex,
          onTap: pageShifter,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.chair_outlined), label: "Product"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "Profile"),
          ],
        ),
      ),
    );
  }
}