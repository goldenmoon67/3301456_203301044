import 'package:flutter/material.dart';
import 'package:halisaha_app/screens/widgets/always_use/my_scaffold.dart';

class MyFeaturesScreen extends StatelessWidget {
  const MyFeaturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffoldWithAppbar(
      appTitle: "Özelliklerim",
      mybody: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: <Widget>[
                  _buildFeatures("Hızlı"),  _buildFeatures("Güçlü"),  _buildFeatures("Kaptan"),  _buildFeatures("Bitirici"),  _buildFeatures("Frikikçi"),  _buildFeatures("Kafacı"),  _buildFeatures("Kasap"),
            ],
          )


        ),
      ),
    );
  }

  Widget _buildFeatures(String text,) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red,
        shape: BoxShape.circle,
        //borderRadius: BorderRadius.circular(100)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_circle_outline_rounded,
            size: 35,
            color: Colors.white,
          ),
          Text(
            text,
            style:const  TextStyle(
                color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),

    );
  }
}
