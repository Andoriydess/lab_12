import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color_provider.dart';

class ColorControlSection extends StatelessWidget {
  const ColorControlSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = context.watch<ColorProvider>();

    return Column(
      children: [
        Container(
          width: 180,
          height: 180,
          color: colorProvider.currentColor,
        ),
        const SizedBox(height: 40),

        // Слайдер для Red
        _buildColorSlider(
          context,
          label: 'Red: ${colorProvider.red.toInt()}',
          value: colorProvider.red,
          onChanged: (val) => colorProvider.updateRed(val),
        ),
        const SizedBox(height: 10),

        // Слайдер для Green
        _buildColorSlider(
          context,
          label: 'Green: ${colorProvider.green.toInt()}',
          value: colorProvider.green,
          onChanged: (val) => colorProvider.updateGreen(val),
        ),
        const SizedBox(height: 10),

        // Слайдер для Blue
        _buildColorSlider(
          context,
          label: 'Blue: ${colorProvider.blue.toInt()}',
          value: colorProvider.blue,
          onChanged: (val) => colorProvider.updateBlue(val),
        ),
      ],
    );
  }

  Widget _buildColorSlider(
      BuildContext context, {
        required String label,
        required double value,
        required ValueChanged<double> onChanged,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Slider(
          value: value,
          min: 0,
          max: 255,
          onChanged: onChanged,
        ),
      ],
    );
  }
}