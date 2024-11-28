import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Usamos fl_chart para los gráficos

class InsumoWidget extends StatelessWidget {
  final String nombre;
  final String descripcion;
  final String imagenUrl;
  final bool activo;

  const InsumoWidget({
    required this.nombre,
    required this.descripcion,
    required this.imagenUrl,
    required this.activo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Redirige a la página anterior
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Información básica del insumo
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(imagenUrl, width: 100, height: 100),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nombre,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        descripcion,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        activo ? 'Activo' : 'Inactivo',
                        style: TextStyle(
                          fontSize: 18,
                          color: activo ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              // Gráfico de Dinero
              const Text('Gráfico de Dinero',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16.0),
              _buildMoneyChart(),
              const SizedBox(height: 32.0),
              // Gráfico de Porcentaje
              const Text('Gráfico de Porcentaje',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16.0),
              _buildPercentageChart(),
              const SizedBox(height: 32.0),
              // Gráfico de Tiempo
              const Text('Gráfico de Tiempo de Preparación',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16.0),
              _buildTimeChart(),
            ],
          ),
        ),
      ),
    );
  }

  // Gráfico de dinero (simulado)
  Widget _buildMoneyChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 10,
        minY: 0,
        maxY: 1000,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 200),
              FlSpot(2, 500),
              FlSpot(5, 750),
              FlSpot(7, 1000),
              FlSpot(9, 900),
            ],
            isCurved: true,
            colors:  [Colors.blue], // Cambié 'colors' a 'color'
            barWidth: 4,
            isStrokeCapRound: true,
          ),
        ],
      ),
    );
  }

  // Gráfico de porcentaje (simulado)
  Widget _buildPercentageChart() {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(value: 40, title: '40%', color: Colors.blue),
          PieChartSectionData(value: 30, title: '30%', color: Colors.green),
          PieChartSectionData(value: 30, title: '30%', color: Colors.red),
        ],
      ),
    );
  }

  // Gráfico de tiempo (simulado)
  Widget _buildTimeChart() {
    return BarChart(
      BarChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(
              x: 0,
              barRods: [BarChartRodData(y: 5, colors: [Colors.blue], width: 16)]),
          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(y: 10, colors: [Colors.green], width: 16)
          ]),
          BarChartGroupData(
              x: 2,
              barRods: [BarChartRodData(y: 7, colors: [Colors.red], width: 16)]),
        ],
      ),
    );
  }
}
