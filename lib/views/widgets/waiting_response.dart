import 'package:flutter/material.dart';

class WaitingResponseWidget extends StatelessWidget {
  const WaitingResponseWidget({
    super.key,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 150,
      child: isLoading == true
          ? Container(
              width: 180,
              height: 30,
              decoration: BoxDecoration(
                color:
                    Colors.blue, // Change the color to your desired color
                borderRadius: BorderRadius.circular(
                    20.0), // Adjust the radius as needed
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset:
                        const Offset(0, 3), // changes the shadow position
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Waiting for a response...',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : Container(),
    );
  }
}
