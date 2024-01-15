class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure(
      [this.message = "An unknown error occurred during login."]);

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
            'User not found. Please check your credentials.');
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
            'Incorrect password. Please try again.');
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted.');
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help.');
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}
