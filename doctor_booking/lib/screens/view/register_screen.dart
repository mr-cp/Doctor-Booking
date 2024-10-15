import 'package:doctor_booking/shared_widget/custom_button.dart';
import 'package:doctor_booking/shared_widget/custom_text.dart';
import 'package:doctor_booking/utils/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared_widget/app_bar.dart';
import '../../shared_widget/radio_button.dart';
import '../../shared_widget/text_field.dart';
import '../../utils/colors.dart';
import '../controller/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        onPressed: () => Get.back(),
      ),
      body: Container(
        height: h,
        width: w,
        color: Colors.white,
        child: SafeArea(
          child: GetBuilder<RegisterController>(
            init: registerController,
            builder: (registerController) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 10, 10),
                      child: CustomText(
                        text: 'Register',
                        fontSize: 24,
                        fontweight: FontWeight.w600,
                      )),
                  const Divider(
                    color: AppColors.borderGrey,
                    thickness: 1,
                    height: 0,
                  ),
                  h15,
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(text: '  Name', fontSize: 14),
                        h5,
                        CustomTextFormField(
                          hintText: 'Enter your full name',
                          controller: registerController.nameCntrl,
                        ),
                        h15,
                        const CustomText(
                            text: '  Whatsapp Number', fontSize: 14),
                        h5,
                        CustomTextFormField(
                          hintText: 'Enter your Whatsapp number',
                          controller: registerController.nameCntrl,
                        ),
                        h15,
                        const CustomText(text: '  Address', fontSize: 14),
                        h5,
                        CustomTextFormField(
                          hintText: 'Enter your full address',
                          controller: registerController.nameCntrl,
                        ),
                        h15,
                        const CustomText(text: '  Location', fontSize: 14),
                        h5,
                        CustomTextFormField(
                          hintText: 'Choose your location',
                          controller: registerController.nameCntrl,
                        ),
                        h15,
                        const CustomText(text: '  Branch', fontSize: 14),
                        h5,
                        CustomTextFormField(
                          hintText: 'Select the branch',
                          controller: registerController.nameCntrl,
                        ),
                        h15,
                        const CustomText(text: '  Treatments', fontSize: 14),
                        Card(
                          color: const Color(0xFFF0F0F0),
                          margin: const EdgeInsets.only(bottom: 5, top: 5),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Row(
                                    children: [
                                      const CustomText(
                                        text: '1.',
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontweight: FontWeight.w500,
                                      ),
                                      w15,
                                      SizedBox(
                                        width: w * 0.60,
                                        child: Text(
                                          'Couple Combo Rejuvanating Package ',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      const Spacer(),
                                      const Image(
                                          image: AssetImage('assets/close.png'))
                                    ],
                                  ),
                                ),
                                h15,
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 0, 10, 0),
                                  child: Row(
                                    children: [
                                      SizedBox(width: w * 0.010),
                                      const CustomText(
                                        text: 'Male',
                                        color: AppColors.textGreen,
                                        fontSize: 13,
                                        fontweight: FontWeight.w500,
                                      ),
                                      w7,
                                      Container(
                                        width: 44,
                                        height: 26,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border.all(
                                              color: AppColors.borderGrey,
                                              width: 1),
                                        ),
                                        child: const Center(
                                            child: CustomText(
                                          text: '2',
                                          color: AppColors.textGreen,
                                        )),
                                      ),
                                      w20,
                                      const CustomText(
                                        text: 'Female',
                                        color: AppColors.textGreen,
                                        fontSize: 13,
                                        fontweight: FontWeight.w500,
                                      ),
                                      w7,
                                      Container(
                                        width: 44,
                                        height: 26,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border.all(
                                              color: AppColors.borderGrey,
                                              width: 1),
                                        ),
                                        child: const Center(
                                            child: CustomText(
                                          text: '2',
                                          color: AppColors.textGreen,
                                        )),
                                      ),
                                      const Spacer(),
                                      const Image(
                                          image: AssetImage('assets/edit.png')),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        h10,
                        CustomButton(
                            height: 50,
                            text: const CustomText(
                              fontweight: FontWeight.w400,
                              fontSize: 14,
                              text: '+ Add Treatments',
                            ),
                            backgroundColor: AppColors.buttonLiteGreen,
                            textColor: AppColors.black,
                            onPressed: () {}),
                        h20,
                        const CustomText(text: '  Total Amount', fontSize: 14),
                        h5,
                        CustomTextFormField(
                          hintText: '',
                          controller: registerController.nameCntrl,
                        ),
                        h15,
                        const CustomText(
                            text: '  Discount Amount', fontSize: 14),
                        h5,
                        CustomTextFormField(
                          hintText: '',
                          controller: registerController.nameCntrl,
                        ),
                        h15,
                        const CustomText(
                            text: '  Payment Option', fontSize: 14),
                        h5,
                        const RadioButtonRow(),
                        h15,
                        const CustomText(
                            text: '  Advance Amount', fontSize: 14),
                        h5,
                        CustomTextFormField(
                          hintText: '',
                          controller: registerController.nameCntrl,
                        ),
                        h15,
                        const CustomText(
                            text: '  Balance Amount', fontSize: 14),
                        h5,
                        CustomTextFormField(
                          hintText: '',
                          controller: registerController.nameCntrl,
                        ),
                        h15,
                        const CustomText(
                            text: '  Treatment Date', fontSize: 14),
                        h5,
                        CustomTextFormField(
                          hintText: '',
                          controller: registerController.nameCntrl,
                        ),
                        h15,
                        const CustomText(
                            text: '  Treatment Time', fontSize: 14),
                        h5,
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                hintText: 'Hour',
                                controller: registerController.nameCntrl,
                              ),
                            ),
                            w10,
                            Expanded(
                              child: CustomTextFormField(
                                hintText: 'Minutes',
                                controller: registerController.nameCntrl,
                              ),
                            ),
                          ],
                        ),
                        h20,
                        CustomButton(
                            height: 50,
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
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
