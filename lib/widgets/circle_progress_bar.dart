
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../utils/constant.dart';

class CircleProgress extends StatelessWidget {
  const CircleProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 65, right: 65),
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 100,
            showLabels: false,
            showTicks: false,
            startAngle: 270,
            endAngle: 180,
            axisLineStyle: const AxisLineStyle(
              thickness: 0.1,
              cornerStyle: CornerStyle.bothCurve,
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: const <GaugePointer>[
              RangePointer(
                value: 75.0,
                cornerStyle: CornerStyle.bothCurve,
                color: kBlueColor,
                width: 0.1,
                sizeUnit: GaugeSizeUnit.factor,
              )
            ],
            annotations: [
              GaugeAnnotation(
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text('18', style: kTextTitleStyleBlue),
                          Text('Days', style: kTextSmallTitleStyleBlue),
                        ],
                      ),
                      const Text('of 23 Days',
                          style: TextStyle(
                              color: kBlueColor,
                              fontSize: kTextSmallSize))
                    ],
                  ))
            ],
          )
        ]),
      ),
    );
  }
}