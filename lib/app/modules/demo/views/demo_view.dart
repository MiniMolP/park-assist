import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import '../../home/views/home_view.dart';
import '../../loginScreen/views/login_screen_view.dart';
import '../controllers/demo_controller.dart';

class DemoView extends GetView<DemoController> {
  const DemoView({super.key});

  @override
  Widget build(BuildContext context) {
    final DemoController ctrl = Get.put(DemoController());

    return Scaffold(
      appBar: AppBar(
        leading:
        Padding(
          padding: EdgeInsets.all(8),
          child: CircleAvatar(
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
                );
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreenView()),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add, color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Add Task',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ctrl.dateSheet.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var weekDate = ctrl.dateSheet[index];
                    var currentDate = ctrl.currentDay[0];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          Text(
                            weekDate['day'],
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: weekDate['day'] == currentDate
                                    ? Colors.deepPurple
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            weekDate['date'],
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: weekDate['day'] == currentDate
                                    ? Colors.deepPurple
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              ListView.builder(
                itemCount: ctrl.timeSheet.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var data = ctrl.timeSheet[index];
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: data['color'],
                              border: Border(
                                left: BorderSide(color: Colors.black),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data['title'],
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        data['time'],
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    data['desc'],
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        color: Color(0xFFE0E0E0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
