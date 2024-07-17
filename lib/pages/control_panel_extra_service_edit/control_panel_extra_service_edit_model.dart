import '/flutter_flow/flutter_flow_util.dart';
import 'control_panel_extra_service_edit_widget.dart'
    show ControlPanelExtraServiceEditWidget;
import 'package:flutter/material.dart';

class ControlPanelExtraServiceEditModel
    extends FlutterFlowModel<ControlPanelExtraServiceEditWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
    inputServiceNameFocusNode?.dispose();
    inputServiceNameTextController?.dispose();

    inputServicePriceFocusNode?.dispose();
    inputServicePriceTextController?.dispose();
  }
}
