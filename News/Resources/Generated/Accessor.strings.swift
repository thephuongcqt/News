// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  /// Author: 
  public static let articleAuthor = L10n.tr("Localizable", "article_author")
  /// Unknown
  public static let articleAuthorPlaceholder = L10n.tr("Localizable", "article_author_placeholder")
  /// Open original news
  public static let buttonOpenOriginNews = L10n.tr("Localizable", "button_open_origin_news")
  /// Register
  public static let registerButtonTitle = L10n.tr("Localizable", "register_button_title")
  /// hours ago
  public static let rssHoursAgo = L10n.tr("Localizable", "rss_hours_ago")
  /// just now
  public static let rssJustNow = L10n.tr("Localizable", "rss_just_now")
  /// minutes ago
  public static let rssMinutesAgo = L10n.tr("Localizable", "rss_minutes_ago")
  /// News
  public static let tabbarNewsListTitle = L10n.tr("Localizable", "tabbar_news_list_title")
  /// Your News
  public static let tabbarPersonalizedNewsTitle = L10n.tr("Localizable", "tabbar_personalized_news_title")
  /// Profile
  public static let tabbarProfileTitle = L10n.tr("Localizable", "tabbar_profile_title")
  /// Please choose your own category
  public static let tagViewTitle = L10n.tr("Localizable", "tag_view_title")
  /// Please enter your username
  public static let usernameTextfieldPlaceholder = L10n.tr("Localizable", "username_textfield_placeholder")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle = Bundle(for: BundleToken.self)
}
// swiftlint:enable convenience_type
