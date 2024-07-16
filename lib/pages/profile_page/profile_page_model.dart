import '/flutter_flow/flutter_flow_util.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for FormName widget.
  FocusNode? formNameFocusNode;
  TextEditingController? formNameTextController;
  String? Function(BuildContext, String?)? formNameTextControllerValidator;
  // State field(s) for FormEmail widget.
  FocusNode? formEmailFocusNode;
  TextEditingController? formEmailTextController;
  String? Function(BuildContext, String?)? formEmailTextControllerValidator;
  // State field(s) for FormAddress widget.
  FocusNode? formAddressFocusNode;
  TextEditingController? formAddressTextController;
  String? Function(BuildContext, String?)? formAddressTextControllerValidator;
  // State field(s) for FormCnic widget.
  FocusNode? formCnicFocusNode;
  TextEditingController? formCnicTextController;
  String? Function(BuildContext, String?)? formCnicTextControllerValidator;
  // State field(s) for FormContact widget.
  FocusNode? formContactFocusNode;
  TextEditingController? formContactTextController;
  String? Function(BuildContext, String?)? formContactTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    formNameFocusNode?.dispose();
    formNameTextController?.dispose();

    formEmailFocusNode?.dispose();
    formEmailTextController?.dispose();

    formAddressFocusNode?.dispose();
    formAddressTextController?.dispose();

    formCnicFocusNode?.dispose();
    formCnicTextController?.dispose();

    formContactFocusNode?.dispose();
    formContactTextController?.dispose();
  }
}
