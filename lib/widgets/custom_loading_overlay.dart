import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:loading_overlay/loading_overlay.dart';

class CustomLoadingOverlay extends StatelessWidget {
  CustomLoadingOverlay({
    Key key,
    @required this.isLoading,
    @required this.child,
  }) : super(key: key);
  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: child,
      opacity: 0.1,
      color: CONSTANT.COLOR_PRIMARY,
    );
  }
}
