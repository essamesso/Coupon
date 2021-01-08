import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class AdvanceCustomAlert extends StatelessWidget {
  final String text = "mmz010";
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

                  Container(
                                width: MediaQuery.of(context).size.width / 3,
                                height: 35,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/copy.jpg"),
                                        fit: BoxFit.fill)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      child: Text(text),
                                      onTap: () async {
                                        await FlutterClipboard.copy(text);
                                        Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content:
                                                  Text("✓  تم نسخ كود الخصم")),
                                        );
                                      },
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.content_copy),
                                        onPressed: () async {
                                          await FlutterClipboard.copy(text);
                                          Scaffold.of(context).showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    "✓  تم نسخ كود الخصم")),
                                          );
                                        })
                                  ],
                                ),
                              ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: InkWell(
                                        child: Container(
                                          width: MediaQuery.of(context).size.width / 3,
                                  height: 35,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), 
                                  color: Colors.redAccent,),
                        
                        child: Center(child: Text('اذهب الي المتجر', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),)),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: -50,
            child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/noon.jpg'),
                                radius: 50),
          ),
        ],
      )
    );
  }
}
