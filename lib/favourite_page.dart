import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        centerTitle: true,
        title: Text(
          'Your Cart',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 20.0);
        },
        itemBuilder: (BuildContext context, int index) {
          return FavouriteWidget(
            image : "images/coffee3.jpeg",
            coffeeName: "Jamaican Mountain Coffee",
            coffeeShop: "Marwa Cafe",
            price: "4.25",
            );
        },
      ),
    );
  }
}

class FavouriteWidget extends StatelessWidget {

  final String image;
  final String coffeeName;
  final String coffeeShop;
  final String price;

  const FavouriteWidget({Key? key, required this.image, required this.coffeeName, required this.coffeeShop, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: Get.height * 0.2 - 20,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff171b22),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          imageDisplay(),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                coffeeNameDisplay(),
                coffeeInfoDisplay(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    priceDisplay(),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffd17842),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Icon(Icons.delete,
                          size: 30, color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Row priceDisplay() {
    return Row(
      children:[
        Text(
          "\$\t",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xffd17842),
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Text coffeeInfoDisplay() {
    return Text(
      coffeeShop,
      style: TextStyle(
        color: Color(0xffaeaeae),
      ),
    );
  }

  Text coffeeNameDisplay() {
    return Text(
      coffeeName,
      style: TextStyle(
        fontSize: 17,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Expanded imageDisplay() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 2.0,
              spreadRadius: 1.0,
              color: Color(0xff30221f),
            ),
          ],
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              image
            ),
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
