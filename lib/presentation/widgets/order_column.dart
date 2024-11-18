import 'package:flutter/material.dart';
import 'reservas_widget.dart';
import 'order_production.dart'; // Página de órdenes de producción
import 'rendimiento_widget.dart'; // Asegúrate de importar la página de rendimiento


class OrderColumn extends StatelessWidget {
  const OrderColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildIconColumn(context, Icons.food_bank, 'Órdenes de', 'producción', const OrderProductionPage()),
        _buildIconColumn(context, Icons.calendar_month_rounded, 'Reservas', '', const ReservasWidget()),
        _buildIconColumn(context, Icons.groups, 'Rendimiento', 'empleado', const RendimientoEmpleadosWidget()), // Cambié aquí para usar RendimientoPage
      ],
    );
  }

  Widget _buildIconColumn(BuildContext context, IconData icon, String title, String subtitle, Widget page) {
    return GestureDetector(
      onTap: () {
        // Navegar a la página correspondiente cuando se toca el ícono
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        children: [
          Icon(icon, size: 44.0),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(title, style: const TextStyle(fontSize: 14.0)),
          ),
          if (subtitle.isNotEmpty)
            Text(subtitle, style: const TextStyle(fontSize: 12.0, color: Colors.grey)),
        ],
      ),
    );
  }
}
