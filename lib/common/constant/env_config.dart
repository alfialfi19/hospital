class EnvConfig {
  static const baseProdUrl = String.fromEnvironment(
    'https://skripsi-cms.vercel.app/rumah-sakit',
    defaultValue: 'https://skripsi-cms.vercel.app/rumah-sakit',
  );

  // Can add another environment here

  static const apiKey = String.fromEnvironment(
    'YOUR_API_KEY',
    defaultValue: 'YOUR_API_KEY',
  );
}
