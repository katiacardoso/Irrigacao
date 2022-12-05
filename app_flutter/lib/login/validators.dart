bool emailValidator(String email){
  final RegExp regex = RegExp("^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+([a-z0-9-]+).([a-z]{2,3})");
  return regex.hasMatch(email);
}