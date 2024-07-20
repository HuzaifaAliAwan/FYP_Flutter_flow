import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'login_register_widget.dart' show LoginRegisterWidget;
import 'package:flutter/material.dart';

class LoginRegisterModel extends FlutterFlowModel<LoginRegisterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for loginEmail widget.
  FocusNode? loginEmailFocusNode;
  TextEditingController? loginEmailTextController;
  String? Function(BuildContext, String?)? loginEmailTextControllerValidator;
  String? _loginEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Please use correct synatx of email.';
    }
    return null;
  }

  // State field(s) for LoginPassword widget.
  FocusNode? loginPasswordFocusNode;
  TextEditingController? loginPasswordTextController;
  late bool loginPasswordVisibility;
  String? Function(BuildContext, String?)? loginPasswordTextControllerValidator;
  String? _loginPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Please enter at least 8 characters';
    }
    if (val.length > 20) {
      return 'password must not exceed 20 characters';
    }
    if (!RegExp('^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@\$!%*?&]).*\$')
        .hasMatch(val)) {
      return 'please use correct password';
    }
    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for inputName widget.
  FocusNode? inputNameFocusNode;
  TextEditingController? inputNameTextController;
  String? Function(BuildContext, String?)? inputNameTextControllerValidator;
  String? _inputNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Please enter name with only alphabets';
    }
    return null;
  }

  // State field(s) for inputPhone widget.
  FocusNode? inputPhoneFocusNode;
  TextEditingController? inputPhoneTextController;
  String? Function(BuildContext, String?)? inputPhoneTextControllerValidator;
  String? _inputPhoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 15) {
      return 'Also add spaces that are in syntax';
    }
    if (val.length > 15) {
      return 'Number Exceeding characters limit';
    }
    if (!RegExp('^\\+92 \\d{3} \\d{7}\$').hasMatch(val)) {
      return 'Please Enter number in correct format';
    }
    return null;
  }

  // State field(s) for inputCnic widget.
  FocusNode? inputCnicFocusNode;
  TextEditingController? inputCnicTextController;
  String? Function(BuildContext, String?)? inputCnicTextControllerValidator;
  String? _inputCnicTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 15) {
      return 'Also add dashes that are in syntax';
    }
    if (val.length > 15) {
      return 'Number Exceeding characters limit';
    }
    if (!RegExp('^\\d{5}-\\d{7}-\\d{1}\$').hasMatch(val)) {
      return 'Please Enter CNIC in correct syntax';
    }
    return null;
  }

  // State field(s) for inputAddress widget.
  FocusNode? inputAddressFocusNode;
  TextEditingController? inputAddressTextController;
  String? Function(BuildContext, String?)? inputAddressTextControllerValidator;
  String? _inputAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^[a-zA-Z0-9 ]*\$').hasMatch(val)) {
      return 'Please don\'t use special characters in address';
    }
    return null;
  }

  // State field(s) for inputEmail widget.
  FocusNode? inputEmailFocusNode;
  TextEditingController? inputEmailTextController;
  String? Function(BuildContext, String?)? inputEmailTextControllerValidator;
  String? _inputEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Please enter correct email ';
    }
    return null;
  }

  // State field(s) for inputPassword widget.
  FocusNode? inputPasswordFocusNode;
  TextEditingController? inputPasswordTextController;
  late bool inputPasswordVisibility;
  String? Function(BuildContext, String?)? inputPasswordTextControllerValidator;
  String? _inputPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Please create password with atleast 8 characters';
    }
    if (val.length > 20) {
      return 'password must not extend 20 characters';
    }
    if (!RegExp('^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@\$!%*?&]).*\$')
        .hasMatch(val)) {
      return 'please use at least 1 uppercase, 1 lowercase, 1 special character, 1 number .';
    }
    return null;
  }

  // State field(s) for inputConfirmPassword widget.
  FocusNode? inputConfirmPasswordFocusNode;
  TextEditingController? inputConfirmPasswordTextController;
  late bool inputConfirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      inputConfirmPasswordTextControllerValidator;
  String? _inputConfirmPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Please create password with atleast 8 characters';
    }
    if (val.length > 20) {
      return 'password must not extend 20 characters';
    }
    if (!RegExp('^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@\$!%*?&]).*\$')
        .hasMatch(val)) {
      return 'please use at least 1 uppercase, 1 lowercase, 1 special character, 1 number .';
    }
    return null;
  }

  // State field(s) for inputRole widget.
  String? inputRoleValue;
  FormFieldController<String>? inputRoleValueController;

  @override
  void initState(BuildContext context) {
    loginEmailTextControllerValidator = _loginEmailTextControllerValidator;
    loginPasswordVisibility = false;
    loginPasswordTextControllerValidator =
        _loginPasswordTextControllerValidator;
    inputNameTextControllerValidator = _inputNameTextControllerValidator;
    inputPhoneTextControllerValidator = _inputPhoneTextControllerValidator;
    inputCnicTextControllerValidator = _inputCnicTextControllerValidator;
    inputAddressTextControllerValidator = _inputAddressTextControllerValidator;
    inputEmailTextControllerValidator = _inputEmailTextControllerValidator;
    inputPasswordVisibility = false;
    inputPasswordTextControllerValidator =
        _inputPasswordTextControllerValidator;
    inputConfirmPasswordVisibility = false;
    inputConfirmPasswordTextControllerValidator =
        _inputConfirmPasswordTextControllerValidator;
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
