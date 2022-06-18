class EnvConfig {
  static const baseProdUrl = String.fromEnvironment(
    'http://skripsi.investly.id',
    defaultValue: 'http://skripsi.investly.id',
  );

  // Can add another environment here

  static const apiKey = String.fromEnvironment(
    'YOUR_API_KEY',
    defaultValue: 'YOUR_API_KEY',
  );
}
