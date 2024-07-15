import '/flutter_flow/flutter_flow_util.dart';
import 'control_panel_widget.dart' show ControlPanelWidget;
import 'package:flutter/material.dart';

class ControlPanelModel extends FlutterFlowModel<ControlPanelWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
