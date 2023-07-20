import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';

class CartScreen extends StatefulWidget {
  static const String id = 'cart_screen';
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Color pill_B_Bg = Colors.white;
  Color pill_A_Bg = Colors.black;
  Color pill_B_Txt = Colors.black;
  Color pill_A_Txt = Colors.white;

  void onTapCart() {
    setState(() {
      pill_B_Bg = Colors.white;
      pill_A_Bg = Colors.black;
      pill_B_Txt = Colors.black;
      pill_A_Txt = Colors.white;
    });
  }

  void onTapSaved() {
    setState(() {
      pill_B_Bg = Colors.black;
      pill_A_Bg = Colors.white;
      pill_B_Txt = Colors.white;
      pill_A_Txt = Colors.black;
    });
  }

  final itemList = [
    {
      'image': 'assets/icons/cancel.png',
      'title': 'Item 1',
      'desc': 'price',
    },
    {
      'image': 'assets/icons/cancel.png',
      'title': 'Item 2',
      'desc': 'price',
    },
    {
      'image': 'assets/icons/cancel.png',
      'title': 'Item 3',
      'desc': 'price',
    },
    {
      'image': 'assets/icons/cancel.png',
      'title': 'Item 1',
      'desc': 'price',
    },
    {
      'image': 'assets/icons/cancel.png',
      'title': 'Item 2',
      'desc': 'price',
    },
    {
      'image': 'assets/icons/cancel.png',
      'title': 'Item 3',
      'desc': 'price',
    }
  ];

  double translateX = 0.0;
  double translateY = 0.0;
  double myWidth = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    print('yes');
                  },
                  child: Image.asset(
                    'assets/icons/save.png',
                    width: 32,
                    height: 32,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 70,
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: pill_A_Bg,
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 2.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: GestureDetector(
                        child: Text(
                          'Your cart',
                          style: TextStyle(color: pill_A_Txt),
                        ),
                        onTap: onTapCart,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: pill_B_Bg,
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: GestureDetector(
                        child: Text(
                          'Saved',
                          style: TextStyle(color: pill_B_Txt),
                        ),
                        onTap: onTapSaved,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  final item = itemList[index];
                  return Padding(
                    padding: (index == 0)
                        ? const EdgeInsets.symmetric(vertical: 15.0)
                        : const EdgeInsets.only(bottom: 15.0),
                    child: Slidable(
                      key: Key('$item'),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                                itemList.removeAt(index);
                              });
                            },
                            borderRadius: BorderRadius.circular(20),
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1.0,
                                spreadRadius: 1.0,
                                color: Colors.grey[400]!),
                          ],
                        ),
                        // ListView row
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                item['image']!,
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title']!,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  item['desc']!,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                alignment: Alignment.center,
                                width: 20,
                                height: 20,
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                ' 3 ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                alignment: Alignment.center,
                                width: 20,
                                height: 20,
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // preorder
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    flex: 4,
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  child: Image.asset(
                                    'assets/icons/save.png',
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Preorder',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          TextButton(
                            onPressed: () {},
                            child: Container(
                              alignment: Alignment.center,
                              // width: 20,
                              height: 30,
                              child: Text(
                                '11:00 am',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),

                // Amount
                Expanded(
                    flex: 6,
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Expanded(
                            child: GestureDetector(
                              child: Image.asset(
                                'assets/icons/save.png',
                                width: 32,
                                height: 32,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('Rs 540'),
                          Text('amount'),
                          SizedBox(height: 20),
                        ],
                      ),
                    )),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            // bottom Slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              //https://pub.dev/packages/slide_to_act_reborn
              child: SlideAction(
                borderRadius: 20,
                innerColor: Colors.white,
                outerColor: Colors.grey,
                elevation: 0,
                sliderButtonIcon: const Icon(
                  Icons.shopping_basket,
                  color: Colors.black,
                ),
                text: 'Slide to place order',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
                sliderRotate: false,
                onSubmit: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('>>>'),
                    Text(' Slide to place order'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
