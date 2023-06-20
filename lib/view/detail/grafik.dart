import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GrafikPage extends StatefulWidget {
  const GrafikPage({Key? key}) : super(key: key);

  @override
  State<GrafikPage> createState() => _GrafikState();
}

class _GrafikState extends State<GrafikPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1350),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data = [
      Sales("PAZARTESİ", 5),
      Sales("SALI", 3),
      Sales("ÇARŞAMBA", 7),
      Sales("PERŞEMBE", 8),
      Sales("CUMA", 11),
      Sales("CUMARTESİ", 5),
      Sales("PAZAR", 12),
    ];

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    " ",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 2,
                color: Colors.white,
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, _) {
                  return Opacity(
                    opacity: _animation.value,
                    child: SizedBox(
                      height: 400,
                      child: SfCircularChart(
                        series: <CircularSeries>[
                          PieSeries<Sales, String>(
                            dataSource: data,
                            xValueMapper: (Sales sales, _) => sales.day,
                            yValueMapper: (Sales sales, _) => sales.sold,
                            dataLabelSettings: const DataLabelSettings(
                              isVisible: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              const Text(
                "Manav Çizgi Grafiği",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 2,
                color: Colors.transparent,
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, _) {
                  return Opacity(
                    opacity: _animation.value,
                    child: SizedBox(
                      height: 400,
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          LineSeries<Sales, String>(
                            dataSource: data,
                            xValueMapper: (Sales sales, _) => sales.day,
                            yValueMapper: (Sales sales, _) => sales.sold,
                            dataLabelSettings: const DataLabelSettings(
                              isVisible: true,
                            ),
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
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

class Sales {
  final String day;
  final int sold;

  Sales(this.day, this.sold);
}
