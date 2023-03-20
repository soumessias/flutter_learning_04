import 'package:app_04/data/dummy_data.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductsOverviewPage extends StatelessWidget {
  final List<Product> loadedProducts = dummyProducts;
  ProductsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 40,
            ),
            width: double.infinity,
            height: 100,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 158, 223, 1),
            ),
            child: Image.asset(
              "assets/images/title_app.png",
              height: 50,
            ),
          ),
          Container(
            height: 742,
            width: double.infinity,
            child: ListView.separated(
              itemCount: loadedProducts.length,
              padding: EdgeInsets.all(20),
              itemBuilder: ((context, index) {
                return Center(
                  child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.1),
                          offset: Offset(3, 3),
                          blurRadius: 5,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: NetworkImage(
                                loadedProducts[index].imageUrl,
                              ),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 80,
                                  ),
                                  Container(
                                    height: 120,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              Color.fromRGBO(0, 158, 223, 1),
                                              Colors.white
                                                  .withOpacity(0.000001),
                                            ])),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, bottom: 5),
                                    child: Column(
                                      children: [
                                        Text(
                                          loadedProducts[index].title,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              separatorBuilder: (context, index) => const SizedBox(
                height: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
