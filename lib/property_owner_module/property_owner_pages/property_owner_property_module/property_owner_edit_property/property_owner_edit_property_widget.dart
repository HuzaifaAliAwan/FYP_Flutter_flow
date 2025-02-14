import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/common_module/common_components/end_drawer_component/end_drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/property_owner_module/property_owner_components/property_has_been_updated/property_has_been_updated_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'property_owner_edit_property_model.dart';
export 'property_owner_edit_property_model.dart';

class PropertyOwnerEditPropertyWidget extends StatefulWidget {
  const PropertyOwnerEditPropertyWidget({
    super.key,
    required this.propertyId,
  });

  final DocumentReference? propertyId;

  @override
  State<PropertyOwnerEditPropertyWidget> createState() =>
      _PropertyOwnerEditPropertyWidgetState();
}

class _PropertyOwnerEditPropertyWidgetState
    extends State<PropertyOwnerEditPropertyWidget> {
  late PropertyOwnerEditPropertyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PropertyOwnerEditPropertyModel());

    _model.inputPropertyNameFocusNode ??= FocusNode();

    _model.inputPropertyDescriptionFocusNode ??= FocusNode();

    _model.inputPropertyPriceFocusNode ??= FocusNode();

    _model.inputPropertyAddressFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PropertyRecord>(
      stream: PropertyRecord.getDocument(widget.propertyId!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitDualRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }

        final propertyOwnerEditPropertyPropertyRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            endDrawer: Drawer(
              elevation: 16.0,
              child: wrapWithModel(
                model: _model.endDrawerComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: EndDrawerComponentWidget(),
              ),
            ),
            appBar: AppBar(
              backgroundColor: Color(0xFF0C55C6),
              automaticallyImplyLeading: false,
              leading: Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 0.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
              ),
              title: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'Edit Property',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              actions: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      // Open Drawer
                      scaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Enter Property Info',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                      TextFormField(
                        controller: _model.inputPropertyNameTextController ??=
                            TextEditingController(
                          text: propertyOwnerEditPropertyPropertyRecord.name,
                        ),
                        focusNode: _model.inputPropertyNameFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.inputPropertyNameTextController',
                          Duration(milliseconds: 2000),
                          () => safeSetState(() {}),
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Property Name',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 5.0, 10.0, 5.0),
                          suffixIcon: _model.inputPropertyNameTextController!
                                  .text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.inputPropertyNameTextController
                                        ?.clear();
                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    size: 22,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                        validator: _model
                            .inputPropertyNameTextControllerValidator
                            .asValidator(context),
                      ),
                      TextFormField(
                        controller:
                            _model.inputPropertyDescriptionTextController ??=
                                TextEditingController(
                          text: propertyOwnerEditPropertyPropertyRecord
                              .description,
                        ),
                        focusNode: _model.inputPropertyDescriptionFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.inputPropertyDescriptionTextController',
                          Duration(milliseconds: 2000),
                          () => safeSetState(() {}),
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 5.0, 10.0, 5.0),
                          suffixIcon: _model
                                  .inputPropertyDescriptionTextController!
                                  .text
                                  .isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model
                                        .inputPropertyDescriptionTextController
                                        ?.clear();
                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    size: 22,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                        minLines: 1,
                        validator: _model
                            .inputPropertyDescriptionTextControllerValidator
                            .asValidator(context),
                      ),
                      TextFormField(
                        controller: _model.inputPropertyPriceTextController ??=
                            TextEditingController(
                          text: propertyOwnerEditPropertyPropertyRecord.price
                              .toString(),
                        ),
                        focusNode: _model.inputPropertyPriceFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.inputPropertyPriceTextController',
                          Duration(milliseconds: 2000),
                          () => safeSetState(() {}),
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Price',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 5.0, 10.0, 5.0),
                          suffixIcon: _model.inputPropertyPriceTextController!
                                  .text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.inputPropertyPriceTextController
                                        ?.clear();
                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    size: 22,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                        validator: _model
                            .inputPropertyPriceTextControllerValidator
                            .asValidator(context),
                      ),
                      TextFormField(
                        controller:
                            _model.inputPropertyAddressTextController ??=
                                TextEditingController(
                          text: propertyOwnerEditPropertyPropertyRecord.address,
                        ),
                        focusNode: _model.inputPropertyAddressFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.inputPropertyAddressTextController',
                          Duration(milliseconds: 2000),
                          () => safeSetState(() {}),
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 5.0, 10.0, 5.0),
                          suffixIcon: _model.inputPropertyAddressTextController!
                                  .text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.inputPropertyAddressTextController
                                        ?.clear();
                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    size: 22,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                        validator: _model
                            .inputPropertyAddressTextControllerValidator
                            .asValidator(context),
                      ),
                      FlutterFlowDropDown<String>(
                        controller:
                            _model.inputPropertyAvailabilityValueController ??=
                                FormFieldController<String>(
                          _model.inputPropertyAvailabilityValue ??=
                              propertyOwnerEditPropertyPropertyRecord.available
                                  ? 'Available'
                                  : 'Not Available',
                        ),
                        options: ['Available', 'Not Available'],
                        onChanged: (val) => safeSetState(
                            () => _model.inputPropertyAvailabilityValue = val),
                        width: double.infinity,
                        height: 50.0,
                        searchHintTextStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        searchTextStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Roboto',
                                  letterSpacing: 0.0,
                                ),
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                        hintText: 'Avalibility',
                        searchHintText: 'Search for an item...',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).secondaryText,
                        borderWidth: 2.0,
                        borderRadius: 15.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: true,
                        isMultiSelect: false,
                      ),
                      StreamBuilder<List<ExtraServiceRecord>>(
                        stream: queryExtraServiceRecord(
                          queryBuilder: (extraServiceRecord) =>
                              extraServiceRecord.where(
                            'userId',
                            isEqualTo: currentUserReference,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitDualRing(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<ExtraServiceRecord>
                              inputExtraServicesExtraServiceRecordList =
                              snapshot.data!;

                          return FlutterFlowDropDown<String>(
                            multiSelectController:
                                _model.inputExtraServicesValueController ??=
                                    FormListFieldController<String>(null),
                            options: List<String>.from(
                                inputExtraServicesExtraServiceRecordList
                                    .map((e) => e.reference.id)
                                    .toList()),
                            optionLabels:
                                inputExtraServicesExtraServiceRecordList
                                    .map((e) => e.name)
                                    .toList(),
                            width: double.infinity,
                            height: 50.0,
                            searchHintTextStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            searchTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  letterSpacing: 0.0,
                                ),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Extra Services',
                            searchHintText: 'Search for extra service ... ',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            elevation: 2.0,
                            borderColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            borderWidth: 2.0,
                            borderRadius: 15.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: true,
                            isMultiSelect: true,
                            onMultiSelectChanged: (val) => safeSetState(
                                () => _model.inputExtraServicesValue = val),
                          );
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: SafeArea(
                          child: Container(
                            width: double.infinity,
                            height: 200.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/pictureuploadbg.png',
                                ).image,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 2.0,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Hero(
                                  tag: _model.uploadedFileUrl != ''
                                      ? _model.uploadedFileUrl
                                      : propertyOwnerEditPropertyPropertyRecord
                                          .photos,
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      _model.uploadedFileUrl != ''
                                          ? _model.uploadedFileUrl
                                          : propertyOwnerEditPropertyPropertyRecord
                                              .photos,
                                      width: double.infinity,
                                      height: 200.0,
                                      fit: BoxFit.contain,
                                      alignment: Alignment(0.0, 0.0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 100.0,
                                    borderWidth: 0.0,
                                    buttonSize: 100.0,
                                    fillColor: Color(0xE2808080),
                                    icon: Icon(
                                      Icons.upload_sharp,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 50.0,
                                    ),
                                    showLoadingIndicator: true,
                                    onPressed: () async {
                                      // uploadPicturetoFirebase
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        maxWidth: 1000.00,
                                        maxHeight: 1000.00,
                                        imageQuality: 70,
                                        allowPhoto: true,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        textColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        pickerFontFamily: 'Roboto',
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        safeSetState(() =>
                                            _model.isDataUploading = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();

                                          downloadUrls = (await Future.wait(
                                            selectedMedia.map(
                                              (m) async => await uploadData(
                                                  m.storagePath, m.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          _model.isDataUploading = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          safeSetState(() {
                                            _model.uploadedLocalFile =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl =
                                                downloadUrls.first;
                                          });
                                          showUploadMessage(
                                              context, 'Success!');
                                        } else {
                                          safeSetState(() {});
                                          showUploadMessage(
                                              context, 'Failed to upload data');
                                          return;
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              // convert to References
                              _model.convertedListOfSelectedExtraServices =
                                  await actions.convertReferenceExtraService(
                                _model.inputExtraServicesValue?.toList(),
                              );
                              // update property Document

                              await widget.propertyId!.update({
                                ...createPropertyRecordData(
                                  propertyOwnerId: currentUserReference,
                                  name: _model
                                      .inputPropertyNameTextController.text,
                                  description: _model
                                      .inputPropertyDescriptionTextController
                                      .text,
                                  price: double.tryParse(_model
                                      .inputPropertyPriceTextController.text),
                                  available: _model
                                              .inputPropertyAvailabilityValue !=
                                          null &&
                                      _model.inputPropertyAvailabilityValue !=
                                          '',
                                  address: _model
                                      .inputPropertyAddressTextController.text,
                                  photos: _model.uploadedFileUrl != ''
                                      ? _model.uploadedFileUrl
                                      : propertyOwnerEditPropertyPropertyRecord
                                          .photos,
                                ),
                                ...mapToFirestore(
                                  {
                                    'extraServices': _model
                                        .convertedListOfSelectedExtraServices,
                                  },
                                ),
                              });
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: PropertyHasBeenUpdatedWidget(),
                                    ),
                                  );
                                },
                              );

                              context.goNamed(
                                'PropertyOwnerApprovedPropertiesList',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                },
                              );

                              safeSetState(() {});
                            },
                            text: 'Update',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF0080FF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 20.0)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
