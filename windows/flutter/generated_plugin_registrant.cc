//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <desktop_drop/desktop_drop_plugin.h>
#include <network_info_plus_windows/network_info_plus_windows_plugin.h>
#include <open_document/open_document_plugin.h>
#include <tft_devices/tft_devices_plugin_c_api.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  DesktopDropPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DesktopDropPlugin"));
  NetworkInfoPlusWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("NetworkInfoPlusWindowsPlugin"));
  OpenDocumentPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("OpenDocumentPlugin"));
  TftDevicesPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("TftDevicesPluginCApi"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}
