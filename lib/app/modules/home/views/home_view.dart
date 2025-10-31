import 'package:claims/app/modules/demo/views/demo_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../parking-mobile-app/views/parking_mobile_app_view.dart';
import '../../slots/views/slots_view.dart';
import '../controllers/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController task = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          child: IconButton(onPressed: () {}, icon: Icon(Icons.dehaze)),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.network(
              'https://t3.ftcdn.net/jpg/15/34/03/58/360_F_1534035806_6gn57ou4V0dVZY6l30h6nEB5gWQRAP6v.jpg',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      body:
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning, Rifat!',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(fontFamily: 'Poppins', fontSize: 17),
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  children: [
                    TextSpan(text: 'You have '),
                    TextSpan(
                      text: '49 tasks ',
                      style: TextStyle(color: Colors.purple),
                    ),
                    TextSpan(text: 'this month 👍'),
                  ],
                ),
              ),
              SizedBox(height: 40),
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Color(0xFFBDBDBD)),
                  hintText: 'Search a text...',
                  hintStyle: GoogleFonts.lato(color: Color(0xFFBDBDBD)),
                  labelStyle: TextStyle(color: Color(0xFFBDBDBD)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFFBDBDBD)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 60),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple),
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFF3E5F5),
                        ),
                        width: 50,
                        height: 50,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFF3E5F5),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ParkingMobileAppView()));
                            },
                            icon: Icon(Icons.assignment),
                          ),
                        ),
                      ),
                      Text(
                        'To Do',
                        style: GoogleFonts.lato(textStyle: TextStyle()),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xFFFBC02D)),
                          color: Color(0xFFFFF9C4),
                        ),
                        width: 50,
                        height: 50,

                        child: CircleAvatar(
                          backgroundColor: Color(0xFFFFF9C4),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => SlotsView()));
                            },
                            icon: Icon(Icons.analytics, color: Color(0xFFFBC02D)),
                          ),
                        ),
                      ),
                      Text(
                        'Progress',
                        style: GoogleFonts.lato(textStyle: TextStyle()),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFE8F5E9),
                        ),
                        width: 50,
                        height: 50,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFE8F5E9),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.assignment_turned_in,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Done',
                        style: GoogleFonts.lato(textStyle: TextStyle()),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 60),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's Tasks",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => DemoView());
                    },
                    child:
                    Text(
                      'See All',
                      style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 15)),
                    ),
                  )
                ],
              ),
              SizedBox(height: 40),
              SizedBox(
               height: Get.height,
               width: Get.width,
               child:
               ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount: task.tasks.length,
                 shrinkWrap: true,
                 itemBuilder: (BuildContext context, int index) {
                   var taskData = task.tasks[index];
                   return Padding(
                     padding: EdgeInsets.all(20),
                     child:
                     Column(
                       children: [
                         Container(
                           child: Padding(
                             padding: EdgeInsets.all(20),
                             child: Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                 color: taskData['color'],
                               ),
                               child: Row(
                                 children: [
                                   Padding(
                                     padding: EdgeInsets.all(15),
                                     child:
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       mainAxisAlignment:
                                       MainAxisAlignment.spaceBetween,
                                       children: [
                                         Text(
                                           taskData['title'],
                                           style: GoogleFonts.lato(
                                             textStyle: TextStyle(
                                               color: Colors.white,
                                               fontWeight: FontWeight.bold,
                                               fontSize: 17,
                                             ),
                                           ),
                                         ),
                                         SizedBox(height: 10),
                                         Text(
                                           taskData['desc'],
                                           style: GoogleFonts.lato(
                                             textStyle: TextStyle(
                                               color: Color(0xFFE0E0E0),
                                             ),
                                           ),
                                         ),
                                         SizedBox(height: 10),
                                         Text(
                                           taskData['time'],
                                           style: GoogleFonts.lato(
                                             textStyle: TextStyle(
                                               color: Colors.white,
                                               fontWeight: FontWeight.normal,
                                               fontSize: 15,
                                             ),
                                           ),
                                         ),
                                         SizedBox(height: 10),
                                         SizedBox(
                                           width: Get.width/2,
                                           child: Row(
                                             crossAxisAlignment:
                                             CrossAxisAlignment.start,
                                             mainAxisAlignment:
                                             MainAxisAlignment.spaceBetween,
                                             children: [
                                               Text(
                                                 taskData['status'],
                                                 style: GoogleFonts.lato(
                                                   textStyle: TextStyle(
                                                     color: Colors.white,
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: 15,
                                                   ),
                                                 ),
                                               ),
                                               Text(
                                                 taskData['per'],
                                                 style: GoogleFonts.lato(
                                                   textStyle: TextStyle(
                                                     color: Colors.white,
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: 15,
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                   );
                 },
               ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
