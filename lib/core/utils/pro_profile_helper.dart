import 'package:pro_profile/core/pro_profile_export.dart';
import 'package:pro_profile/core/utils/pro_profile_string.dart';

class ProProfileHelper {
  /// Featured works
  static List<String> featuredImages = [
    ProProfileImageConstant.featured_1,
    ProProfileImageConstant.featured_2,
    ProProfileImageConstant.featured_3,
    ProProfileImageConstant.featured_4,
    ProProfileImageConstant.featured_5,
    ProProfileImageConstant.featured_6
  ];

  /// Personal projects
  static List<String> projectImages = [
    ProProfileImageConstant.personalProject1,
    ProProfileImageConstant.personalProject2,
    ProProfileImageConstant.personalProject3
  ];

  /// Contact Images
  static List<String> contactImages = [
    ProProfileImageConstant.whatsapp,
    ProProfileImageConstant.linkedIn,
    ProProfileImageConstant.twitter,
    ProProfileImageConstant.behance
  ];

  /// Skills Images
  static List<String> skillsImage = [
    ProProfileImageConstant.flutter,
    ProProfileImageConstant.swift,
    ProProfileImageConstant.android,
    ProProfileImageConstant.sql,
    ProProfileImageConstant.git
  ];

  /// Skills Texts
  static List<String> skillText = [
    ProProfileStrings.flutter,
    ProProfileStrings.swift,
    ProProfileStrings.android,
    ProProfileStrings.sql,
    ProProfileStrings.git
  ];
}
