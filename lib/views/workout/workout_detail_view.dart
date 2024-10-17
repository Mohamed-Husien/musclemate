// import 'package:flutter/material.dart';

// class WorkoutDetailView extends StatefulWidget {
//   final Map exercise;
//   final String imageUrl;

//   const WorkoutDetailView({
//     super.key,
//     required this.exercise,
//     required this.imageUrl,
//   });

//   @override
//   State<WorkoutDetailView> createState() => _WorkoutDetailViewState();
// }

// class _WorkoutDetailViewState extends State<WorkoutDetailView> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.exercise['name'])),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Hero(
//               tag: widget.exercise['id'],
//               child: Container(
//                 width: double.infinity,
//                 child: Image.asset(
//                   widget.imageUrl,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Container(
//                       color: Colors.grey,
//                       child: Center(
//                         child: Text(
//                           'No Image',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.exercise['name'],
//                     style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 20),
//                   Text("Time elapsed: 50 seconds"),
//                   const SizedBox(height: 20),
//                   Text(
//                     (widget.exercise['description']
//                                 ?.replaceAll(RegExp(r'<p>|</p>'), '') ?? '')
//                             .isEmpty
//                         ? 'Playing that exercise for more than one muscle in your body just focus and try to do it with yourself, do your best hero and don\'t forget you are the target not the around.'
//                         : widget.exercise['description']
//                                 ?.replaceAll(RegExp(r'<p>|</p>'), '') ??
//                             '',
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
