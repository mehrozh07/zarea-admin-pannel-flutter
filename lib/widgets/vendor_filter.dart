import 'package:flutter/material.dart';

class VendorFilterWidget extends StatelessWidget {
  const VendorFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ActionChip(
              elevation: 3,
              backgroundColor: Colors.black54,
              onPressed: (){},
                label: const Text('All Vendors', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),),
            ),
            ActionChip(
              elevation: 3,
              backgroundColor: Colors.black54,
              onPressed: (){},
              label: const Text('Active', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),),
            ),
            ActionChip(
              elevation: 3,
              backgroundColor: Colors.black54,
              onPressed: (){},
              label: const Text('InActive', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),),
            ),
            ActionChip(
              elevation: 3,
              backgroundColor: Colors.black54,
              onPressed: (){},
              label: const Text('Top Rated', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),),
            ),
            ActionChip(
              elevation: 3,
              backgroundColor: Colors.black54,
              onPressed: (){},
              label: const Text('Top Picked', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
