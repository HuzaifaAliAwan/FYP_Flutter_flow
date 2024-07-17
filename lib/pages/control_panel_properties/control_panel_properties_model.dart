import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'control_panel_properties_widget.dart' show ControlPanelPropertiesWidget;
import 'package:flutter/material.dart';

class ControlPanelPropertiesModel
    extends FlutterFlowModel<ControlPanelPropertiesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for InputPropertyName widget.
  FocusNode? inputPropertyNameFocusNode;
  TextEditingController? inputPropertyNameTextController;
  String? Function(BuildContext, String?)?
      inputPropertyNameTextControllerValidator;
  // State field(s) for InputPropertyDescription widget.
  FocusNode? inputPropertyDescriptionFocusNode;
  TextEditingController? inputPropertyDescriptionTextController;
  String? Function(BuildContext, String?)?
      inputPropertyDescriptionTextControllerValidator;
  // State field(s) for InputPropertyPrice widget.
  FocusNode? inputPropertyPriceFocusNode;
  TextEditingController? inputPropertyPriceTextController;
  String? Function(BuildContext, String?)?
      inputPropertyPriceTextControllerValidator;
  // State field(s) for InputPropertyAddress widget.
  FocusNode? inputPropertyAddressFocusNode;
  TextEditingController? inputPropertyAddressTextController;
  String? Function(BuildContext, String?)?
      inputPropertyAddressTextControllerValidator;
  // State field(s) for inputPropertyAvailability widget.
  String? inputPropertyAvailabilityValue;
  FormFieldController<String>? inputPropertyAvailabilityValueController;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    inputPropertyNameFocusNode?.dispose();
    inputPropertyNameTextController?.dispose();

    inputPropertyDescriptionFocusNode?.dispose();
    inputPropertyDescriptionTextController?.dispose();

    inputPropertyPriceFocusNode?.dispose();
    inputPropertyPriceTextController?.dispose();

    inputPropertyAddressFocusNode?.dispose();
    inputPropertyAddressTextController?.dispose();
  }
}
