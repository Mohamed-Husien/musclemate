import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerIndicator extends StatelessWidget {
  const SkeletonizerIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Skeletonizer(
                enabled: true, // Set to true while loading
                child: ListView.builder(
                  itemCount: 8, // Placeholder number of skeleton items
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        height: 50,
                        color: Colors.grey[300], // Skeleton color
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
