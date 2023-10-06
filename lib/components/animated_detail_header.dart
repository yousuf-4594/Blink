import 'dart:ui';
import 'package:food_delivery/classes/restaurant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/classes/menu.dart';

class AnimatedDetailHeader extends StatelessWidget {
  const AnimatedDetailHeader(
      {Key? key,
      required this.topPercent,
      required this.bottomPercent,
      required this.restaurant
      // required this.menu,
      })
      : super(key: key);

  // final restraunt menu;
  final double topPercent;
  final double bottomPercent;
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final image = 'images/kfc.jpg';

    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: restaurant,
          child: Material(
            child: ClipRect(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: (20 + topPadding) * (1 - bottomPercent),
                      bottom: 160 * (1 - bottomPercent),
                    ),
                    child: Transform.scale(
                      scale: lerpDouble(1, 1.3, bottomPercent)!,
                      child: PlaceImagesPageView(images: image),
                    ),
                  ),
                  Positioned(
                      top: topPadding,
                      left: -60 * (1 - bottomPercent),
                      child: BackButton(
                        color: Colors.white,
                      )),
                  Positioned(
                      top: topPadding,
                      right: -60 * (1 - bottomPercent),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        ),
                        color: Colors.white,
                      )),
                  Positioned(
                      top: lerpDouble(-30, 140, topPercent)!
                          .clamp(topPadding + 10, 140),
                      left: lerpDouble(60, 20, topPercent)!.clamp(20.0, 50.0),
                      right: 20,
                      child: AnimatedOpacity(
                        duration: kThemeAnimationDuration,
                        opacity: bottomPercent < 1 ? 0 : 1,
                        child: Text(
                          restaurant.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: lerpDouble(30, 40, 2 * topPercent),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'britanic',
                          ),
                        ),
                      )),
                  Positioned(
                    left: 25,
                    top: 220,
                    child: AnimatedOpacity(
                      duration: kThemeAnimationDuration,
                      opacity: bottomPercent < 1 ? 0 : 1,
                      child: Opacity(
                        opacity: topPercent,
                        child: Text(
                          restaurant.ownerName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: null,
          bottom: -140 * (1 - topPercent),
          child: TranslateAnimation(
            child: MenuInfoContainer(),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(color: Colors.white, height: 10),
        ),
        Positioned.fill(
          top: null,
          child: TranslateAnimation(
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(
                      30, 10), // Adjust the values for the ellipse
                  topRight: Radius.elliptical(
                      30, 10), // Adjust the values for the ellipse
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MenuInfoContainer extends StatelessWidget {
  const MenuInfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 236, 236, 236),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Colors.grey),
                Container(
                  margin: EdgeInsets.only(top: 3, left: 3),
                  child: Text(
                    "4.3 ",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 3),
                  child: Text(
                    "(4k+)",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.access_time_rounded, color: Colors.grey, size: 17),
                  Container(
                    child: Text(
                      " 40-50 min    100rs minimum",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class TranslateAnimation extends StatelessWidget {
  const TranslateAnimation({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1, end: 0),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutBack,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 50 * value),
          child: child!,
        );
      },
      child: child,
    );
  }
}

class PlaceImagesPageView extends StatefulWidget {
  const PlaceImagesPageView({
    super.key,
    required this.images,
  });

  // final List<String> images;
  final images;

  @override
  State<PlaceImagesPageView> createState() => _PlaceImagesPageViewState();
}

class _PlaceImagesPageViewState extends State<PlaceImagesPageView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: 5,
            onPageChanged: (value) {
              setState(() => currentIndex = value);
              print("current page: ${value}");
            },
            physics: const BouncingScrollPhysics(),
            controller: PageController(viewportFraction: .9),
            itemBuilder: (context, index) {
              const imageUrl = 'images/kfc.jpg';
              final isSelected = currentIndex == index;
              return AnimatedContainer(
                duration: kThemeAnimationDuration,
                margin: EdgeInsets.only(
                  right: 10,
                  top: isSelected ? 5 : 20,
                  bottom: isSelected ? 5 : 20,
                ),
                child: GestureDetector(
                  onTap: () {
                    print(index);
                  },
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  image: DecorationImage(
                    image: AssetImage('images/kfc.jpg'),
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black26, BlendMode.darken),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, // <-- ITEM COUNT
              (index) {
            final isSelected = currentIndex == index;
            return AnimatedContainer(
              duration: kThemeAnimationDuration,
              color: isSelected ? Colors.black38 : Colors.black12,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              height: 3,
              width: isSelected ? 20 : 10,
            );
          }),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
