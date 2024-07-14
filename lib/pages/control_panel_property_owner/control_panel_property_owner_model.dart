import '/flutter_flow/flutter_flow_util.dart';
import 'control_panel_property_owner_widget.dart'
    show ControlPanelPropertyOwnerWidget;
import 'package:flutter/material.dart';

class ControlPanelPropertyOwnerModel
    extends FlutterFlowModel<ControlPanelPropertyOwnerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
