import 'package:flutter/material.dart';
import 'package:my_project/features/auth/screen/booking_page.dart';
import 'package:my_project/features/auth/screen/save_booking.dart';

import 'package:my_project/features/on_boarding/widget/custom_button.dart';

class SccessfllyBooked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, size: 70, color: Colors.green),
              Text(
                "Booking Confirmed!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Parking spot:A28",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "10:00Am - 12:00Am",

                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
              SizedBox(height: 25),
              // كود الدخول
              Container(
                child: Column(
                  children: [
                    Text(
                      "Entry Code:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '3752X',
                      style: TextStyle(fontSize: 18, fontFamily: 'monospace'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              // كود الخروج
              Container(
                child: Column(
                  children: [
                    Text(
                      "Exit Code:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '2808Y',
                      style: TextStyle(fontSize: 18, fontFamily: 'monospace'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              //رسالة تحذير
              Row(
                children: [
                  Icon(Icons.error, color: Color.fromARGB(255, 125, 124, 124)),

                  Expanded(
                    child: Expanded(
                      child: Text(
                        "Please adhere to the reserved time to avoid potential fines!!",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 125, 124, 124),
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              MyCustomButtom(
                text: "View My Bookings",
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyBookingsPage()),
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
