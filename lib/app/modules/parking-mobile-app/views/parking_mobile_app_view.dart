import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/parking_mobile_app_controller.dart';

class ParkingMobileAppView extends GetView<ParkingMobileAppController> {
  const ParkingMobileAppView({super.key});

  @override
  Widget build(BuildContext context) {
    final String imgUrl =
        'https://upload.wikimedia.org/wikipedia/commons/2/2a/Mastercard-logo.svg';
    final ParkingMobileAppController ctrl = Get.put(
      ParkingMobileAppController(),
    );
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              color: Colors.black,
              onPressed: () {},
              icon: Icon(Icons.search, size: 25),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                color: Colors.black,
                onPressed: () {},
                icon: Icon(Icons.notifications_none_rounded, size: 25),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Parking nearby',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text('view on map', style: GoogleFonts.lato()),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ctrl.zoneSheet.length,
                itemBuilder: (BuildContext context, int index) {
                  var zoneSheet = ctrl.zoneSheet[index];
                  return GestureDetector(
                    onTap: () {
                      ctrl.zoneColor(index);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Obx(() {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ctrl.colorCheck.value == index
                                    ? Colors.black
                                    : ctrl.color,
                              ),
                              child: Text(
                                zoneSheet['title'],
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    color: ctrl.colorCheck.value == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ctrl.tasks.length,
                      itemBuilder: (context, index) {
                        var taskData = ctrl.tasks[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: 280,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: taskData['color'],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.bottomSheet(
                                        isScrollControlled: true,
                                        Container(
                                          height: 800,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          taskData['title'],
                                                          style: GoogleFonts.lato(
                                                            textStyle:
                                                                TextStyle(
                                                                  fontSize: 23,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          taskData['desc'],
                                                          style: GoogleFonts.lato(
                                                            textStyle: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: 60,
                                                      height: 60,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 5,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              60,
                                                            ),
                                                        border: Border.all(
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        icon: Icon(Icons.close),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Container(
                                                  height: 100,
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: ctrl
                                                        .specificParkingZone
                                                        .length,
                                                    itemBuilder:
                                                        (
                                                          BuildContext context,
                                                          int index,
                                                        ) {
                                                          var zoneSheet = ctrl
                                                              .specificParkingZone[index];
                                                          return GestureDetector(
                                                            onTap: () {
                                                              ctrl.specificZone(
                                                                index,
                                                              );
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    12,
                                                                  ),
                                                              child: Obx(() {
                                                                return Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10,
                                                                        vertical:
                                                                            6,
                                                                      ),
                                                                      decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                              20,
                                                                            ),
                                                                        color:
                                                                            ctrl.zoneCheck.value ==
                                                                                index
                                                                            ? Colors.black
                                                                            : ctrl.color,
                                                                      ),
                                                                      child: Text(
                                                                        zoneSheet['title'],
                                                                        style: GoogleFonts.lato(
                                                                          textStyle: TextStyle(
                                                                            color:
                                                                                ctrl.zoneCheck.value ==
                                                                                    index
                                                                                ? Colors.white
                                                                                : Colors.black,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              }),
                                                            ),
                                                          );
                                                        },
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Obx(() {
                                                  var zoneName = ctrl
                                                      .specificParkingZone[2];
                                                  var avail =
                                                      ctrl.availableZone[index];
                                                  var amount = ctrl.tasks[index];
                                                  return Container(
                                                    height: 400,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        ctrl.availabilityZone(
                                                          index,
                                                        );
                                                        Get.bottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          Container(
                                                            height: 500,
                                                            decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.only(
                                                                    topLeft:
                                                                        Radius.circular(
                                                                          16,
                                                                        ),
                                                                    topRight:
                                                                        Radius.circular(
                                                                          16,
                                                                        ),
                                                                  ),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    12,
                                                                  ),
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Confirm Booking',
                                                                            style: GoogleFonts.lato(
                                                                              textStyle: TextStyle(
                                                                                fontSize: 25,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            taskData['title'],
                                                                            style: GoogleFonts.lato(
                                                                              textStyle: TextStyle(
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                              color: Colors.grey,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            60,
                                                                        height:
                                                                            60,
                                                                        padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10,
                                                                          vertical:
                                                                              5,
                                                                        ),
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                            60,
                                                                          ),
                                                                          border: Border.all(
                                                                            color:
                                                                                Colors.grey,
                                                                          ),
                                                                        ),
                                                                        child: IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            Get.back();
                                                                              },
                                                                          icon: Icon(
                                                                            Icons.close,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 40,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            150,
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                              12,
                                                                            ),
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                            12,
                                                                          ),
                                                                          border: Border.all(
                                                                            color:
                                                                                Colors.grey,
                                                                          ),
                                                                        ),
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              child: Column(
                                                                                children: [
                                                                                  Text(
                                                                                    'Parking Zone',
                                                                                    style: GoogleFonts.lato(
                                                                                      textStyle: TextStyle(
                                                                                        color: Colors.grey,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    zoneName['title'],
                                                                                    style: GoogleFonts.lato(
                                                                                      textStyle: TextStyle(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontSize: 20,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            150,
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                              12,
                                                                            ),
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                            12,
                                                                          ),
                                                                          border: Border.all(
                                                                            color:
                                                                                Colors.grey,
                                                                          ),
                                                                        ),
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              child: Column(
                                                                                children: [
                                                                                  Text(
                                                                                    'Parking Place',
                                                                                    style: GoogleFonts.lato(
                                                                                      textStyle: TextStyle(
                                                                                        color: Colors.grey,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    avail['title'],
                                                                                    style: GoogleFonts.lato(
                                                                                      textStyle: TextStyle(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontSize: 20,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 40,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Payment',
                                                                            style: GoogleFonts.lato(
                                                                              textStyle: TextStyle(
                                                                                color: Colors.grey,
                                                                                fontSize: 18,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              Container(
                                                                                padding: EdgeInsets.symmetric(
                                                                                  horizontal: 6,
                                                                                  vertical: 3,
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  border: Border.all(
                                                                                    color: Colors.grey,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(
                                                                                    10,
                                                                                  ),
                                                                                ),
                                                                                child: Image.network(
                                                                                  'https://logos-world.net/wp-content/uploads/2020/09/Mastercard-Logo.png',
                                                                                  height: 30,
                                                                                  width: 30,
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 8,
                                                                              ),
                                                                              Text(
                                                                                'MasterCard',
                                                                                style: GoogleFonts.lato(
                                                                                  textStyle: TextStyle(
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontSize: 20,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 6,
                                                                              ),
                                                                              // IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
                                                                              Text(
                                                                                '****2456',
                                                                                style: GoogleFonts.lato(
                                                                                  textStyle: TextStyle(
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontSize: 20,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                            10,
                                                                          ),
                                                                          border: Border.all(
                                                                            color:
                                                                                Colors.grey,
                                                                          ),
                                                                        ),
                                                                        child: IconButton(
                                                                          onPressed:
                                                                              () {},
                                                                          icon: Icon(
                                                                            Icons.edit,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(height: 90),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            amount['time'],
                                                                            style: GoogleFonts.lato(
                                                                              textStyle: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 25,
                                                                                fontWeight: FontWeight.bold
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            'per hour',
                                                                            style: GoogleFonts.lato(
                                                                              textStyle: TextStyle(
                                                                                  color: Colors.grey,
                                                                                  fontSize: 20,
                                                                                  fontWeight: FontWeight.normal
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                                                        width: 200,
                                                                        decoration: BoxDecoration(
                                                                            color: Colors.black,
                                                                          borderRadius: BorderRadius.circular(30)
                                                                        ),
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Confirm',
                                                                            style: GoogleFonts.lato(
                                                                              textStyle:
                                                                              TextStyle(
                                                                                fontSize:
                                                                                20,
                                                                                color:
                                                                                Color.fromRGBO(
                                                                                  186,
                                                                                  209,
                                                                                  56,
                                                                                  1.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                                  // BottomNavigationBar(
                                                                  //   items: [
                                                                  //     BottomNavigationBarItem(
                                                                  //       icon:
                                                                  //       Container(
                                                                  //         child: Expanded(
                                                                  //           flex:1,
                                                                  //           child: Center(
                                                                  //             child: Text(
                                                                  //               'Continue',
                                                                  //               style: GoogleFonts.lato(
                                                                  //                 textStyle:
                                                                  //                 TextStyle(
                                                                  //                   fontSize:
                                                                  //                   20,
                                                                  //                   color:
                                                                  //                   Color.fromRGBO(
                                                                  //                     186,
                                                                  //                     209,
                                                                  //                     56,
                                                                  //                     1.0,
                                                                  //                   ),
                                                                  //                 ),
                                                                  //               ),
                                                                  //             ),
                                                                  //           ),
                                                                  //         ),
                                                                  //       ),
                                                                  //       label: ''
                                                                  //     ),
                                                                  //     BottomNavigationBarItem(
                                                                  //         icon:Container(
                                                                  //           child: Expanded(
                                                                  //             flex:1,
                                                                  //             child: Center(
                                                                  //               child: Text(
                                                                  //                 'Continue',
                                                                  //                 style: GoogleFonts.lato(
                                                                  //                   textStyle:
                                                                  //                   TextStyle(
                                                                  //                     fontSize:
                                                                  //                     20,
                                                                  //                     color:
                                                                  //                     Color.fromRGBO(
                                                                  //                       186,
                                                                  //                       209,
                                                                  //                       56,
                                                                  //                       1.0,
                                                                  //                     ),
                                                                  //                   ),
                                                                  //                 ),
                                                                  //               ),
                                                                  //             ),
                                                                  //           ),
                                                                  //         ),
                                                                  //         label: ''
                                                                  //     )
                                                                  //   ]
                                                                  // )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: ctrl
                                                            .availableZone
                                                            .length,
                                                        shrinkWrap: true,
                                                        itemBuilder:
                                                            (
                                                              BuildContext
                                                              context,
                                                              int index,
                                                            ) {
                                                              var availableZone =
                                                                  ctrl.availableZone[index];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsets.all(
                                                                      12,
                                                                    ),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    availableZone['title']
                                                                            .isNotEmpty
                                                                        ? Container(
                                                                            padding: EdgeInsets.symmetric(
                                                                              horizontal: 25,
                                                                              vertical: 6,
                                                                            ),
                                                                            decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(
                                                                                20,
                                                                              ),
                                                                              border: Border.all(
                                                                                color:
                                                                                    ctrl.availableZoneCheck ==
                                                                                        index
                                                                                    ? Colors.green
                                                                                    : Colors.black,
                                                                              ),
                                                                            ),
                                                                            child: Column(
                                                                              children: [
                                                                                Text(
                                                                                  availableZone['title'],
                                                                                  style: GoogleFonts.lato(
                                                                                    textStyle: TextStyle(
                                                                                      color: Colors.black,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  availableZone['status'],
                                                                                  style: GoogleFonts.lato(
                                                                                    textStyle: TextStyle(
                                                                                      color: Colors.black,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          )
                                                                        : Container(
                                                                            child: Image.network(
                                                                              availableZone['url'],
                                                                              height: 100,
                                                                              width: 100,
                                                                            ),
                                                                          ),
                                                                    availableZone['title']
                                                                            .isNotEmpty
                                                                        ? Container(
                                                                            padding: EdgeInsets.symmetric(
                                                                              horizontal: 25,
                                                                              vertical: 6,
                                                                            ),
                                                                            decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(
                                                                                20,
                                                                              ),
                                                                              border: Border.all(
                                                                                color:
                                                                                    ctrl.availableZoneCheck ==
                                                                                        index
                                                                                    ? Colors.green
                                                                                    : Colors.black,
                                                                              ),
                                                                            ),
                                                                            child: Column(
                                                                              children: [
                                                                                Text(
                                                                                  availableZone['title'],
                                                                                  style: GoogleFonts.lato(
                                                                                    textStyle: TextStyle(
                                                                                      color: Colors.black,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  availableZone['status'],
                                                                                  style: GoogleFonts.lato(
                                                                                    textStyle: TextStyle(
                                                                                      color: Colors.black,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          )
                                                                        : Container(
                                                                            child: Image.network(
                                                                              availableZone['url'],
                                                                              height: 100,
                                                                              width: 100,
                                                                            ),
                                                                          ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                      ),
                                                    ),
                                                  );
                                                }),
                                                SizedBox(height: 10),
                                                Container(
                                                  height: 100,
                                                  color: Colors.transparent,
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 16,
                                                          vertical: 16,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            30,
                                                          ),
                                                      color: Colors.black,
                                                    ),
                                                    child:
                                                        GestureDetector(
                                                          onTap: () {
                                                            showModalBottomSheet(
                                                              context: context,
                                                              useRootNavigator: true,
                                                              builder: (context) {
                                                                return Row(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                      Center(
                                                                        child: Text(
                                                                          'Continue',
                                                                          style: GoogleFonts.lato(
                                                                            textStyle:
                                                                            TextStyle(
                                                                              fontSize:
                                                                              20,
                                                                              color:
                                                                              Color.fromRGBO(
                                                                                186,
                                                                                209,
                                                                                56,
                                                                                1.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                      EdgeInsets.all(
                                                                        12,
                                                                      ),
                                                                      child: CircleAvatar(
                                                                        backgroundColor:
                                                                        Color.fromRGBO(
                                                                          186,
                                                                          209,
                                                                          56,
                                                                          1.0,
                                                                        ),
                                                                        child: IconButton(
                                                                          onPressed: () {},
                                                                          icon: Icon(
                                                                            Icons
                                                                                .arrow_forward,
                                                                            color: Colors
                                                                                .black,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Container(
                                          height: 150,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                taskData['image'],
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(8),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            color: Color.fromRGBO(
                                              186,
                                              209,
                                              56,
                                              1.0,
                                            ),
                                          ),
                                          child: Text(
                                            taskData['place'],
                                            style: GoogleFonts.lato(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    taskData['title'],
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    taskData['desc'],
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        color: Color(0xFF757575),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    taskData['time'],
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Parking',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text('See all', style: GoogleFonts.lato()),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 600,
                    child: ListView.builder(
                      itemCount: ctrl.parking.length,
                      itemBuilder: (context, index) {
                        var taskData = ctrl.parking[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      taskData['image'],
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 8),
                                        Text(
                                          taskData['title'],
                                          style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          taskData['desc'],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                              color: Color(0xFF757575),
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            color: const Color.fromRGBO(
                                              186,
                                              209,
                                              56,
                                              1.0,
                                            ),
                                          ),
                                          child: Text(
                                            taskData['status'],
                                            style: GoogleFonts.lato(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
      Container(
        height: 100,
        color: Colors.transparent,
        child:
          Obx(() =>
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: ctrl.icon.length,
                  itemBuilder: (BuildContext context, int index) {
                    var icon = ctrl.icon[index];
                    return
                      GestureDetector(
                        onTap: () {
                          print('hai$index');
                          ctrl.bottomNav(index);
                        },
                        child: Padding(
                      padding: EdgeInsets.all(12),
                      child:
                        CircleAvatar(
                          backgroundColor:ctrl.bottomNavBar.value == index
                              ? Color.fromRGBO(
                            186,
                            209,
                            56,
                            1.0,
                          ) : Colors.black,
                          child: IconButton(
                            onPressed: () {},
                            icon:  Icon(icon['icon'], color:ctrl.bottomNavBar.value == index
                                ?
                            Colors.black : Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),)
      ),
    );
  }
}
