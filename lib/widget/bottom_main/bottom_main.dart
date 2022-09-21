import 'package:base_src/import.dart';
import 'package:base_src/widget/bottom_main/loading_wrapper.dart';

class BottomMainPage extends BaseScreen<BottomMainCtrl> {
  BottomMainPage(this.child, {Key? key}) : super(key: key);

  final Widget? child;

  @override
  Widget builder() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                _buildChild(),
              ],
            ),
            _buildLoading(),
          ],
        ),
      ),
    );
  }

  @override
  BottomMainCtrl? putController() => BottomMainCtrl();

  Widget _buildLoading() => LoadingWrapper();

  Widget _buildChild() => Expanded(child: child ?? const SizedBox());
}

class BottomMainCtrl extends BaseController {}
