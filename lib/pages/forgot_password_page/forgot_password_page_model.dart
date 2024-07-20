import '/flutter_flow/flutter_flow_util.dart';
import 'forgot_password_page_widget.dart' show ForgotPasswordPageWidget;
import 'package:flutter/material.dart';

class ForgotPasswordPageModel
    extends FlutterFlowModel<ForgotPasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for forgotPWEmail widget.
  FocusNode? forgotPWEmailFocusNode;
  TextEditingController? forgotPWEmailTextController;
  String? Function(BuildContext, String?)? forgotPWEmailTextControllerValidator;
  String? _forgotPWEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    forgotPWEmailTextControllerValidator =
        _forgotPWEmailTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    forgotPWEmailFocusNode?.dispose();
    forgotPWEmailTextController?.dispose();
  }
}
