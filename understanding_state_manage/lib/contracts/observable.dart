
// Padrão pede que seja implementado adição e remoção de listeners

abstract class Observable {
  void addListener(void Function() callback);
  void removeListener(void Function() callback);
}