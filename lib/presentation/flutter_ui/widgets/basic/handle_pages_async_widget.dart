import 'package:flutter/widgets.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious/presentation/common/contract/entity/enums/pages.dart';
import 'package:my_precious/presentation/common/contract/export_model_controller.dart';
import 'package:my_precious/service_locator.dart';

class HandlePagesAsyncWidget extends StatelessWidget with GetItMixin {
  HandlePagesAsyncWidget({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) => child;

  @override
  StatelessElement createElement() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initHandlers(this);
    });
    return super.createElement();
  }

  void _initHandlers(GetItMixin getItMixin) {
    // Register observers for showing pages after async logic.
    getItMixin.registerHandler<AppModelControllerMixin, Pages?>(
      (appModel) => appModel.pageAsyncListenerNotifier,
      (context, asyncPage, _) async {
        if (asyncPage != null) return _showPage(context, asyncPage);
      },
    );
  }

  Future<void> _showPage(BuildContext context, Pages page) async {
    uiLocator.navigationController.openPageRoute(context, page.route);
  }
}
