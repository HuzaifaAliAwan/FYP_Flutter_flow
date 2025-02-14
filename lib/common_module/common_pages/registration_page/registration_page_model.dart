import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'registration_page_widget.dart' show RegistrationPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegistrationPageModel extends FlutterFlowModel<RegistrationPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for InputName widget.
  FocusNode? inputNameFocusNode;
  TextEditingController? inputNameTextController;
  String? Function(BuildContext, String?)? inputNameTextControllerValidator;
  String? _inputNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^[a-zA-Z]+\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for InputPhone widget.
  FocusNode? inputPhoneFocusNode;
  TextEditingController? inputPhoneTextController;
  final inputPhoneMask = MaskTextInputFormatter(mask: '###########');
  String? Function(BuildContext, String?)? inputPhoneTextControllerValidator;
  String? _inputPhoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 11) {
      return 'Requires at least 11 characters.';
    }

    return null;
  }

  // State field(s) for InputCnic widget.
  FocusNode? inputCnicFocusNode;
  TextEditingController? inputCnicTextController;
  final inputCnicMask = MaskTextInputFormatter(mask: '#####-#######-#');
  String? Function(BuildContext, String?)? inputCnicTextControllerValidator;
  String? _inputCnicTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 15) {
      return 'Requires at least 15 characters.';
    }

    return null;
  }

  // State field(s) for InputAddress widget.
  FocusNode? inputAddressFocusNode;
  TextEditingController? inputAddressTextController;
  String? Function(BuildContext, String?)? inputAddressTextControllerValidator;
  String? _inputAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }

    return null;
  }

  // State field(s) for InputEmail widget.
  FocusNode? inputEmailFocusNode;
  TextEditingController? inputEmailTextController;
  String? Function(BuildContext, String?)? inputEmailTextControllerValidator;
  String? _inputEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for InputPassword widget.
  FocusNode? inputPasswordFocusNode;
  TextEditingController? inputPasswordTextController;
  late bool inputPasswordVisibility;
  String? Function(BuildContext, String?)? inputPasswordTextControllerValidator;
  String? _inputPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // State field(s) for InputConfirmPassword widget.
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

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // State field(s) for inputUserRole widget.
  UserType? inputUserRoleValue;
  FormFieldController<UserType>? inputUserRoleValueController;

  @override
  void initState(BuildContext context) {
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
