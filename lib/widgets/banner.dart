import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zarea_admin/services/firebase_service.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firebaseService.reference.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
      if(snapshot.hasError){
        const Text('Something Went Wrong');
      }
      if(snapshot.connectionState == ConnectionState.waiting){
        return const CircularProgressIndicator();
      }
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data!.docs.map((DocumentSnapshot document){
              return Stack(
                children: [
                  SizedBox(
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Card(
                        elevation: 10,
                        child: Image.network(document['image'], width: 500,fit: BoxFit.fill, ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                      top: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.amber,
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline)),
                      )
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
