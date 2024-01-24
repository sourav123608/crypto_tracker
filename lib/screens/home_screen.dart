import 'package:crypto_tracker/controller/controller.dart';
import 'package:crypto_tracker/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final MyController controller = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Crypto Market',
          style: textstyle(25, Colors.white, FontWeight.bold),
        ),
      ),
      backgroundColor: const Color(0xff494F55),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Obx(() => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(4, 4),
                                            blurRadius: 5)
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.network(
                                          controller.coinslist[index].image),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        controller.coinslist[index].name,
                                        style: textstyle(
                                            18, Colors.grey, FontWeight.w600),
                                      ),
                                      Text(
                                        '${controller.coinslist[index].priceChangePercentage24H.toStringAsFixed(2)}%',
                                        style: textstyle(
                                            18, Colors.grey, FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '\$ ${controller.coinslist[index].currentPrice.round()}',
                                    style: textstyle(
                                        18, Colors.grey, FontWeight.w600),
                                  ),
                                  Text(
                                    controller.coinslist[index].symbol.toUpperCase(),
                                    style: textstyle(
                                        18, Colors.grey, FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  )),
          ],
        ),
      ),
    );
  }
}
