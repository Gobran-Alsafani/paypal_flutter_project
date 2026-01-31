import 'package:flutter/material.dart';

class Amount extends StatelessWidget {
  const Amount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 221, 234),
      appBar: AppBar(
        title: Text("رصيد PayPal"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 216, 221, 234),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 250,
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image(
                        image: AssetImage("images/paypal_icon.png"),
                        width: 30,
                      ),
                    ),
                    Text(
                      "PayPal رصيد",
                      style: TextStyle(fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  "0.00 USD",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "احدث الانشطة",
              style: TextStyle(fontSize: 18),
              textDirection: TextDirection.rtl,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              trailing: Icon(Icons.receipt),
              title: Text("التتبع بسهولة", textDirection: TextDirection.rtl),
              subtitle: Text(
                "المعاملات الجديدة ستظهر هنا",
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "استعراض الكل",
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 55, 255),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
