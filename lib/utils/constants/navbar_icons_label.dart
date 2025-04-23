class NavbarIconsLabel {
  static const String homeIcon = 'assets/icons/home.svg';

  static const String investorsIcon = 'assets/icons/investor_icon.svg';

  static const String enterpreneursIcon = 'assets/icons/enterpreneur_icon.svg';

  static const String postIcon = 'assets/icons/post.svg';

  static const String chatIcon = 'assets/icons/chat_icon.svg';

  static const String accountIcon = 'assets/icons/profile.svg';

  static navbarIcon({bool? isInvestor}) {
    return [
      homeIcon,
      isInvestor == true ? investorsIcon : enterpreneursIcon,
      postIcon,
      chatIcon,
      accountIcon
    ];
  }

  static int navbarLength({bool? isInvestor}) {
    return navbarIcon(isInvestor: isInvestor).length;
  }
}
