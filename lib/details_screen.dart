import 'package:flutter/material.dart';

import 'cappucinno_list.dart';

class DetailsScreen extends StatefulWidget {
  final cappuccino;

  const DetailsScreen({super.key, this.cappuccino});
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 21, 32, 1),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage(
                              'images/${widget.cappuccino['image']}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white24,
                          child: Icon(
                            Icons.arrow_back,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Cappucinno',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              GestureDetector(
                                onTap: (){

                                  setState(() {
                                    widget.cappuccino['favorite'] = !widget.cappuccino['favorite'];

                                  });

                                },
                                child: widget.cappuccino['favorite']
                                    ?  Icon(
                                  Icons.favorite_outline,
                                  size: 35,
                                  color: Colors.red,
                                ) : Icon(
                                  Icons.favorite_outline,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                widget.cappuccino['name'].toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white70),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 15,
                                  ),
                                  Text(
                                    widget.cappuccino['rating'].toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const Text(
                        'A single espresso shot poured into hot foamy milk with the surface topped with mildly sweetened coca powder and drizzled with scrumptious caramel syrup',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white70,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Choice of Milk',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 10,
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: choiceMilk.length,
                                itemBuilder: (context, index) {
                                  final milk = choiceMilk[index];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        milk['selected'] = !milk['selected'];
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: milk['selected']
                                              ? Color.fromRGBO(239, 227, 200, 1)
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 1.8,
                                              color: Color.fromRGBO(
                                                  239, 227, 200, 1))),
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        milk['name'],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: milk['selected']
                                              ? Color.fromRGBO(32, 21, 32, 1)
                                              : Color.fromRGBO(
                                                  239, 227, 200, 1),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Price',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white70),
                              ),
                              Text(
                                '\$${widget.cappuccino['price']}',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white70),
                              )
                            ],
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                              child: SizedBox(
                                height: 50,
                                child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(239, 227, 200, 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            child: Text(
                                'Buy now'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(32, 21, 32, 1)),
                            ),
                          ),
                              ))
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
