import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zarea_admin/services/firebase_service.dart';

class VendorDetailsBox extends StatefulWidget {
  final String? uid;
  const VendorDetailsBox({Key? key, required this.uid}) : super(key: key);

  @override
  State<VendorDetailsBox> createState() => _VendorDetailsBoxState();
}

class _VendorDetailsBoxState extends State<VendorDetailsBox> {
  final FirebaseService _service = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _service.vendor.doc(widget.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            const Center(
              child: Text('Something Went Wrong'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Dialog(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  snapshot.data!['imageUrl'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Text(snapshot.data!['shopName']),
                                Text(snapshot.data!['dialog']),
                              ],
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 5,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    child: Text('Phone Number'),
                                  )),
                                  Container(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10, right: 10),
                                      child: Text(':'),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Text(snapshot.data!['mobile']),
                                  ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    child: Text('Email'),
                                  )),
                                  Container(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10, right: 10),
                                      child: Text(':'),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Text(snapshot.data!['email']),
                                  ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    child: Text('Address'),
                                  )),
                                  Container(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10, right: 10),
                                      child: Text(':'),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Text(snapshot.data!['address']),
                                  ))
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Divider(
                                thickness: 5,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    child: Text('Top Picked Status'),
                                  )),
                                  Container(
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Text(':'),
                                    ),
                                  ),
                                  Expanded(
                                    child:snapshot.data!['isTopPicked'] ?  Container(
                                      child: Chip(
                                        backgroundColor: Colors.indigo,
                                        label: Row(
                                        children: const [
                                          Icon(CupertinoIcons.checkmark),
                                          Text('Top Picked', style: TextStyle(color: Colors.white),),
                                        ],
                                      ),),
                                    ) : Container(),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Divider(thickness: 5,),
                            ),
                            Wrap(
                              children:  [
                                SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: Card(
                                    color: Colors.orangeAccent.withOpacity(0.9),
                                    elevation: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(
                                            CupertinoIcons.money_dollar_circle,
                                            color: Colors.black54,
                                            size: 50,
                                          ),
                                          Text('Total Revenue'),
                                          Text('12k'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: Card(
                                    color: Colors.orangeAccent.withOpacity(0.9),
                                    elevation: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(
                                            CupertinoIcons.cart_fill,
                                            color: Colors.black54,
                                            size: 50,
                                          ),
                                          Text('Active Order'),
                                          Text('6'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: Card(
                                    color: Colors.orangeAccent.withOpacity(0.9),
                                    elevation: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(
                                            CupertinoIcons.bag_fill,
                                            color: Colors.black54,
                                            size: 50,
                                          ),
                                          Text('Order'),
                                          Text('106'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: Card(
                                    color: Colors.orangeAccent.withOpacity(0.9),
                                    elevation: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(
                                            Icons.grain_rounded,
                                            color: Colors.black54,
                                            size: 50,
                                          ),
                                          Text('Products'),
                                          Text('Toatal Products 106'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: Card(
                                    color: Colors.orangeAccent.withOpacity(0.9),
                                    elevation: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(
                                            CupertinoIcons.list_number_rtl,
                                            color: Colors.black54,
                                            size: 50,
                                          ),
                                          Text('Statement'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    child: snapshot.data!['accVerified']  ? Chip(
                        backgroundColor: Colors.indigo,
                        label: Row(
                      children: const [
                        Icon(Icons.check, color: Colors.white,),
                        SizedBox(width: 2,),
                        Text('Active')
                      ],
                    )):Chip(
                      backgroundColor: Colors.redAccent,
                      label: Row(
                      children: const [
                        Icon(Icons.highlight_remove, color: Colors.white,),
                        SizedBox(width: 2,),
                     Text('Inactive'),
                    ],
                  ),
                 ),
                )
              ],
            ),
          );
        });
  }
}
