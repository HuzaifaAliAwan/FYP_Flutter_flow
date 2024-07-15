import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'login_register_widget.dart' show LoginRegisterWidget;
import 'package:flutter/material.dart';

class LoginRegisterModel extends FlutterFlowModel<LoginRegisterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for loginEmail widget.
  FocusNode? loginEmailFocusNode;
  TextEditingController? loginEmailTextController;
  String? Function(BuildContext, String?)? loginEmailTextControllerValidator;
  // State field(s) for LoginPassword widget.
  FocusNode? loginPasswordFocusNode;
  TextEditingController? loginPasswordTextController;
  late bool loginPasswordVisibility;
  String? Function(BuildContext, String?)? loginPasswordTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for inputName widget.
  FocusNode? inputNameFocusNode;
  TextEditingController? inputNameTextController;
  String? Function(BuildContext, String?)? inputNameTextControllerValidator;
  // State field(s) for inputPhone widget.
  FocusNode? inputPhoneFocusNode;
  TextEditingController? inputPhoneTextController;
  String? Function(BuildContext, String?)? inputPhoneTextControllerValidator;
  // State field(s) for inputCnic widget.
  FocusNode? inputCnicFocusNode;
  TextEditingController? inputCnicTextController;
  String? Function(BuildContext, String?)? inputCnicTextControllerValidator;
  // State field(s) for inputAddress widget.
  FocusNode? inputAddressFocusNode;
  TextEditingController? inputAddressTextController;
  String? Function(BuildContext, String?)? inputAddressTextControllerValidator;
  // State field(s) for inputEmail widget.
  FocusNode? inputEmailFocusNode;
  TextEditingController? inputEmailTextController;
  String? Function(BuildContext, String?)? inputEmailTextControllerValidator;
  // State field(s) for inputPassword widget.
  FocusNode? inputPasswordFocusNode;
  TextEditingController? inputPasswordTextController;
  late bool inputPasswordVisibility;
  String? Function(BuildContext, String?)? inputPasswordTextControllerValidator;
  // State field(s) for inputConfirmPassword widget.
  FocusNode? inputConfirmPasswordFocusNode;
  TextEditingController? inputConfirmPasswordTextController;
  late bool inputConfirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      inputConfirmPasswordTextControllerValidator;
  // State field(s) for inputRole widget.
  String? inputRoleValue;
  FormFieldController<String>? inputRoleValueController;

  @override
  void initState(BuildContext context) {
    loginPasswordVisibility = false;
    inputPasswordVisibility = false;
    inputConfirmPasswordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    loginEmailFocusNode?.dispose();
    loginEmailTextController?.dispose();

    loginPasswordFocusNode?.dispose();
    loginPasswordTextController?.dispose();

    inputNameFocusNode?.dispose();
    inputNameTextController?.dispose();

    inputPhoneFocusNode?.dispose();
    inputPhoneTextController?.dispose();

    inputCnicFocusNode?.dispose();
    inputCnicTextController?.dispose();

    inputAddressFocusNode?.dispose();
    inputAddressTextController?.dispose();

    inputEmailFocusNode?.dispose();
    inputEmailTextController?.dispose();

    inputPasswordFocusNode?.dispose();
    inputPasswordTextController?.dispose();

    inputConfirmPasswordFocusNode?.dispose();
    inputConfirmPasswordTextController?.dispose();
  }
}
