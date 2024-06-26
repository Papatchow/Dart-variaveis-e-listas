// ignore_for_file: unused_local_variable

void main() {
  String nome = "Laranja";
  double peso = 100.2;
  String cor = "Verde e Amarela";
  String sabor = "Doce e Cítrica";
  int diasDesdeColheita = 40;
  bool isMadura;

  if(diasDesdeColheita >= 30) {
    isMadura = true;
  } else{
    isMadura = false;
  }

Legumes mandioca1 = Legumes("Macaxeira", 1200, "Marrom", true);
Fruta banana1 = Fruta("Banana", 75, "Amarela", "Doce", 12);
Nozes amendoim1 = Nozes("Amendoim", 2, "Branco amarelado", "Salgado", 20, 35);
Citricas limao1 = Citricas("Limão", 120, "Verde", "Azedo", 5, 9);

mandioca1.printAlimento();
banana1.printAlimento();
amendoim1.printAlimento();
limao1.printAlimento();

mandioca1.cozinhar();
limao1.fazerSuco();
banana1.separarIngredientes();
amendoim1.fazerMassa();
}

bool funcEstaMadura(int dias){
  if (dias >= 30){
    return true;
  }else{
    return false;
  }
}

mostrarMadura(String nome, int dias, {required String cor}) {
  if (dias >= 30){
    print('A $nome está madura.');
  }
  else{
  print("A $nome não está madura.");
  }

  if(cor != null){
    print("A $nome é $cor.");
  }
}

int funcQuantosDiasMadura(int dias){
  int diasParaMadura = 30;
  int quantosDiasFaltam = diasParaMadura - dias;
  return quantosDiasFaltam;
}

class Fruta extends Alimento implements Bolo{
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

Fruta(String nome, double peso, String cor, this.sabor, this.diasDesdeColheita, 
          {this.isMadura}): super(nome, peso, cor);

void estaMadura(int diasParaMadura){
    isMadura = diasDesdeColheita >= diasParaMadura;
    print("A sua $nome foi colhida a $diasDesdeColheita dias, e precisa de $diasParaMadura dias para poder comer. Ela está madura? $isMadura");
  }
void fazerSuco(){
  print("Você fez um ótimo Suco de $nome!");
}
@override
void separarIngredientes(){
  print("Pegar a $nome");
}
@override
void fazerMassa(){
  print("Misturar a Fruta com Farinha, açucar, ovos...");
}
@override
void assar(){
  print("Colocar no Forno");
}
}

class Alimento{
  String nome;
  double peso;
  String cor;
  Alimento(this.nome,this.peso,this.cor);

  void printAlimento(){
    print("Este(a)  $nome pesa $peso gramas e é $cor. ");
  }
}

class Legumes extends Alimento implements Bolo{

  bool isPrecisaCozinhar;

  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar): super(nome, peso, cor);


  void cozinhar(){
    if(isPrecisaCozinhar){
      print("Pronto, o $nome está cozinhando!");
    } else{
      print("Nem precisa cozinhar!");     
    }
  }
  @override
  void assar(){
      // colocar mais tempo
  }
  @override
  void fazerMassa(){
    // fazer uma papa com o legume
  }
  @override
  void separarIngredientes(){
    // Ver se o alimento está cozido ou cru
  }


}

class Citricas extends Fruta{

  double nivelAzedo;

  Citricas(String nome, double peso, String cor, String sabor, int diasDesdeColheita, this.nivelAzedo): super(nome, peso, cor, sabor, diasDesdeColheita);

  void existeRefri(bool existe){
    if(existe){
      print("Existe Refrigerante de $nome");
    }else{
      print("Não existe refri de $nome");
    }
  }
}

class Nozes extends Fruta{
 
  double porcentagemOleoNatural;

  Nozes(String nome, double peso, String cor, String sabor, int diasDesdeColheita, this.porcentagemOleoNatural):super (nome, peso, cor, sabor, diasDesdeColheita);

  @override
  void  fazerMassa(){
    print("Tirar a Casca");
    super.fazerMassa();
  }
}

abstract class Bolo{
  void separarIngredientes();
  void fazerMassa();
  void assar();
}
