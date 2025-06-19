import 'package:flutter/material.dart';

class SaveBooking extends StatelessWidget {
  final String spotName;
  final String entryCode;
  final String exitCode;
  final String date;
  final String time;
  final String location;
  final VoidCallback onCancel;

  const SaveBooking({
    super.key,
    required this.spotName,
    required this.entryCode,
    required this.exitCode,
    required this.date,
    required this.time,
    required this.location,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  spotName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.local_parking, color: Colors.yellow, size: 35),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "Entry Code: $entryCode",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Exit Code: $exitCode",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Date: $date"),
            Text("Time: $time"),
            Text("Location: $location"),
            const SizedBox(height: 12),
            Center(
              child: ElevatedButton(
                onPressed: onCancel,
                child: const Text("CANCEL BOOKING"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//قائمة حجوزاتي

class MyBookingsPage extends StatelessWidget {
  const MyBookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Bookings")),
      body: ListView(
        children: [
          SaveBooking(
            spotName: "Parking Spot A",
            entryCode: "3752x",
            exitCode: "2808y",
            date: "2-09-2025",
            time: "10:00 AM - 12:00 PM",
            location: "Homs Mall",
            onCancel: () {},
          ),
          SaveBooking(
            spotName: "Parking Spot B",
            entryCode: "2902x",
            exitCode: "3490y",
            date: "4-06-2025",
            time: "2:00 PM - 4:00 PM",
            location: "Clover Mall",
            onCancel: () {},
          ),
        ],
      ),
    );
  }
}
