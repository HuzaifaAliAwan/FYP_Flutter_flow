import '/common_module/common_components/end_drawer_component/end_drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'property_owner_edit_property_widget.dart'
    show PropertyOwnerEditPropertyWidget;
import 'package:flutter/material.dart';

class PropertyOwnerEditPropertyModel
    extends FlutterFlowModel<PropertyOwnerEditPropertyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EndDrawerComponent component.
  late EndDrawerComponentModel endDrawerComponentModel;
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
  // State field(s) for InputExtraServices widget.
  List<String>? inputExtraServicesValue;
  FormFieldController<List<String>>? inputExtraServicesValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Custom Action - convertReferenceExtraService] action in addPropertyButton widget.
  List<DocumentReference>? convertedListOfSelectedExtraServices;

  @override
  void initState(BuildContext context) {
    endDrawerComponentModel =
        createModel(context, () => EndDrawerComponentModel());
  }

  @override
  void dispose() {
    endDrawerComponentModel.dispose();
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
