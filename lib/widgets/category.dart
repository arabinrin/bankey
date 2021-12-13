import 'dart:async';

import 'package:bankey/model/category.dart';
import 'package:bankey/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CategoryTile extends StatefulWidget {
  const CategoryTile({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  Timer? _timer;
  double progressValue = 0;
  double secondaryProgressValue = 0;
  // ignore: sort_constructors_first
  _DeterminatePageState() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer _timer) {
      setState(() {
        progressValue++;
        secondaryProgressValue = secondaryProgressValue + 2;
        if (progressValue == 100) {
          _timer.cancel();
        }
        if (secondaryProgressValue > 100) {
          secondaryProgressValue = 100;
        }
      });
    });
  }
  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (2 / 3),
        ),
        itemCount: categoryModel.length,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            margin:const EdgeInsets.all(10),
            decoration:const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 130,
                  width: 130,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    // Create primary radial axis
                    RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        showLabels: false,
                        showTicks: false,
                        radiusFactor: 0.8,
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.3,
                          color: const Color.fromARGB(40, 0, 169, 181),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        pointers: <GaugePointer>[
                          RangePointer(
                              value: progressValue,
                              width: 0.3,
                              sizeUnit: GaugeSizeUnit.factor,
                              enableAnimation: true,
                              animationDuration: 100,
                              animationType: AnimationType.linear)
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            positionFactor: 0.2,
                            horizontalAlignment: GaugeAlignment.center,
                            widget: Image.asset(
                              categoryModel[i].img,
                              height: 40,
                              width: 40,
                              // color: kGreen,
                            ),
                          )
                        ]),
                    // Create secondary radial axis for segmented line
                    RadialAxis(
                      minimum: 0,
                      maximum: 100,
                      showLabels: false,
                      showTicks: false,
                      showAxisLine: true,
                      tickOffset: -0.05,
                      offsetUnit: GaugeSizeUnit.factor,
                      minorTicksPerInterval: 0,
                      radiusFactor: 0.8,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.3,
                        color: Colors.white,
                        dashArray: <double>[4, 3],
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                    )
                  ]),
                ),
                Text(
                  categoryModel[i].item,
                  style: GoogleFonts.dmSans(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kBlack,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '\$${categoryModel[i].price}',
                  style: GoogleFonts.dmSans(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: kBlack,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    padding:const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'On track',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: kBlack.withOpacity(.6),
                        ),
                      ),
                    ))
              ],
            ),
          );
        });
  }

  
}
