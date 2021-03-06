class UIKeys {
  // Splash Screen
  static const splashScreenView = '__splashScreenView__';

  // Welcome Screen
  static const signInScreenButton = '__signInScreenButton__';
  static const signUpScreenButton = '__signUpScreenButton__';

  // Sign In Screen
  static const signInScreenView = '__signInScreenView__';
  static const signInFormButton = '__signInFormButton__';
  static const signInFormEmailField = '__signInFormEmailField__';
  static const signInFormPasswordField = '__signInFormPasswordField__';
  static const signInScreenLoadingContainer =
      '__signInScreenLoadingContainer__';
  static const signInScreenErrorContainer = '__signInScreenErrorContainer__';

  // Landing Screen
  static const discoverLandingTab = '__discoverLandingTab__';
  static const discoverHomeTabInActive = '__discoverHomeTabInActive__';
  static const discoverHomeTabActive = '__discoverHomeTabActive__';
  static const discoverProfileTabInActive = '__discoverProfileTabInActive__';
  static const discoverProfileTabActive = '__discoverProfileTabActive__';

  // Home Screen
  static const homeGreetingContainer = '__homeGreetingContainer__';
  static const homeMenuItemContainer = '__homeMenuItemContainer__';
  static const homeLoadingContainer = '__homeLoadingContainer__';
  static const homeMenuMyQueueSuccessContainer =
      '__homeMenuMyQueueSuccessContainer__';
  static const homeMenuMyQueueErrorContainer =
      '__homeMenuMyQueueErrorContainer__';
  static const homeMenuCurrentQueueSuccessContainer =
      '__homeMenuCurrentQueueSuccessContainer__';
  static const homeMenuCurrentQueueErrorContainer =
      '__homeMenuCurrentQueueErrorContainer__';

  // Profile Screen
  static const signOutButton = '__signOutButton__';

  // Transaction History
  static const transactionHistoryMenu = '__transactionHistoryMenu__';
  static cardItemTransactionHistory(int index) =>
      '__cardItemTransactionHistory${index}__';
  static const transactionHistoryListErrorContainer =
      '__transactionHistoryListErrorContainer__';
  static const transactionHistoryListEmptyContainer =
      '__transactionHistoryListEmptyContainer__';

  static cardItemTransactionHistoryAction(int index) =>
      '__cardItemTransactionHistoryAction${index}__';
  static const transactionHistoryDetailContainer =
      '__transactionHistoryDetailContainer__';
}
