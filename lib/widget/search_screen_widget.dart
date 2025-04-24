import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';

class SearchScreenWidget extends GetxController {

  Rx<TextEditingController> searchController = TextEditingController().obs;

  RxList<ListImageList> listImageList = <ListImageList>[
    ListImageList(image: ImagePathUtils.extraImageList_1, name: "Burger"),
    ListImageList(image: ImagePathUtils.extraImageList_2, name: "Pizza"),
    ListImageList(image: ImagePathUtils.extraImageList_3, name: "Seafood"),
    ListImageList(image: ImagePathUtils.extraImageList_4, name: "Grilled"),
    ListImageList(image: ImagePathUtils.extraImageList_5, name: "Shawarma"),
    ListImageList(image: ImagePathUtils.extraImageList_6, name: "Pasta"),
    ListImageList(image: ImagePathUtils.extraImageList_7, name: "Salad"),
    ListImageList(image: ImagePathUtils.extraImageList_8, name: "Juices"),
    ListImageList(image: ImagePathUtils.extraImageList_9, name: "Pastries"),
    ListImageList(image: ImagePathUtils.extraImageList_10, name: "Steak"),
  ].obs;


  RxInt bigIndex = 0.obs;

  Widget searchScreenWidget({required BuildContext context}) {
    if(MediaQuery.sizeOf(context).height > 1133) {
      return Obx(()=>SafeArea(
        child: Container(
          height: 1133.ht(context),
          width: 744.wt(context),
          decoration: BoxDecoration(
            color: ColorUtils.white248,
          ),
          child: CustomScrollView(
            slivers: [
        
        
              SliverToBoxAdapter(
                child: Column(
                  children: [
        
        
                    SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
        
        
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Search".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 20.spt(context),
                          color: ColorUtils.black255,
                        ),
                      ),
                    ),
        
                    SpacerWidget.spacerWidget(spaceHeight: 33.ht(context)),
        
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 78.hpmt(context)),
                      child: Column(
                        children: [
        
                          TextFormField(
                            controller: searchController.value,
                            textAlign: TextAlign.start,
                            cursorColor: ColorUtils.blue192,
                            style: GoogleFonts.openSans(
                              fontSize: 16.spt(context),
                              fontStyle: FontStyle.normal,
                              color: ColorUtils.black51,
                              fontWeight: FontWeight.w400,
                            ),
                            cursorHeight: 20.ht(context),
                            textAlignVertical: TextAlignVertical.top,
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              hintText: "Search for a restaurant, dish...".tr,
                              hintStyle: GoogleFonts.openSans(
                                fontSize: 16.spt(context),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: ColorUtils.gray136,
                              ),
                              filled: true,
                              prefixIconConstraints: BoxConstraints(
                                maxHeight: 48.ht(context),
                                minWidth: 36.wt(context),
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                  left: 12.lpmt(context),
                                  right: 10.rpmt(context),
                                  top: 17.33.tpmt(context),
                                  bottom: 17.33.bpmt(context),
                                ),
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset(
                                    ImagePathUtils.searchIconImagePath,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                              suffixIcon: Container(
                                height: 24.ht(context),
                                width: 24.wt(context),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 13.hpmt(context),
                                  vertical: 13.vpmt(context),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.transparent
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                  onPressed: () {
                                    Get.off(()=>FilterSearchScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                  },
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Image.asset(
                                      ImagePathUtils.filterIconImagePath,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                              ),
                              fillColor: ColorUtils.white255,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.hpmt(context),
                                vertical: 12.vpmt(context),
                              ),
                              constraints: BoxConstraints(
                                maxHeight: 48.ht(context),
                              ),
                              border:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.rt(context)),
                                borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.rt(context)),
                                borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.rt(context)),
                                borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                              ),
        
                            ),
                          ),
        
        
                          SpacerWidget.spacerWidget(spaceHeight: 32.ht(context)),
        
                          Wrap(
                            children: List.generate(listImageList.length, (index) {
                              return SizedBox(
                                height: 110.ht(context),
                                width: 80.wt(context),
                                child: TextButton(
                                  onPressed: () async {
                                    bigIndex.value = index + 1 ;
                                  },
                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                  child: Container(
                                    height: 110.ht(context),
                                    width: 80.wt(context),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(8.rm(context)),
                                        border: bigIndex.value == (index + 1) ?
                                        Border.all(color: ColorUtils.blue192,width: 1) :
                                        Border.all(color: Colors.transparent,width: 1)
                                    ),
                                    margin: EdgeInsets.only(bottom: 10.bpmt(context)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 60.ht(context),
                                          width: 60.wt(context),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(8.rm(context)),
                                          ),
                                          child: FittedBox(
                                            fit: BoxFit.fill,
                                            child: Image.asset(
                                              listImageList[index].image!,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
        
                                        SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),
        
        
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${listImageList[index].name}".tr,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.tajawal(
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 16.spt(context),
                                              color: ColorUtils.black255,
                                            ),
                                          ),
                                        ),
        
        
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    )
        
        
        
                  ],
                ),
              )
        
        
            ],
          ),
        ),
      ));
    } else {
      return Obx(()=>SafeArea(
        child: Container(
            height: 844.hm(context),
            width: 390.wm(context),
            decoration: BoxDecoration(
              color: ColorUtils.white248,
            ),
            child: CustomScrollView(
              slivers: [


                SliverToBoxAdapter(
                  child: Column(
                    children: [


                      SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),


                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Search".tr,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.spm(context),
                            color: ColorUtils.black255,
                          ),
                        ),
                      ),

                      SpacerWidget.spacerWidget(spaceHeight: 33.hm(context)),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                        child: Column(
                          children: [

                            TextFormField(
                              controller: searchController.value,
                              textAlign: TextAlign.start,
                              cursorColor: ColorUtils.blue192,
                              style: GoogleFonts.openSans(
                                fontSize: 16.spm(context),
                                fontStyle: FontStyle.normal,
                                color: ColorUtils.black51,
                                fontWeight: FontWeight.w400,
                              ),
                              cursorHeight: 20.hm(context),
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: "Search for a restaurant, dish...".tr,
                                hintStyle: GoogleFonts.openSans(
                                  fontSize: 16.spm(context),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: ColorUtils.gray136,
                                ),
                                filled: true,
                                prefixIconConstraints: BoxConstraints(
                                  maxHeight: 48.hm(context),
                                  minWidth: 36.wm(context),
                                ),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(
                                    left: 12.lpmm(context),
                                    right: 10.rpmm(context),
                                    top: 17.33.tpmm(context),
                                    bottom: 17.33.bpmm(context),
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Image.asset(
                                      ImagePathUtils.searchIconImagePath,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                                suffixIcon: Container(
                                  height: 24.hm(context),
                                  width: 24.wm(context),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 13.hpmm(context),
                                    vertical: 13.vpmm(context),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.transparent
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: () {
                                      Get.off(()=>FilterSearchScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.asset(
                                        ImagePathUtils.filterIconImagePath,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),
                                fillColor: ColorUtils.white255,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.hpmm(context),
                                  vertical: 12.vpmm(context),
                                ),
                                constraints: BoxConstraints(
                                  maxWidth: 358.wm(context),
                                  maxHeight: 48.hm(context),
                                ),
                                border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                                  borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                                  borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                                  borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                                ),

                              ),
                            ),


                            SpacerWidget.spacerWidget(spaceHeight: 32.hm(context)),

                            Wrap(
                              children: List.generate(listImageList.length, (index) {
                                return SizedBox(
                                  height: 110.hm(context),
                                  width: 80.wm(context),
                                  child: TextButton(
                                    onPressed: () async {
                                      bigIndex.value = index + 1 ;
                                    },
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    child: Container(
                                      height: 110.hm(context),
                                      width: 80.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(8.rm(context)),
                                        border: bigIndex.value == (index + 1) ?
                                        Border.all(color: ColorUtils.blue192,width: 1) :
                                        Border.all(color: Colors.transparent,width: 1)
                                      ),
                                      margin: EdgeInsets.only(bottom: 10.bpmm(context)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 60.hm(context),
                                            width: 60.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.circular(8.rm(context)),
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.fill,
                                              child: Image.asset(
                                                listImageList[index].image!,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),

                                          SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),


                                          Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${listImageList[index].name}".tr,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.spm(context),
                                                color: ColorUtils.black255,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      )



                    ],
                  ),
                )


              ],
            )
        ),
      ));
    }
  }


}
