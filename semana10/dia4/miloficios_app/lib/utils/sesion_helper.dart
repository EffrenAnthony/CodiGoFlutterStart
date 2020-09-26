class SessionHelper {
  // es final y estatica porque no cambia y sera la misma a lo largo de toda la vida del contructor
  // se llama a internal para que cree un objeto de la misma clase cuando comiuece la aplicación
  static final SessionHelper session = SessionHelper._internal();
  String token = '';

  SessionHelper._internal();

  factory SessionHelper() {
    return session;
  }
}
