import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/data/entities/Market_card_entite.dart';
import 'package:quick_delivery_admin/screens/add_market_page/add_market_page_logic.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';

class MyMarketPageController extends GetxController {
  final searchController = TextEditingController();
  final homeController = Get.find<HomePageController>();
  final marketController = Get.find<AddMarketPageController>();
  var markets = <MarketCardEntite>[
    MarketCardEntite.fromJson(dataMarketTemp),
    MarketCardEntite.fromJson(dataMarketTemp),
    MarketCardEntite.fromJson(dataMarketTemp),
    MarketCardEntite.fromJson(dataMarketTemp)
  ];

  addMarket() {
    marketController.moniterMode.value = false;
    homeController.indexPageSeller.value = 6;
  }
}

final dataMarketTemp = {
  "id": 1,
  "name_en": "be order",
  "name_ar": "بي اوردرنةتت ختختتختخ تتختت",
  "image": "",
  "manager_id": 2,
  "created_at": "2024-12-18T09:37:18.000000Z",
  "updated_at": "2024-12-18T09:37:18.000000Z",
  "manager_name": "Harry Potter"
};
