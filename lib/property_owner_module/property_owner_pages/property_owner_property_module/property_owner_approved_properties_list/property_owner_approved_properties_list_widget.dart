import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/common_module/common_components/end_drawer_component/end_drawer_component_widget.dart';
import '/common_module/common_components/property_card/property_card_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'property_owner_approved_properties_list_model.dart';
export 'property_owner_approved_properties_list_model.dart';

class PropertyOwnerApprovedPropertiesListWidget extends StatefulWidget {
  const PropertyOwnerApprovedPropertiesListWidget({super.key});

  @override
  State<PropertyOwnerApprovedPropertiesListWidget> createState() =>
      _PropertyOwnerApprovedPropertiesListWidgetState();
}

class _PropertyOwnerApprovedPropertiesListWidgetState
    extends State<PropertyOwnerApprovedPropertiesListWidget> {
  late PropertyOwnerApprovedPropertiesListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => PropertyOwnerApprovedPropertiesListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().controlPanelPropertiesListSearchActive = false;
      safeSetState(() {});
    });

    _model.inputSearchTextController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<PropertyRecord>>(
      stream: queryPropertyRecord(
        queryBuilder: (propertyRecord) => propertyRecord
            .where(
              'propertyOwnerId',
              isEqualTo: currentUserReference,
            )
            .where(
              'approvalStatus',
              isEqualTo: PropertyApprovalType.approved.serialize(),
            ),
      ),
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
        List<PropertyRecord>
            propertyOwnerApprovedPropertiesListPropertyRecordList =
            snapshot.data!;

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
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'Approved Properties',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: FutureBuilder<int>(
                future: queryPropertyRecordCount(
                  queryBuilder: (propertyRecord) => propertyRecord
                      .where(
                        'propertyOwnerId',
                        isEqualTo: currentUserReference,
                      )
                      .where(
                        'approvalStatus',
                        isEqualTo: PropertyApprovalType.approved.serialize(),
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
                  int conditionalBuilderCount = snapshot.data!;

                  return Builder(
                    builder: (context) {
                      if (conditionalBuilderCount > 0) {
                        return Stack(
                          children: [
                            if (!FFAppState().homeSearchActive)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final property =
                                        propertyOwnerApprovedPropertiesListPropertyRecordList
                                            .toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: property.length,
                                      itemBuilder: (context, propertyIndex) {
                                        final propertyItem =
                                            property[propertyIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            PropertyCardWidget(
                                              key: Key(
                                                  'Keyao7_${propertyIndex}_of_${property.length}'),
                                              propertyReference:
                                                  propertyItem.reference,
                                            ),
                                          ]
                                              .divide(SizedBox(height: 5.0))
                                              .around(SizedBox(height: 5.0)),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            if (FFAppState().homeSearchActive)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final searchProperty =
                                        _model.simpleSearchResults.toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: searchProperty.length,
                                      itemBuilder:
                                          (context, searchPropertyIndex) {
                                        final searchPropertyItem =
                                            searchProperty[searchPropertyIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            PropertyCardWidget(
                                              key: Key(
                                                  'Key7dy_${searchPropertyIndex}_of_${searchProperty.length}'),
                                              propertyReference:
                                                  searchPropertyItem.reference,
                                            ),
                                          ]
                                              .divide(SizedBox(height: 5.0))
                                              .around(SizedBox(height: 5.0)),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 20.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                        spreadRadius: 4.0,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: double.infinity,
                                            child: Autocomplete<String>(
                                              initialValue: TextEditingValue(),
                                              optionsBuilder:
                                                  (textEditingValue) {
                                                if (textEditingValue.text ==
                                                    '') {
                                                  return const Iterable<
                                                      String>.empty();
                                                }
                                                return propertyOwnerApprovedPropertiesListPropertyRecordList
                                                    .map((e) => e.name)
                                                    .toList()
                                                    .where((option) {
                                                  final lowercaseOption =
                                                      option.toLowerCase();
                                                  return lowercaseOption
                                                      .contains(textEditingValue
                                                          .text
                                                          .toLowerCase());
                                                });
                                              },
                                              optionsViewBuilder: (context,
                                                  onSelected, options) {
                                                return AutocompleteOptionsList(
                                                  textFieldKey:
                                                      _model.inputSearchKey,
                                                  textController: _model
                                                      .inputSearchTextController!,
                                                  options: options.toList(),
                                                  onSelected: onSelected,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  textHighlightStyle:
                                                      TextStyle(),
                                                  elevation: 4.0,
                                                  optionBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  optionHighlightColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  maxHeight: 200.0,
                                                );
                                              },
                                              onSelected: (String selection) {
                                                safeSetState(() => _model
                                                        .inputSearchSelectedOption =
                                                    selection);
                                                FocusScope.of(context)
                                                    .unfocus();
                                              },
                                              fieldViewBuilder: (
                                                context,
                                                textEditingController,
                                                focusNode,
                                                onEditingComplete,
                                              ) {
                                                _model.inputSearchFocusNode =
                                                    focusNode;

                                                _model.inputSearchTextController =
                                                    textEditingController;
                                                return TextFormField(
                                                  key: _model.inputSearchKey,
                                                  controller:
                                                      textEditingController,
                                                  focusNode: focusNode,
                                                  onEditingComplete:
                                                      onEditingComplete,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.inputSearchTextController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () async {
                                                      // search property
                                                      safeSetState(() {
                                                        _model.simpleSearchResults =
                                                            TextSearch(
                                                          propertyOwnerApprovedPropertiesListPropertyRecordList
                                                              .map(
                                                                (record) =>
                                                                    TextSearchItem
                                                                        .fromTerms(
                                                                            record,
                                                                            [
                                                                      record
                                                                          .name
                                                                    ]),
                                                              )
                                                              .toList(),
                                                        )
                                                                .search(_model
                                                                    .inputSearchTextController
                                                                    .text)
                                                                .map((r) =>
                                                                    r.object)
                                                                .toList();
                                                        ;
                                                      });
                                                      // update Local State
                                                      FFAppState()
                                                              .controlPanelPropertiesListSearchActive =
                                                          true;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                  autofocus: false,
                                                  textInputAction:
                                                      TextInputAction.search,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelText:
                                                        'Search Property',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    alignLabelWithHint: true,
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  validator: _model
                                                      .inputSearchTextControllerValidator
                                                      .asValidator(context),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            // clearSearchField
                                            safeSetState(() {
                                              _model.inputSearchTextController
                                                  ?.clear();
                                            });
                                            // update app state
                                            FFAppState()
                                                    .controlPanelPropertiesListSearchActive =
                                                false;
                                            safeSetState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: AnimatedDefaultTextStyle(
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            duration: Duration(milliseconds: 600),
                            curve: Curves.easeInOut,
                            child: Text(
                              'No Property Available',
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
