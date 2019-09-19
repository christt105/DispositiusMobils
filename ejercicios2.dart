
//Escribe una función duplica que multiplica por 2 un num
num duplica(num a){
  return a*2;
}

/*Escribe una función flecha paren que pone paréntesis a un String. Por ejemplo, si le pasas 'en voz
baja' devuelve '(en voz baja)'*/
String paren(String string){
  return '($string)';
}

/*Escribre una función que devuelve los caracteres separados de un String, en una lista.
Si le pasas 'hola', devuelve ['h', 'o', 'l', 'a'].
(Recuerda que en Dart no hay char como en C++, sino que todo son Strings, así que la función
devolverá Strings de longitud 1.)*/
List<String> separar(String string){
  List<String> ret = [];
  for(int i = 0; i < string.length; i){
    ret.add(string[i]);
  }

  return ret;
}

int main(){

  num a = 3;
  print(duplica(a));
  print(paren('hey'));
  print(separar('hey'));

  return 0;
}