import '/flutter_flow/flutter_flow_util.dart';
import 'view_property_customer_widget.dart' show ViewPropertyCustomerWidget;
import 'package:flutter/material.dart';

class ViewPropertyCustomerModel
    extends FlutterFlowModel<ViewPropertyCustomerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
