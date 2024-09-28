class ContaBancaria<T> {
  T saldo;

  ContaBancaria(this.saldo);

  void depositar(T valor) {
    if (valor is num && saldo is num) {
      saldo += valor as num;
    } else {
      throw Exception('Tipo de valor inválido para depósito.');
    }
  }

  void sacar(T valor) {
    if (valor is num && saldo is num) {
      if (valor <= saldo) {
        saldo -= valor as num;
      } else {
        throw Exception('Saldo insuficiente.');
      }
    } else {
      throw Exception('Tipo de valor inválido para saque.');
    }
  }

  @override
  String toString() {
    return 'Saldo atual: $saldo';
  }
}

class ContaPoupanca extends ContaBancaria<double> {
  ContaPoupanca(double saldoInicial) : super(saldoInicial);

  void renderJuros(double taxa) {
    saldo += saldo * taxa;
  }
}

class ContaCorrente extends ContaBancaria<int> {
  ContaCorrente(int saldoInicial) : super(saldoInicial);

  void cobrarTaxa(int taxa) {
    saldo -= taxa;
  }
}

void main() {
  var contaPoupanca = ContaPoupanca(1000.0);
  var contaCorrente = ContaCorrente(500);

  print(contaPoupanca);
  contaPoupanca.renderJuros(0.05); 
  print(contaPoupanca); 

  print(contaCorrente); 
  contaCorrente.depositar(200);
  print(contaCorrente); 
}
