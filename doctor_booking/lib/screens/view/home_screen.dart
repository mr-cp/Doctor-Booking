import 'package:doctor_booking/shared_widget/custom_button.dart';
import 'package:doctor_booking/shared_widget/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared_widget/app_bar.dart';
import '../../shared_widget/search_bar.dart';
import '../../utils/colors.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _refreshList() async {
    await Future.delayed(const Duration(seconds: 2));
   print(homeController.token);
  }

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: Container(
        height: h,
        width: w,
        color: Colors.white,
        child: SafeArea(
          child: GetBuilder<HomeController>(
            init: homeController,
            builder: (homeController) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SearchField(
                          controller: homeController.searchController,
                          hintText: 'Search for treatments',
                        ),
                      ),
                      SizedBox(width: w * 0.03),
                      Expanded(
                        child: CustomButton(
                            text: Text(
                              'Search',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            backgroundColor: AppColors.buttonGreen,
                            textColor: Colors.white,
                            onPressed: () {}),
                      )
                    ],
                  ),
                ),
                SizedBox(height: h * 0.03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      const CustomText(
                          text: 'Sort by :',
                          fontSize: 16,
                          fontweight: FontWeight.w500),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        width: 169,
                        height: 39,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(33),
                            border: Border.all(
                                width: 1, color: AppColors.borderGrey)),
                        child: const Row(
                          children: [
                            CustomText(
                              text: 'Date',
                              color: Color.fromARGB(255, 126, 125, 125),
                              fontSize: 13,
                            ),
                            Spacer(),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.textGreen,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: h * 0.015),
                const Divider(
                  color: AppColors.borderGrey,
                  thickness: 1,
                  height: 0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: h * 0.64,
                        child: RefreshIndicator(
                          onRefresh: _refreshList,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Card(
                                color: const Color(0xFFF0F0F0),
                                margin:
                                    const EdgeInsets.only(bottom: 5, top: 15),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Row(
                                          children: [
                                            CustomText(
                                              text: '${index + 1}.',
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontweight: FontWeight.w500,
                                            ),
                                            const SizedBox(width: 10),
                                            const CustomText(
                                                text: 'Vikram Singh',
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontweight: FontWeight.w500),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(30, 0, 10, 0),
                                          child: Text(
                                              'Couple Combo Package (Rejuvenaksdfohasdvoa',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xFF006837),
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  fontWeight:
                                                      FontWeight.w300))),
                                      const SizedBox(height: 8),
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 0, 10, 0),
                                        child: Row(
                                          children: [
                                            Image(
                                                image: AssetImage(
                                                    'assets/calender.png')),
                                            SizedBox(width: 10),
                                            CustomText(
                                              text: '31/01/2024',
                                              color: AppColors.grey,
                                              fontSize: 13,
                                              fontweight: FontWeight.w400,
                                            ),
                                            SizedBox(width: 10),
                                            Image(
                                                image: AssetImage(
                                                    'assets/people.png')),
                                            SizedBox(width: 10),
                                            CustomText(
                                                text: 'Vikram Singh',
                                                color: AppColors.grey,
                                                fontSize: 13,
                                                fontweight: FontWeight.w400),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      const Divider(),
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 0, 10, 0),
                                        child: Row(
                                          children: [
                                            CustomText(
                                              text: 'View Booking details',
                                              color: AppColors.black,
                                              fontSize: 13,
                                              fontweight: FontWeight.w300,
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons
                                                  .keyboard_arrow_right_rounded,
                                              color: AppColors.textGreen,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.015),
                      CustomButton(
                          height: 45,
                          text: const Text('Register Now'),
                          backgroundColor: AppColors.buttonGreen,
                          textColor: Colors.white,
                          onPressed: () {
                            Get.toNamed('/register');
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
