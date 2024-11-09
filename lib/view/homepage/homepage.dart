import 'package:flutter/material.dart';
import 'package:luminartest/controller/homepage_controller.dart';
import 'package:luminartest/view/productpage/productpage.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<HomepageController>(listen: false, context).fetchallproducts();
    return Scaffold(
      appBar: AppBar(
        title: Text("homepage"),
      ),
      body: Consumer<HomepageController>(
        builder: (context, homeprovider, child) {
          if (homeprovider.allproducts.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: homeprovider.allproducts.length,
            itemBuilder: (context, index) {
              final product = homeprovider.allproducts[index];
              final data = product.data;
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Productpage(
                              productid: product.id,
                            ),
                          ));
                    },
                    child: ListTile(
                      title: Text(product.name ?? "No Name"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data?.color != null
                              ? 'Color:${data!.color}'
                              : 'Color:Nil'),
                          Text(data?.capacity != null
                              ? 'Capcity:${data!.capacity}'
                              : 'Capacity:Nil'),
                          Text(data?.capacityGb != null
                              ? 'Capcity:${data!.capacityGb}'
                              : 'Capacity:Nil'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
