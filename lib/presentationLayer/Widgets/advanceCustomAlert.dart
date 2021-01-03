import 'package:flutter/material.dart';

class AdvanceCustomAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 270,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
              child: Column(
                children: [
                  Text('كود خصم', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(height: 5,),
                  Text('احصل علي خصم 25% لجميع المنتجات الخاصة بنا من خلال هذا الكود',
                   style: TextStyle(fontSize: 14),),
                  SizedBox(height: 5,),
                  RaisedButton(onPressed: () {
                    Navigator.of(context).pop();
                  },
                    color: Colors.grey[400],
                    child: Text('MMZ010', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),),
                  ),
                  RaisedButton(onPressed: () {
                    Navigator.of(context).pop();
                  },
                    color: Colors.redAccent,
                    child: Text('اذهب الي المتجر', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: -60,
            child: CircleAvatar(
              backgroundColor: Colors.redAccent,
              radius: 60,
              child: Icon(Icons.assistant_photo, color: Colors.white, size: 50,),
            )
          ),
        ],
      )
    );
  }
}
