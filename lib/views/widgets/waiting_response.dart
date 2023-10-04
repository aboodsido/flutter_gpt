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
      bottom: 80,
      right: MediaQuery.sizeOf(context).width / 3,
      child: isLoading == true
          ? Container(
              width: 180,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
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
