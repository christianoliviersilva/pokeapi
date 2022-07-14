import 'package:flutter/material.dart';

class PokemonCircularStat extends StatelessWidget {
  const PokemonCircularStat({
    Key? key,
    required this.pokemonStatColor,
    required this.baseStat,
    required this.statName,
  }) : super(key: key);

  final Color pokemonStatColor;
  final int baseStat;
  final String statName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 68.0,
          height: 68.0,
          child: CircularProgressIndicator(
            color: pokemonStatColor,
            backgroundColor: Colors.grey[900]!.withOpacity(0.54),
            value: baseStat.toDouble() / 100,
            strokeWidth: 6.4,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                statName,
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              Text(
                '$baseStat',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
