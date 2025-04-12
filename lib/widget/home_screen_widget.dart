import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

class HomeScreenWidget extends GetxController {

  RxList<GridImageList> firstImageList = <GridImageList>[
    GridImageList(image: ImagePathUtils.extraImageGrid_0, rating: "4.5", address: "3.2 km near you", restaurant: "Kuco", status: "Available"),
    GridImageList(image: ImagePathUtils.extraImageGrid_1, rating: "4.2", address: "3.2 km near you", restaurant: "Italian Barista Cafe", status: "Crowded"),
    GridImageList(image: ImagePathUtils.extraImageGrid_2, rating: "3.9", address: "3.2 km near you", restaurant: "Shawarmak", status: "Available"),
    GridImageList(image: ImagePathUtils.extraImageGrid_3, rating: "3.9", address: "3.2 km near you", restaurant: "Asoum Burger(Dhaka Branch)", status: "Available"),
    GridImageList(image: ImagePathUtils.extraImageGrid_4, rating: "4.5", address: "3.2 km near you", restaurant: "Volare Pizzeria(Dhaka Branch)", status: "Temporarily Closed"),
    GridImageList(image: ImagePathUtils.extraImageGrid_5, rating: "4.2", address: "3.2 km near you", restaurant: "Delicato Kitchen(Dhaka Branch)", status: "Crowded"),
  ].obs;


  RxList<ListImageList> listImageList = <ListImageList>[
    ListImageList(image: ImagePathUtils.extraImageList_1, name: "Burger"),
    ListImageList(image: ImagePathUtils.extraImageList_2, name: "Pizza"),
    ListImageList(image: ImagePathUtils.extraImageList_3, name: "Seafood"),
    ListImageList(image: ImagePathUtils.extraImageList_4, name: "Grilled"),
    ListImageList(image: ImagePathUtils.extraImageList_5, name: "Shawarma"),
    ListImageList(image: ImagePathUtils.extraImageList_6, name: "Pasta"),
    ListImageList(image: ImagePathUtils.extraImageList_7, name: "Salad"),
    ListImageList(image: ImagePathUtils.extraImageList_8, name: "Juices"),
  ].obs;


  RxList<GridImageList> secondImageList = <GridImageList>[
    GridImageList(image: ImagePathUtils.extraImageGrid_3, rating: "4.5", address: "3.2 km near you", restaurant: "Asoum Burger", status: "Crowded"),
    GridImageList(image: ImagePathUtils.extraImageGrid_4, rating: "1.2", address: "3.2 km near you", restaurant: "Volare Pizzeria", status: "Temporarily Closed"),
    GridImageList(image: ImagePathUtils.extraImageGrid_5, rating: "3.9", address: "3.2 km near you", restaurant: "Delicato Kitchen", status: "Available"),
    GridImageList(image: ImagePathUtils.extraImageGrid_0, rating: "3.9", address: "3.2 km near you", restaurant: "Kuco", status: "Available"),
    GridImageList(image: ImagePathUtils.extraImageGrid_1, rating: "4.2", address: "3.2 km near you", restaurant: "Italian Barista Cafe", status: "Crowded"),
    GridImageList(image: ImagePathUtils.extraImageGrid_2, rating: "4.5", address: "3.2 km near you", restaurant: "Shawarmak", status: "Temporarily Closed"),
  ].obs;

  

  Widget homeScreenWidget({required BuildContext context}) {
    if(MediaQuery.sizeOf(context).height > 1133) {
      return Container(
        height: 1133.ht(context),
        width: 744.wt(context),
        decoration: BoxDecoration(
          color: ColorUtils.white248,
        ),
        child: Center(
          child: Text("Home"),
        ),
      );
    } else {
      return Container(
        height: 844.hm(context),
        width: 390.wm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white248,
        ),
        child: CustomScrollView(
          slivers: [


            SliverAppBar(
              expandedHeight: 205.hm(context),
              primary: true,
              pinned: true,
              automaticallyImplyLeading: false,
              floating: false,
              flexibleSpace: Container(
                height: 203.hm(context),
                width: 390.wm(context),
                decoration: BoxDecoration(
                  color: ColorUtils.white255
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
              ),
            ),


          ],
        ),
      );
    }
  }



}


class GridImageList {
  String? image;
  String? rating;
  String? address;
  String? restaurant;
  String? status;

  GridImageList({
    required this.image,
    required this.rating,
    required this.address,
    required this.restaurant,
    required this.status,
  });
}


class ListImageList {
  String? image;
  String? name;

  ListImageList({
    required this.image,
    required this.name,
  });
}


