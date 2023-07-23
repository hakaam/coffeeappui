import 'package:flutter/material.dart';
import '../cappucinno_list.dart';
import '../details_screen.dart';

class CappuccinoTab extends StatelessWidget {
  const CappuccinoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 3 / 6,
        ),
        itemCount: Cappuccinos.length,
        itemBuilder: (context, index) {
          final cappuccino = Cappuccinos[index];
          return Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(54, 44, 54, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(cappuccino: cappuccino),
                            ),
                          );
                        },
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage('images/${cappuccino['image']}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(54, 44, 54, 0.7),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                            Text(
                              cappuccino['rating'].toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    cappuccino['name'].toString(),
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(70, 61, 70, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          '\$${cappuccino['price']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(239, 227, 200, 1),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: Color.fromRGBO(70, 61, 70, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
