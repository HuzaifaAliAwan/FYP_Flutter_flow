import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/common_module/common_components/end_drawer_component/end_drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'conversation_page_model.dart';
export 'conversation_page_model.dart';

class ConversationPageWidget extends StatefulWidget {
  const ConversationPageWidget({super.key});

  @override
  State<ConversationPageWidget> createState() => _ConversationPageWidgetState();
}

class _ConversationPageWidgetState extends State<ConversationPageWidget>
    with TickerProviderStateMixin {
  late ConversationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConversationPageModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              'Conversations',
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StreamBuilder<List<ConversationsRecord>>(
                    stream: queryConversationsRecord(
                      queryBuilder: (conversationsRecord) =>
                          conversationsRecord.where(Filter.or(
                        Filter(
                          'propertyOwnerRef',
                          isEqualTo: currentUserReference,
                        ),
                        Filter(
                          'customerRef',
                          isEqualTo: currentUserReference,
                        ),
                      )),
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
                      List<ConversationsRecord> columnConversationsRecordList =
                          snapshot.data!;

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              columnConversationsRecordList.length,
                              (columnIndex) {
                            final columnConversationsRecord =
                                columnConversationsRecordList[columnIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 1.0),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    columnConversationsRecord.customerRef!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitDualRing(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }

                                  final userListUsersRecord = snapshot.data!;

                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (currentUserDocument?.role ==
                                          UserType.propertyOwner) {
                                        // update Conversation Document

                                        await columnConversationsRecord
                                            .reference
                                            .update(
                                                createConversationsRecordData(
                                          newMessagesForPropertyOwner: 0,
                                        ));
                                      } else {
                                        // update Conversation Document

                                        await columnConversationsRecord
                                            .reference
                                            .update(
                                                createConversationsRecordData(
                                          newMessagesForCustomer: 0,
                                        ));
                                      }

                                      await Future.wait([
                                        Future(() async {
                                          // get Customer document
                                          _model.customerDocument =
                                              await UsersRecord.getDocumentOnce(
                                                  columnConversationsRecord
                                                      .customerRef!);
                                        }),
                                        Future(() async {
                                          // get property owner document
                                          _model.propertyOwnerDocument =
                                              await UsersRecord.getDocumentOnce(
                                                  columnConversationsRecord
                                                      .propertyOwnerRef!);
                                        }),
                                      ]);
                                      // Navigate to ChatScreen

                                      context.pushNamed(
                                        'ChatScreenPage',
                                        queryParameters: {
                                          'conversationDocument':
                                              serializeParam(
                                            columnConversationsRecord,
                                            ParamType.Document,
                                          ),
                                          'receiverDocument': serializeParam(
                                            currentUserDocument?.role ==
                                                    UserType.propertyOwner
                                                ? _model.customerDocument
                                                : _model.propertyOwnerDocument,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'conversationDocument':
                                              columnConversationsRecord,
                                          'receiverDocument':
                                              currentUserDocument?.role ==
                                                      UserType.propertyOwner
                                                  ? _model.customerDocument
                                                  : _model
                                                      .propertyOwnerDocument,
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 300),
                                          ),
                                        },
                                      );

                                      safeSetState(() {});
                                    },
                                    child: SafeArea(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0.0,
                                              color: Color(0xFFE0E3E7),
                                              offset: Offset(
                                                0.0,
                                                1.0,
                                              ),
                                            )
                                          ],
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                columnConversationsRecord
                                                    .propertyOwnerRef!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitDualRing(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }

                                              final rowUsersRecord =
                                                  snapshot.data!;

                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 44.0,
                                                    height: 44.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x4C4B39EF),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF4B39EF),
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                          child: Image.network(
                                                            currentUserDocument
                                                                        ?.role ==
                                                                    UserType
                                                                        .propertyOwner
                                                                ? userListUsersRecord
                                                                    .photoUrl
                                                                : rowUsersRecord
                                                                    .photoUrl,
                                                            width: 60.0,
                                                            height: 60.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              AuthUserStreamWidget(
                                                            builder:
                                                                (context) =>
                                                                    Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                currentUserDocument
                                                                            ?.role ==
                                                                        UserType
                                                                            .propertyOwner
                                                                    ? userListUsersRecord
                                                                        .displayName
                                                                    : rowUsersRecord
                                                                        .displayName,
                                                                'null',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    color: Color(
                                                                        0xFF14181B),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            columnConversationsRecord
                                                                .lastMessage
                                                                .maybeHandleOverflow(
                                                              maxChars: 20,
                                                              replacement: '…',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: Color(0xFFF1F4F8),
                                                    elevation: 1.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (currentUserDocument
                                                                ?.role ==
                                                            UserType
                                                                .propertyOwner) {
                                                          return Builder(
                                                            builder: (context) {
                                                              if (columnConversationsRecord
                                                                      .newMessagesForPropertyOwner >
                                                                  0) {
                                                                return Text(
                                                                  columnConversationsRecord
                                                                      .newMessagesForPropertyOwner
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                );
                                                              } else {
                                                                return Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_right_rounded,
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    size: 24.0,
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          );
                                                        } else {
                                                          return Builder(
                                                            builder: (context) {
                                                              if (columnConversationsRecord
                                                                      .newMessagesForCustomer >
                                                                  0) {
                                                                return Text(
                                                                  columnConversationsRecord
                                                                      .newMessagesForCustomer
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                );
                                                              } else {
                                                                return Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_right_rounded,
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    size: 24.0,
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation']!);
                                },
                              ),
                            );
                          }).divide(SizedBox(height: 5.0)),
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FutureBuilder<List<ConversationsRecord>>(
                      future: queryConversationsRecordOnce(
                        queryBuilder: (conversationsRecord) =>
                            conversationsRecord.where(Filter.or(
                          Filter(
                            'propertyOwnerRef',
                            isEqualTo: currentUserReference,
                          ),
                          Filter(
                            'customerRef',
                            isEqualTo: currentUserReference,
                          ),
                        )),
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
                        List<ConversationsRecord>
                            conditionalBuilderConversationsRecordList =
                            snapshot.data!;

                        return Builder(
                          builder: (context) {
                            if (!(conditionalBuilderConversationsRecordList
                                .isNotEmpty)) {
                              return Text(
                                'No Conversation Available',
                                textAlign: TextAlign.center,
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
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation']!);
                            } else {
                              return Text(
                                '',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
