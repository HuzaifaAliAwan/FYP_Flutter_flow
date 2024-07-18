import '/flutter_flow/flutter_flow_util.dart';
import 'control_panel_customer_widget.dart' show ControlPanelCustomerWidget;
import 'package:flutter/material.dart';

class ControlPanelCustomerModel
    extends FlutterFlowModel<ControlPanelCustomerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
