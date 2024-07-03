import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  final TextEditingController title = TextEditingController();
  final TextEditingController image = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 10,),

            SizedBox(
              width: 200,
              child: TextFormField(
                controller: title,
                decoration: const InputDecoration(
                    hintText: "Title",
                  border: OutlineInputBorder()
                ),
              ),
            ),
            const SizedBox(height: 10,),

            SizedBox(
              width: 200,
              child: TextFormField(
                controller: desc,
                decoration: const InputDecoration(
                    hintText: "Description",
                    border: OutlineInputBorder()
                ),
              ),
            ),
            const SizedBox(height: 10,),

            SizedBox(
              width: 200,
              child: TextFormField(
                controller: price,
                decoration: const InputDecoration(
                    hintText: "Price",
                  border: OutlineInputBorder()
                ),
              ),
            ),
            const SizedBox(height: 10,),

            SizedBox(
              width: 200,
              child: TextFormField(
                controller: image,
                decoration: const InputDecoration(
                  hintText: "Image",
                  border: OutlineInputBorder()
                ),
              ),
            ),

            const SizedBox(height: 10,),

            ElevatedButton(onPressed: ()async{
             try{
               await FirebaseFirestore.instance.collection("product").add({
                 "title" : title.text,
                 "desc" : desc.text,
                 "image" : image.text,
                 "price" : price.text
               });
               Navigator.pop(context);
             }catch (ex){
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ex.toString())));
             }
            }, child: const Text("Add Data"))

          ],
        ),
      ),
    );
  }
}
