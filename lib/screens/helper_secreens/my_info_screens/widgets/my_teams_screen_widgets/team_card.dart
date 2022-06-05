import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (
      ){
        Navigator.pushNamed(context, "/TeamDetailScreen");
      },
      child:  SizedBox(
        height: 230,
        child: Stack(
          children: [
            Positioned(
              top: 25,
              left: 50,
              right: 0,
              child: Material(
                borderRadius: BorderRadius.circular(12),
                //color: Colors.red,
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(-10, 10),
                            blurRadius: 10,
                            spreadRadius:4,),
                      ]),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Card(
                elevation: 10,
                shadowColor: Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: 200,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/images/tsk.png"),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 45,
                left: 155,
                child: SizedBox(
                  height: 150,
                  width: 210,
                  child: Column(
                    children: <Widget> [
                      const Text(
                        "Türk Sporcu Kuvvetleri",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:const [
                          Chip(
                            label: Text(
                              "14 Üye",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.blueAccent,
                          ),
                          Chip(
                            label: Text(
                              "Ereğli/Zonguldak",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.blueAccent,
                          ),
                        ],
                      ),

                      Row(
                        children:const [
                          Chip(
                            label: Text(
                              "7 kez bu takımla oynandı.",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.blueAccent,
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
