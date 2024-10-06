/// Capitaliza a primeira letra de uma string e transforma o restante em minúsculas.
///
/// Exemplo:
/// ```dart
/// print(capitalize('exemplo')); // Exemplo
/// print(capitalize('EXEMPLO')); // Exemplo
/// ```
///
/// - Parâmetro:
///   - `s`: A string a ser capitalizada.
/// - Retorna:
///   - A string com a primeira letra maiúscula e o restante em minúsculas. Se a string estiver vazia, retorna a string original.
String capitalize(String s) {
  if (s.isEmpty) return s;
  return s[0].toUpperCase() + s.substring(1).toLowerCase();
}
