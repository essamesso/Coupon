import 'package:copoun/presentationLayer/Pages/favourite/favourite_screen.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[350],
        centerTitle: true,
        title: Text(
          "نحن هنا من أجلك",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.pop(context, false);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                  "نحن هنا من أجلك",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              
              Text(
                "فريق العمل يعمل علي مدار اليوم",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "للرد علي كل استفساراتكم واستقبال اقنراحاتكم",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  child: Row(
                    
                    children: [
                      Image.asset(
                        "assets/images/mail.png",
                        width: 34,
                        height: 34,
                        color: Colors.blueAccent,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Email",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FavouriteScreen()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/instagram.png",
                        width: 34,
                        height: 34,
                        color: Colors.pinkAccent,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Instagram",
                          style: TextStyle(
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FavouriteScreen()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/facebook.png",
                        width: 34,
                        height: 34,
                        color: Colors.indigo[400],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Facebook",
                          style: TextStyle(
                              color: Colors.indigo[400],
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FavouriteScreen()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/twitter.png",
                        width: 34,
                        height: 34,
                        color: Colors.blue,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Twitter",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FavouriteScreen()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/telegram.png",
                        width: 30,
                        height: 30,
                        color: Colors.lightBlue[400],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Telegram",
                          style: TextStyle(
                              color: Colors.lightBlue[400],
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FavouriteScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
