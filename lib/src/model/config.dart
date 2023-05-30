class Config {
  final int cellQtyInLine;
  final int sideWidth;
  final String lineSymbol;
  final String verticalBorder;
  final String horizontalBorder;

  Config({
    required this.cellQtyInLine,
    required this.sideWidth,
    this.lineSymbol = '  ',
    this.verticalBorder = '|',
    this.horizontalBorder = '__'
  });
}