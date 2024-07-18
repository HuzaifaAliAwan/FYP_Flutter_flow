import '/flutter_flow/flutter_flow_util.dart';
import 'forgot_password_page_widget.dart' show ForgotPasswordPageWidget;
import 'package:flutter/material.dart';

class ForgotPasswordPageModel
    extends FlutterFlowModel<ForgotPasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for forgotPWEmail widget.
  FocusNode? forgotPWEmailFocusNode;
  TextEditingController? forgotPWEmailTextController;
  String? Function(BuildContext, String?)? forgotPWEmailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    forgotPWEmailFocusNode?.dispose();
    forgotPWEmailTextController?.dispose();
  }
}
