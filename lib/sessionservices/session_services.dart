class SessionServices{
  static final SessionServices _sessionServices =SessionServices._internol();
  String ?uid;
  factory SessionServices(){
    return _sessionServices;
  }

  SessionServices._internol(){

  }
}