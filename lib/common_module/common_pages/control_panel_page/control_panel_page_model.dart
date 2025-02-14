import '/common_module/common_components/end_drawer_component/end_drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'control_panel_page_widget.dart' show ControlPanelPageWidget;
import 'package:flutter/material.dart';

class ControlPanelPageModel extends FlutterFlowModel<ControlPanelPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EndDrawerComponent component.
  late EndDrawerComponentModel endDrawerComponentModel;

  @override
  void initState(BuildContext context) {
    endDrawerComponentModel =
        createModel(context, () => EndDrawerComponentModel());
  }

  @override
  void dispose() {
    endDrawerComponentModel.dispose();
  }
}
