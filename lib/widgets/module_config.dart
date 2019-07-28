/// Author: Christian Juth
/// Date: 7/26/19
/// File: module_config.dart
/// Summary:
///   ModuleConfig contains the default config
///   for modules. It also allows the developer
///   to overwrite the default values. This class
///   is used as the provider type in ./module.dart

class ModuleConfig {

  // defaults
  bool darkMode;

  // allow user to override defaults
  ModuleConfig({darkMode}) {
    this.darkMode ??= darkMode;
  }
}
