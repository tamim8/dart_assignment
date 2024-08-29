import 'constance/app_sizes.dart';
import 'constance/enums.dart';

class DeviceUtils {
  static DeviceType getDeviceType({required double width}) {
    if (width >= AppSize.desktopMaxHeight) return DeviceType.desktop;
    if (width > AppSize.mobileMaxWidth && width < AppSize.desktopMaxHeight) return DeviceType.tablet;
    return DeviceType.mobile;
  }
}
