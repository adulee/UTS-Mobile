class LoginService {
  get loggedIn => null;

  Future<bool> loginUser(String username, String password) async {
    // Simulasi autentikasi berdasarkan username dan password tertentu
    await Future.delayed(const Duration(seconds: 2)); // Delay untuk simulasi proses asinkron
    // Username dan password yang ditentukan
    const String validUsername = 'user';
    const String validPassword = 'pass';
    // Cek apakah username dan password yang dimasukkan sesuai
    if (username == validUsername && password == validPassword) {
      return true; // Autentikasi sukses
    } else {
      return false; // Autentikasi gagal
    }
  }

  signUpUser(String username, String password) {}
}