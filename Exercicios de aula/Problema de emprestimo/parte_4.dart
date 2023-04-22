import 'dart:math';

class Emprestimo {
  double valor;
  int numParcelas;
  double juros;
  int parcelaAtual = 0;

  Emprestimo(this.valor, this.numParcelas, this.juros) {
    parcelaAtual = 0;
  }
}

void proximaParcela(Emprestimo emprestimo) {
  if (emprestimo.parcelaAtual < emprestimo.numParcelas) {
    emprestimo.parcelaAtual++;
    double valorAtual = emprestimo.valor * pow(1 + emprestimo.juros, emprestimo.parcelaAtual);
    print("Empréstimo de ${emprestimo.valor.toStringAsFixed(2)} reais, ${emprestimo.numParcelas} parcelas, juros de ${emprestimo.juros.toStringAsFixed(2)}%: Parcela ${emprestimo.parcelaAtual} - ${valorAtual.toStringAsFixed(2)} reais");
    // print("Emprestimo ${}: parcela ${emprestimo.parcelaAtual} - ${valorAtual.toStringAsFixed(2)} eh ")
  }
}

void main() {
  // cria os empréstimos
  Emprestimo emprestimo1 = Emprestimo(200, 5, 0.01);
  Emprestimo emprestimo2 = Emprestimo(500, 10, 0.02);

  // calcula as parcelas
  while (emprestimo1.parcelaAtual < emprestimo1.numParcelas || emprestimo2.parcelaAtual < emprestimo2.numParcelas) {
    if (emprestimo1.parcelaAtual < emprestimo1.numParcelas) {
      proximaParcela(emprestimo1);
    }
    if (emprestimo2.parcelaAtual < emprestimo2.numParcelas) {
      proximaParcela(emprestimo2);
    }
  }
}
