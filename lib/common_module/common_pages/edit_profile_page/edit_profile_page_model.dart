import '/common_module/common_components/end_drawer_component/end_drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_page_widget.dart' show EditProfilePageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditProfilePageModel extends FlutterFlowModel<EditProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for InputName widget.
  FocusNode? inputNameFocusNode;
  TextEditingController? inputNameTextController;
  String? Function(BuildContext, String?)? inputNameTextControllerValidator;
  String? _inputNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
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

  // Model for EndDrawerComponent component.
  late EndDrawerComponentModel endDrawerComponentModel;

  @override
  void initState(BuildContext context) {
    inputNameTextControllerValidator = _inputNameTextControllerValidator;
    inputPhoneTextControllerValidator = _inputPhoneTextControllerValidator;
    inputCnicTextControllerValidator = _inputCnicTextControllerValidator;
    inputAddressTextControllerValidator = _inputAddressTextControllerValidator;
    endDrawerComponentModel =
        createModel(context, () => EndDrawerComponentModel());
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

    endDrawerComponentModel.dispose();
  }
}
