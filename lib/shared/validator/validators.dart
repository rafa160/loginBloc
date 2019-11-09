class ValidatorApp{

  String validateName(String text){
    if(text.isEmpty){
      return "You need fill this field";
    } return null;

  }

  String emailValidator(String text){
    if (text.isEmpty || !text.contains("@")){
      return "E-mail Invalido";
    }
  }


  String passwordValidator(String text){
    if (text.isEmpty){
      return "Insira Password";
    } else if (text.length < 4){
      return "Sua senha tem mais de 4 caracteres, meu amigo";
    }
  }


}