int main(){
    // 1
    /*Haz un programa que muestra 'Hola Mundo 1', 'Hola Mundo 2', y así sucesivamente, en líneas
      separadas, hasta 'Hola Mundo 100*/

      for(int i = 1; i <= 100; ++i)
        print('Hello World $i');

    // 2
    /*Existe un error de ejecución en el siguiente programa?
      Si es así, porqué y cómo se arregla? Si es que no, cuándo ocurriría?*/

    dynamic estoy_de_humor = 'no'; //Pues que va a pasar, vamos de guay definiendo variables con dynamic y luego la cagamos
    // RESPUESTA: estoy_de_humor no es una condicioón, contiene un string.
    estoy_de_humor = true;
    if(estoy_de_humor){ 
      print('Veeenga va, voy a hacer ejercicios sobre Dart...');
    }

    // 3
    /*Determina el valor de la variable msg1 y msg2 al ejecutar el código siguiente:*/
      String a = 'James', b = 'Bond';
      String msg1 = "I'm gonna kill you, $a $b.";
      String msg2 = "I'm gonna kill you, ${a.toUpperCase()} ${b.toUpperCase()}!!"; // Hay que ponerlo entre {} para que coja el string que retorna el miembro 
      print(msg1);
      print(msg2);

      // 4
      /*Busca errores de compilación en el siguiente código:*/
      var a4 = 'fistro';
      final b4 = 'pecador';
      bool c4;
      //c4 = a4; // 'a' es un string y 'c' es un bool, no puedes asignar 'a' a 'c'
      //b4 = 'de la pradera'; // no puedes reasignar la variable
      num n = 3;
      int m = n; // esto diría que está guay

    return 0;
}