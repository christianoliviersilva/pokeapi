String getFullPokemonId(int num) {
  final numLenght = num.toString().length;

  if (numLenght == 1) {
    return '#00$num';
  }
  if (numLenght == 2) {
    return '#0$num';
  }
  return '#$num';
}
