import 'package:claims/app/modules/home/views/home_view.dart';
import 'package:claims/app/modules/slots/controllers/slots_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SlotsView extends GetView<SlotsController> {
  const SlotsView({super.key});
  @override
  Widget build(BuildContext context) {
    final SlotsController ctrl = Get.put(SlotsController());


    void openSlotSheet(slot){
      Get.bottomSheet(
        isScrollControlled: true,
        Container(
          height: 500,
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
                  MainAxisAlignment.spaceBetween,
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
                    Container(
                      width: 60,
                      height: 60,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(60),
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
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey,
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
                                  'Slot Number',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Text(
                                  slot['slot'].toString(),
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontWeight:
                                      FontWeight.bold,
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
                    GestureDetector(
                      onTap: () {
                        ctrl.selectSlotStatus();
                      },
                      child: Obx(() => Container(
                        width: 150,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(12),
                          border: Border.all(
                            color:
                            Colors.grey,
                          ),
                          color:
                          Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Slot Status',
                                  style: GoogleFonts.lato(
                                    textStyle:
                                    TextStyle(
                                        color: Colors.grey
                                    ),
                                  ),
                                ),
                                Text(
                                  ctrl.selectedSlotStatus.isTrue ? 'Available' : 'Booked',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontWeight:
                                      FontWeight
                                          .bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),)
                    )
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
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
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              padding:
                              EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius:
                                BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: Image.network(
                                'https://logos-world.net/wp-content/uploads/2020/09/Mastercard-Logo.png',
                                height: 30,
                                width: 30,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'MasterCard',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(width: 6),
                            Text(
                              '****2456',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
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
                        borderRadius:
                        BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 90),
                Container(
                  height: 60,
                  width: Get.width,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {
                     ctrl.confirmSlot(slot);
                    },
                    child: Text(
                      'Confirm',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Color.fromRGBO(186, 209, 56, 1.0),
                          fontSize: 20,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }


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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView()),
                );
                ctrl.reset();
              },
              icon: Icon(Icons.arrow_back_ios_new, size: 25),
            ),
          ),
        ),
        title: Text(
          'SLOT CREATION',
          style: GoogleFonts.lato(textStyle: TextStyle()),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                color: Colors.black,
                onPressed: () {},
                icon: Icon(Icons.logout, size: 25),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Staring Point : ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              TextField(
                style: const TextStyle(color: Colors.black),
                controller: ctrl.startingInput,
                decoration: InputDecoration(
                  hintText: 'Enter the slot',
                  hintStyle: GoogleFonts.lato(color: const Color(0xFFBDBDBD)),
                  labelStyle: const TextStyle(color: Color(0xFFBDBDBD)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Ending Point : ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              TextField(
                style: const TextStyle(color: Colors.black),
                controller: ctrl.endingInput,
                decoration: InputDecoration(
                  hintText: 'Enter the slot',
                  hintStyle: GoogleFonts.lato(color: const Color(0xFFBDBDBD)),
                  labelStyle: const TextStyle(color: Color(0xFFBDBDBD)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                height: 40,
                width: Get.width,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () {
                    ctrl.slotCreate(context);
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Color.fromRGBO(186, 209, 56, 1.0),
                        fontSize: 20,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Obx(() => ctrl.submitData.isNotEmpty ? GridView.builder(
                shrinkWrap: true,
                itemCount: ctrl.submitData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  var slot = ctrl.submitData[index];
                  return Obx(() {
                    return GestureDetector(
                      onTap: () {
                        ctrl.selectedSlotStatus.value = slot['status'] == "Available";
                        openSlotSheet(slot);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ctrl.selectedSlot.value == index
                                ? Colors.green
                                : Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: slot['status'] == 'Available' ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              slot['slot'].toString(),
                              style: Get.textTheme.titleSmall!.copyWith(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              slot['status'].toString(),
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        ) : Icon(Icons.car_crash),
                      ),
                    );
                  });
                },
              ) : SizedBox(
                height: 0,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
