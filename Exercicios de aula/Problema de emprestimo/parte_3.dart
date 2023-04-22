double s = 0; // Valor da primeira parcela
int n = 0; // Número de parcelas
double j = 0; // Percentual de juros mensal
double p = 0; // Valor da próxima parcela

void inicializarFinanciamento(double valorInicial, int numParcelas, double juros) {
  s = valorInicial;
  n = numParcelas;
  j = juros;
  p = s;
}

double proximaParcela() {
  p = p * (1 + j);
  return p;
}

void main() {
  inicializarFinanciamento(200, 5, 0.01);

  print('Parcela 1: R\$ ${p.toStringAsFixed(2)}');
  
  for (int i = 2; i <= n; i++) {
    print('Parcela $i: R\$ ${proximaParcela().toStringAsFixed(2)}');
  }
}
