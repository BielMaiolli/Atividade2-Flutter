import 'package:test/test.dart';
import 'main.dart'; 

void main() {
  group('ContaPoupanca', () {
    test('Deve render juros corretamente', () {
      final contaPoupanca = ContaPoupanca(1000.0);
      contaPoupanca.renderJuros(0.05);
      expect(contaPoupanca.saldo, 1050.0);
    });

    test('Deve depositar corretamente na conta poupança', () {
      final contaPoupanca = ContaPoupanca(1000.0);
      contaPoupanca.depositar(200.0);
      expect(contaPoupanca.saldo, 1200.0);
    });

    test('Deve lançar exceção ao tentar sacar mais do que o saldo', () {
      final contaPoupanca = ContaPoupanca(1000.0);
      expect(() => contaPoupanca.sacar(1500.0), throwsException);
    });
  });

  group('ContaCorrente', () {
    test('Deve cobrar taxa corretamente', () {
      final contaCorrente = ContaCorrente(500);
      contaCorrente.cobrarTaxa(50);
      expect(contaCorrente.saldo, 450);
    });

    test('Deve depositar corretamente na conta corrente', () {
      final contaCorrente = ContaCorrente(500);
      contaCorrente.depositar(200);
      expect(contaCorrente.saldo, 700);
    });

    test('Deve lançar exceção ao tentar sacar mais do que o saldo', () {
      final contaCorrente = ContaCorrente(500);
      expect(() => contaCorrente.sacar(600), throwsException);
    });
  });
}
