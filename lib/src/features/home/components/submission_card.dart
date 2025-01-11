import 'package:fl_chart/fl_chart.dart';

import 'imported_package.dart';

// final dataMap = <String, double>{
//   "Masuk": 6,
//   "Terlambat": 2,
//   "Alpha": 0,
// };

// final dataList = [
//   "Masuk",
//   "Terlambar",
//   "Alpha",
// ];

// final colorList = <Color>[
//   const Color(0xFF00AC06),
//   const Color(0xFF0217FF),
//   Colors.amber,
// ];

Padding submissionCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: cWhite,
        boxShadow: const [
          BoxShadow(
            color: cGrey_500,
            blurRadius: 10,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                text: "Kehadiran",
                color: cBlack,
                fontSize: 14,
                fontWeight: FontWeight.w600),
            spaceHeight(20),
            SizedBox(
              height: 200,
              width: Get.width,
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(x: 0, 
                      barRods: [
                        BarChartRodData(toY: 3, color: const Color(0xFF0217FF), width: 10),
                        BarChartRodData(toY: 1, color: const Color(0xFFFFAF02), width: 10),
                        BarChartRodData(toY: 4, color: Colors.red, width: 10),
                      ],
                    ),
                    BarChartGroupData(x: 0, 
                      barRods: [
                        BarChartRodData(toY: 3, color: const Color(0xFF0217FF), width: 10),
                        BarChartRodData(toY: 1, color: const Color(0xFFFFAF02), width: 10),
                        BarChartRodData(toY: 4, color: Colors.red, width: 10),
                      ],
                    ),
                    BarChartGroupData(x: 0, 
                      barRods: [
                        BarChartRodData(toY: 3, color: const Color(0xFF0217FF), width: 10),
                        BarChartRodData(toY: 1, color: const Color(0xFFFFAF02), width: 10),
                        BarChartRodData(toY: 4, color: Colors.red, width: 10),
                      ],
                    ),
                  ],
                  backgroundColor: cGrey_200,
                ),
                duration: const Duration(seconds: 2),
                curve: Curves.easeIn,
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     PieChart(
            //       dataMap: dataMap,
            //       animationDuration: const Duration(milliseconds: 800),
            //       chartLegendSpacing: 40,
            //       chartRadius: MediaQuery.of(context).size.width / 3,
            //       colorList: colorList,
            //       initialAngleInDegree: 0,
            //       chartType: ChartType.ring,
            //       ringStrokeWidth: 30,
            //       centerText: "HYBRID",
            //       legendOptions: const LegendOptions(
            //         showLegendsInRow: false,
            //         legendPosition: LegendPosition.right,
            //         showLegends: false,
            //         legendTextStyle: TextStyle(
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       chartValuesOptions: const ChartValuesOptions(
            //         showChartValueBackground: true,
            //         showChartValues: true,
            //         showChartValuesInPercentage: false,
            //         showChartValuesOutside: true,
            //         decimalPlaces: 1,
            //       ),
            //     ),
            //     SizedBox(
            //       width: 100,
            //       child: ListView.builder(
            //         itemCount: colorList.length,
            //         shrinkWrap: true,
            //         physics: const NeverScrollableScrollPhysics(),
            //         itemBuilder: (context, index) {
            //           return Padding(
            //             padding: const EdgeInsets.only(bottom: 5),
            //             child: Row(
            //               children: [
            //                 Container(
            //                   width: 10,
            //                   height: 10,
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(3),
            //                     color: colorList[index],
            //                   ),
            //                 ),
            //                 spaceWidth(7),
            //                 CustomText(
            //                     text: dataList[index],
            //                     color: cGrey_900,
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.w600)
            //               ],
            //             ),
            //           );
            //         },
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    ),
  );
}
