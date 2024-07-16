import '/flutter_flow/flutter_flow_util.dart';
import 'control_panel_extra_services_widget.dart'
    show ControlPanelExtraServicesWidget;
import 'package:flutter/material.dart';

class ControlPanelExtraServicesModel
    extends FlutterFlowModel<ControlPanelExtraServicesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for InputServiceName widget.
  FocusNode? inputServiceNameFocusNode;
  TextEditingController? inputServiceNameTextController;
  String? Function(BuildContext, String?)?
      inputServiceNameTextControllerValidator;
  // State field(s) for InputServicePrice widget.
  FocusNode? inputServicePriceFocusNode;
  TextEditingController? inputServicePriceTextController;
  String? Function(BuildContext, String?)?
      inputServicePriceTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    inputServiceNameFocusNode?.dispose();
    inputServiceNameTextController?.dispose();

    inputServicePriceFocusNode?.dispose();
    inputServicePriceTextController?.dispose();
  }
}
