import 'package:flutter/material.dart';
import 'footer_page.dart';

class MyHomePage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              color: Colors.blue,
            ),
            SizedBox(width: 5),
            Text(
              'Salaya, Nakhon Pathom',
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(Icons.search),
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Near Me',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    width: 80,
                    color: Color.fromARGB(255, 164, 164, 164),
                  ),
                ),
                // Add your image or map widget here
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Popular Now',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 200,
                  height: 300,
                  alignment: Alignment.center,
                  child: Placeholder(), // photo
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 200,
                  height: 300,
                  alignment: Alignment.center,
                  child: Placeholder(),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterPage(
        selectedIndex: 0,
        onItemTapped: (index) {
          print('Item $index tapped');
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'footer_page.dart';

// class MyHomePage extends StatelessWidget {
//   final TextEditingController searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.menu),
//           onPressed: () {},
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications),
//             onPressed: () {},
//           ),
//         ],
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.location_on,
//               color: Colors.blue,
//             ),
//             SizedBox(width: 5),
//             Text(
//               'Salaya, Nakhon Pathom',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: const Color.fromARGB(255, 0, 0, 0),
//               ),
//             ),
//           ],
//         ),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(1.0),
//           child: Container(
//             color: const Color.fromARGB(255, 194, 193, 193).withOpacity(0.5),
//             height: 1.0,
//           ),
//         ),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Text(
//                 'Near Me',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.0),
//                   border: Border.all(
//                     width: 80,
//                     color: Color.fromARGB(255, 164, 164, 164),
//                   ),
//                 ),
//                 // Add your image or map widget here
//               ),
//             ), // Add some spacing between sections
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Text(
//                 'Popular Now',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: FooterPage(
//         selectedIndex: 0,
//         onItemTapped: (index) {
//           print('Item $index tapped');
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'footer_page.dart';

// class MyHomePage extends StatelessWidget {
//   final TextEditingController searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.menu),
//           onPressed: () {},
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications),
//             onPressed: () {},
//           ),
//         ],
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.location_on,
//               color: Color.fromARGB(255, 99, 185, 255),
//             ),
//             SizedBox(width: 5),
//             Text(
//               'Salaya, Nakhon Pathom',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: const Color.fromARGB(255, 0, 0, 0),
//               ),
//             ),
//           ],
//         ),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(1.0),
//           child: Container(
//             color: const Color.fromARGB(255, 194, 193, 193).withOpacity(0.5),
//             height: 1.0,
//           ),
//         ),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30.0),
//                   color: Colors.grey.withOpacity(0.1),
//                 ),
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Icon(Icons.search),
//                     ),
//                     Expanded(
//                       child: TextField(
//                         controller: searchController,
//                         decoration: InputDecoration(
//                           hintText: 'Search',
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: FooterPage(
//         selectedIndex: 0,
//         onItemTapped: (index) {
//           print('Item $index tapped');
//         },
//       ),
//     );
//   }
// }
