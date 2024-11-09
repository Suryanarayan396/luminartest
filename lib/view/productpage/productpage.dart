import 'package:flutter/material.dart';
import 'package:luminartest/controller/productpage_controller.dart';
import 'package:provider/provider.dart';

class Productpage extends StatelessWidget {
  final String? productid;
  const Productpage({super.key, this.productid});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductpageController>(listen: false, context)
        .fetchproduct(id: int.parse(productid ?? '0'));

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
      ),
      body: Consumer<ProductpageController>(
        builder: (context, productprov, child) {
          if (productprov.isloading) {
            return Center(child: CircularProgressIndicator());
          }
          final product = productprov.productobj;
          if (product == null) {
            return Center(
              child: Text("No Product detail available"),
            );
          }

          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${product.name ?? "No name"}'),
                SizedBox(
                  height: 20,
                ),
                Text("Specifications"),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text("Color:${product.data?.color ?? "Not Available"}"),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            'Capacity:\n ${product.data?.capacity ?? 'Not Available'}')
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
