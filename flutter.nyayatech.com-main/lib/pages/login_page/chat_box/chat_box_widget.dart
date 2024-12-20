import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/genric_text_field.dart';
import 'package:nyaya_tech/pages/login_page/chat_box/chat_box_model.dart';
import 'package:nyaya_tech/pages/login_page/chat_box/comment_box.dart';
import 'package:nyaya_tech/components/menu_item.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/text_field_component.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/index.dart';
import 'package:nyaya_tech/providers/comments_provider.dart';
import 'package:nyaya_tech/response/get_comments_response.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';

class newCount extends StatelessWidget {
  const newCount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<CommentsProvider>().taskcommentsData.length}',
        key: const Key('counterState'),
        style: Theme.of(context).textTheme.headlineMedium);
  }
}

class ChatBoxWidget extends StatefulWidget {
  const ChatBoxWidget({super.key});

  @override
  State<ChatBoxWidget> createState() => _ChatBoxWidgetState();
}

class _ChatBoxWidgetState extends State<ChatBoxWidget> {
  late ChatBoxModel _model;
  TextEditingController commentController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatBoxModel());
  }

  Future<void> fetchCommentsData() async {
    final List<Commentdata> currentComments = await _model.fetchcomments();
    context.read<CommentsProvider>().setTaskCommentData(currentComments);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: Container(
            width: 50,
            child: Builder(
              builder: (context) => Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero)),
                  onPressed: () {
                    showPopover(
                        context: context,
                        bodyBuilder: (context) => Container(
                              padding: EdgeInsets.only(top: 30, bottom: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  MenuItem(
                                    text: 'Case Details',
                                    color: Colors.white.withOpacity(0.5),
                                    ontap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: ViewCaseWidget(),
                                        ),
                                      );
                                    },
                                  ),
                                  MenuItem(
                                    text: 'Files',
                                    color: Colors.white.withOpacity(0.5),
                                    ontap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FilesWidget()),
                                      );
                                    },
                                  ),
                                  MenuItem(
                                      text: 'Chat Box',
                                      color: Colors.white,
                                      ontap: () {}),
                                  MenuItem(
                                    text: 'Notes',
                                    color: Colors.white.withOpacity(0.5),
                                    ontap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: NotesScreenWidget()),
                                      );
                                    },
                                  ),
                                  MenuItem(
                                    text: 'Hearing Summary',
                                    color: Colors.white.withOpacity(0.5),
                                    ontap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: HearingSummaryWidget()),
                                      );
                                    },
                                  ),
                                  MenuItem(
                                    text: 'Logs',
                                    color: Colors.white.withOpacity(0.5),
                                    ontap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: LogsWidget()),
                                      );
                                    },
                                  ),
                                ].divide(SizedBox(height: 16)),
                              ),
                            ),
                        direction: PopoverDirection.left,
                        width: 250,
                        height: 230,
                        arrowHeight: 15,
                        arrowWidth: 30,
                        backgroundColor: Colors.black);
                  },
                  backgroundColor: Colors.black,
                  elevation: 8,
                  child:
                      Icon(Icons.menu_rounded, color: Colors.white, size: 32),
                ),
              ),
            ),
          ),
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.bottombar,
                            arguments: {'currentIndex': 2});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24),
                        ),
                      ),
                    ),
                    Text(
                      'Chat Box',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'DM Sans',
                          color: Color(0xFF181616),
                          fontSize: 16,
                          letterSpacing: 0,
                          lineHeight: 1.6),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.help_outline_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: fetchCommentsData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child:
                              CircularProgressIndicator(color: Colors.black));
                    } else if (context
                        .watch<CommentsProvider>()
                        .taskcommentsData
                        .isNotEmpty) {
                      return ListView.builder(
                        itemCount: context
                            .watch<CommentsProvider>()
                            .taskcommentsData
                            .length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12),
                            child: CommentBox(
                              commentData: context
                                  .watch<CommentsProvider>()
                                  .taskcommentsData[index],
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: SvgPicture.asset(
                                    "assets/images/no_Chat.svg",
                                    color: Color(0xFF05A155),
                                    height: 50,
                                    width: 50),
                              ),
                              const SizedBox(height: 10),
                              const Text("No comments yet"),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    thickness: 2,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(Icons.mic_none,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24),
                              Icon(
                                Icons.image_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              Expanded(
                                child: CommentTextField(
                                    controller: commentController,
                                    hintText: 'Type message',
                                    errorKey: '',
                                    textInputType: TextInputType.multiline,
                                    maxLine: 1),
                              ),
                            ].divide(SizedBox(width: 8)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            print('comments are uploaded');
                            if (commentController.text.trim().isEmpty) {
                              return;
                            }
                            await _model.fetchPostComments(
                                comments: commentController.text.trim());
                            setState(() {});
                            setState(() {});
                            commentController.text = '';
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SvgPicture.asset(
                                'assets/images/send_icon.svg',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ].divide(SizedBox(width: 8)),
                    ),
                  ),
                ],
              ),
            ].divide(SizedBox(height: 24)),
          ),
        ),
      ),
    );
  }
}
