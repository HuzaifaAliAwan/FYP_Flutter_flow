import '/flutter_flow/flutter_flow_util.dart';
import 'control_panel_booking_property_owner_widget.dart'
    show ControlPanelBookingPropertyOwnerWidget;
import 'package:flutter/material.dart';

class ControlPanelBookingPropertyOwnerModel
    extends FlutterFlowModel<ControlPanelBookingPropertyOwnerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }
}
