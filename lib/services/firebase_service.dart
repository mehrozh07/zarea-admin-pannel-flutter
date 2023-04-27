

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference reference = FirebaseFirestore.instance.collection('slider');
  final CollectionReference vendor = FirebaseFirestore.instance.collection('vendor');

  Future<DocumentSnapshot> getAdminCredentials(id) {
  var result = FirebaseFirestore.instance.collection('admin').doc(id).get();
  return result;
  }

  updateVendorStatus({id, status}){
    vendor.doc(id).update({
      'accountVerified': status? false : true,
    });
  }
}