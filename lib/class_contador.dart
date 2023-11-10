class ContadorApp {
  int seg1 = 0;
  int seg2 = 0;
  int min1 = 0;
  int min2 = 0;

  void aumentarValorSeg() {
    seg1++;
    print('seg1 = $seg1');
    if (seg1 == 10) {
      seg2++;
      seg1 = 0;
      if (seg2 == 6) {
        seg2 = 0;
      }
    }
  }

  void aumentarValorMin() {
    min1++;
    if (min1 == 10) {
      min2++;
      min1 = 0;
      if (min2 == 6) {
        min2 = 0;
      }
    }
  }
}
