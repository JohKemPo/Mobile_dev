void main() {
  double s = 200; // Valor da primeira parcela
  int n = 5; // Número de parcelas
  double j = 0.01; // Percentual de juros mensal
  
  double p = s; // Primeira parcela é igual ao valor da primeira parcela
  print('Parcela 1: R\$ ${p.toStringAsFixed(2)}');
  
  for (int i = 2; i <= n; i++) {
    p = proximaParcela(p, j); // Calcula o valor da nova parcela
    print('Parcela $i: R\$ ${p.toStringAsFixed(2)}');
  }
}

double proximaParcela(double parcelaAnterior, double juros) {
  return parcelaAnterior * (1 + juros);
}
