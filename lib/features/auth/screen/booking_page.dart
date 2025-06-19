import 'package:flutter/material.dart';
import 'package:my_project/core/consts/app_size.dart';
import 'package:my_project/core/theme/app_colors.dart';
import 'package:my_project/features/auth/screen/sccessflly_booked.dart';
import 'package:my_project/features/auth/widget/app_bar_loginscreen.dart';
import 'package:my_project/features/auth/widget/menu_botton.dart';
import 'package:my_project/features/on_boarding/widget/custom_button.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController plateController = TextEditingController();
  final TextEditingController fromTimeController = TextEditingController();
  final TextEditingController toTimeController = TextEditingController();

  Future<void> _selectTime(TextEditingController controller) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final formattedTime = pickedTime.format(context);
      setState(() {
        controller.text = formattedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Booking Information"),
      backgroundColor: AppColors.bkgColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(
                top: AppSize.loginContainerTopMargin,
              ),

              padding: const EdgeInsets.all(AppSize.defaultPadding),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppSize.loginBorderRadius),
                  topRight: Radius.circular(AppSize.loginBorderRadius),
                  bottomLeft: Radius.circular(AppSize.loginBorderRadius),
                  bottomRight: Radius.circular(AppSize.loginBorderRadius),
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Center(
                    child: Text(
                      "Put Your Information",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("From"),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: fromTimeController,
                              readOnly: true,
                              onTap: () => _selectTime(fromTimeController),
                              decoration: InputDecoration(
                                hintText: "Select Time",
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("To"),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: toTimeController,
                              readOnly: true,
                              onTap: () => _selectTime(toTimeController),
                              decoration: InputDecoration(
                                hintText: "Select Time",
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Duration:", style: TextStyle(fontSize: 16)),
                      Text("2 hours", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Total Cost:", style: TextStyle(fontSize: 16)),
                      Text("\$2.00", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: MyCustomButtom(
                      text: "Confirm Booking",
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SccessfllyBooked(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const MenuBotton(), // زر القائمة
        ],
      ),
    );
  }
}
