import 'package:beauty_app/api_service/get_product_data_service.dart';
import 'package:beauty_app/componets/container.dart';
import 'package:beauty_app/componets/text.dart';
import 'package:flutter/material.dart';

import '../models/GetBeautyDataModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const CommonText(text: "Shopx", color: Colors.black, size: 24),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.apps),
          ),
        ],
      ),
      body: FutureBuilder(
        future: GetProductData.getproductdetails(),
        builder: (BuildContext context, AsyncSnapshot<List<GetBeutyDataModel?>?> snapshot) {
        if(snapshot.connectionState == ConnectionState.done)
          {
            return Column(
              children: [
                Expanded(
                    child: GridView.builder(
                      itemCount: snapshot.data!.length,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 290,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final product = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                          },
                          child: CommonContainer(
                            height: height * 0.2,
                            width: width,
                            color: Colors.white,
                            boxshadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),spreadRadius: 1,blurRadius: 2,)],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                /// image

                                Padding(
                                  padding: EdgeInsets.only(left: 15,right: 15),
                                  child: SizedBox(
                                    height: height * 0.2,
                                    width: width,
                                    child: Image.network(
                                      product!.imageLink!.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: height * 0.015,
                                ),
                                /// product title
                                Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: CommonText(
                                      text: product.name,
                                      maxlines: 2,
                                      size: 15,
                                      fontweight: FontWeight.bold,
                                      color: Colors.black,
                                    )
                                ),
                                SizedBox(height: height * 0.008,),
                                /// product rating
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: CommonContainer(
                                      height: height * 0.031,
                                      width: width * 0.13,
                                      color: Colors.green,
                                      borderradious: BorderRadius.circular(20),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            CommonText(
                                              text: product.rating != null ? product.rating.toString() : "0.0",
                                              size: 12,
                                              fontweight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: width * 0.005,),
                                            const Icon(Icons.star,color: Colors.white,size: 14,)
                                          ],
                                        ),
                                      )),
                                ),
                                SizedBox(height: height * 0.008,),
                                /// product Price
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: CommonText(
                                    text: "\$${product.price}",
                                    size: 24,
                                    fontweight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              ],
            );
          }
        else {
          return Center(child: CircularProgressIndicator());
        }
      },)
    );
  }
}
