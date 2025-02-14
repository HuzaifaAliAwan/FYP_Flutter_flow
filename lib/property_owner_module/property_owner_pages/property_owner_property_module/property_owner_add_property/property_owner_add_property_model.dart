import '/common_module/common_components/end_drawer_component/end_drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'property_owner_add_property_widget.dart'
    show PropertyOwnerAddPropertyWidget;
import 'package:flutter/material.dart';

class PropertyOwnerAddPropertyModel
    extends FlutterFlowModel<PropertyOwnerAddPropertyWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for EndDrawerComponent component.
  late EndDrawerComponentModel endDrawerComponentModel;
  // State field(s) for InputPropertyName widget.
  FocusNode? inputPropertyNameFocusNode;
  TextEditingController? inputPropertyNameTextController;
  String? Function(BuildContext, String?)?
      inputPropertyNameTextControllerValidator;
  String? _inputPropertyNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for InputPropertyDescription widget.
  FocusNode? inputPropertyDescriptionFocusNode;
  TextEditingController? inputPropertyDescriptionTextController;
  String? Function(BuildContext, String?)?
      inputPropertyDescriptionTextControllerValidator;
  String? _inputPropertyDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for InputPropertyAddress widget.
  FocusNode? inputPropertyAddressFocusNode;
  TextEditingController? inputPropertyAddressTextController;
  String? Function(BuildContext, String?)?
      inputPropertyAddressTextControllerValidator;
  String? _inputPropertyAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for InputCity widget.
  FocusNode? inputCityFocusNode;
  TextEditingController? inputCityTextController;
  String? Function(BuildContext, String?)? inputCityTextControllerValidator;
  String? _inputCityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for inputSeason widget.
  String? inputSeasonValue;
  FormFieldController<String>? inputSeasonValueController;
  // State field(s) for inputAttachedBath widget.
  int? inputAttachedBathValue;
  FormFieldController<int>? inputAttachedBathValueController;
  // State field(s) for InputWifi widget.
  int? inputWifiValue;
  FormFieldController<int>? inputWifiValueController;
  // State field(s) for InputAC widget.
  int? inputACValue;
  FormFieldController<int>? inputACValueController;
  // State field(s) for InputParking widget.
  int? inputParkingValue;
  FormFieldController<int>? inputParkingValueController;
  // State field(s) for InputPublicTransport widget.
  int? inputPublicTransportValue;
  FormFieldController<int>? inputPublicTransportValueController;
  // State field(s) for InputGroceryStores widget.
  int? inputGroceryStoresValue;
  FormFieldController<int>? inputGroceryStoresValueController;
  // State field(s) for InputRestaurants widget.
  int? inputRestaurantsValue;
  FormFieldController<int>? inputRestaurantsValueController;
  // State field(s) for InputTouristAttractions widget.
  int? inputTouristAttractionsValue;
  FormFieldController<int>? inputTouristAttractionsValueController;
  // State field(s) for InputHospital widget.
  int? inputHospitalValue;
  FormFieldController<int>? inputHospitalValueController;
  // State field(s) for inputPropertyAvailability widget.
  String? inputPropertyAvailabilityValue;
  FormFieldController<String>? inputPropertyAvailabilityValueController;
  // State field(s) for ExtraServices widget.
  List<String>? extraServicesValue;
  FormFieldController<List<String>>? extraServicesValueController;
  // State field(s) for InputPropertyPrice widget.
  FocusNode? inputPropertyPriceFocusNode;
  TextEditingController? inputPropertyPriceTextController;
  String? Function(BuildContext, String?)?
      inputPropertyPriceTextControllerValidator;
  String? _inputPropertyPriceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Custom Action - convertReferenceExtraService] action in addPropertyButton widget.
  List<DocumentReference>? convertedListOfSelectedExtraServices;

  @override
  void initState(BuildContext context) {
    endDrawerComponentModel =
        createModel(context, () => EndDrawerComponentModel());
    inputPropertyNameTextControllerValidator =
        _inputPropertyNameTextControllerValidator;
    inputPropertyDescriptionTextControllerValidator =
        _inputPropertyDescriptionTextControllerValidator;
    inputPropertyAddressTextControllerValidator =
        _inputPropertyAddressTextControllerValidator;
    inputCityTextControllerValidator = _inputCityTextControllerValidator;
    inputPropertyPriceTextControllerValidator =
        _inputPropertyPriceTextControllerValidator;
  }

  @override
  void dispose() {
    endDrawerComponentModel.dispose();
    inputPropertyNameFocusNode?.dispose();
    inputPropertyNameTextController?.dispose();

    inputPropertyDescriptionFocusNode?.dispose();
    inputPropertyDescriptionTextController?.dispose();

    inputPropertyAddressFocusNode?.dispose();
    inputPropertyAddressTextController?.dispose();

    inputCityFocusNode?.dispose();
    inputCityTextController?.dispose();

    inputPropertyPriceFocusNode?.dispose();
    inputPropertyPriceTextController?.dispose();
  }
}
