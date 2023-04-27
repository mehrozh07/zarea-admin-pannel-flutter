import 'package:chips_choice/chips_choice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zarea_admin/services/firebase_service.dart';
import 'package:zarea_admin/widgets/vendor_details_box.dart';

class VendorManage extends StatefulWidget {
  const VendorManage({Key? key}) : super(key: key);

  @override
  State<VendorManage> createState() => _VendorManageState();
}

class _VendorManageState extends State<VendorManage> {
  int tag = 1;
  List<String> options = [
    'All Vendor', 'Active vendor', 'Inactive vendor',
    'Top Picked', 'Top Rated',
  ];
   bool? topPicked;
   bool? active;
  filter(val){
   if(val == 1){
     setState(() {
       active = true;
     });
   }
   if(val == 1){
     setState(() {
       active = false;
     });
   }
   if(val == 3){
     setState(() {
       topPicked = true;
     });
   }
   if(val == 0){
     setState(() {
       topPicked = null;
       active = null;
     });
   }
  }
  final FirebaseService _services = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChipsChoice<int>.single(
          value: tag,
          onChanged: (val) {
            setState((){
              tag = val;
            });
          },
          choiceItems: C2Choice.listFrom<int, String>(
            source: options,
            activeStyle: (i,v){const
            C2ChoiceStyle(color:Colors.black54,
                brightness: Brightness.dark);
              return null;},
            value: (i, v) => i,
            label: (i, v) => v,
          ),
        ),
        const Divider(thickness: 5,),
        StreamBuilder(
          stream: _services.reference
              .where('topPicked', isEqualTo: topPicked)
              .where('accVerified', isEqualTo: active)
              .orderBy('shopName', descending: true).snapshots(),
            builder: (context ,  AsyncSnapshot snapShot){
          if(snapShot.hasError){
            return const Text('Something Went Wrong');
          }
          if(snapShot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                showBottomBorder: true,
                dataRowHeight: 60,
                headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
                columns: const <DataColumn>[
                  DataColumn(label: Text('Active/Inactive')),
                  DataColumn(label: Text('Top Picked')),
                  DataColumn(label: Text('Shop Name')),
                  DataColumn(label: Text('Rating')),
                  DataColumn(label: Text('Total Sales')),
                  DataColumn(label: Text('Mobile')),
                  DataColumn(label: Text('Email')),
                ],
                rows: vendorRowData(snapShot.data, _services) ,
            ),
          );
        }),
      ],
    );
  }

  List<DataRow> vendorRowData(QuerySnapshot querySnapshot,FirebaseService service){
    List<DataRow> newList = querySnapshot.docs.map((DocumentSnapshot documentSnapshot){
      return DataRow(cells: [
        DataCell(IconButton(
            onPressed: (){
              service.updateVendorStatus(
                  id: documentSnapshot['uid'],
                  status: documentSnapshot['accVerified']
              );
            },
            icon: documentSnapshot['accVerified'] ?
            const Icon(CupertinoIcons.checkmark_seal_fill, color: Colors.indigo,)
                : const Icon(Icons.remove_circle, color: Colors.red,),
        ),),
        DataCell(IconButton(
          onPressed: (){},
          icon: documentSnapshot['isTopPicked'] ?
          const Icon(CupertinoIcons.checkmark_seal_fill, color: Colors.indigo,)
              : const Icon(null,),
        ),),
        DataCell(Text(documentSnapshot['shopName'])),
        DataCell(Row(children: [
          const Icon(Icons.star_border),
          Text(documentSnapshot['rating'])
        ],)),
        DataCell(Text(documentSnapshot['mobile'])),
        DataCell(Text(documentSnapshot['email'])),
        DataCell(IconButton(
            onPressed: (){
              showDialog(context: context, builder: (BuildContext context){
                return VendorDetailsBox(uid: documentSnapshot['uid']);
              });
            },
            icon: const Icon(Icons.info_outline))),
      ]);
    }).toList();
    return newList;
  }
}
