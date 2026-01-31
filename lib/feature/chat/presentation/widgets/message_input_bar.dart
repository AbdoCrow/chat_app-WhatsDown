import 'package:flutter/material.dart';
import 'package:chat_app/core/theme/app_colors.dart';

class MessageInputBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onSend;
  final VoidCallback? onAttachmentPressed;
  final VoidCallback? onCameraPressed;
  final VoidCallback? onVoiceRecordStart;
  final VoidCallback? onVoiceRecordEnd;

  const MessageInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    this.onAttachmentPressed,
    this.onCameraPressed,
    this.onVoiceRecordStart,
    this.onVoiceRecordEnd,
  });

  @override
  State<MessageInputBar> createState() => _MessageInputBarState();
}

class _MessageInputBarState extends State<MessageInputBar> {
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final hasText = widget.controller.text.trim().isNotEmpty;
    if (hasText != _hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      color: AppColors.lightChatBackground,
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Input field container
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Emoji button
                    IconButton(
                      icon: const Icon(
                        Icons.emoji_emotions_outlined,
                        color: AppColors.lightIcon,
                      ),
                      onPressed: () {},
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(),
                    ),
                    // Text field
                    Expanded(
                      child: TextField(
                        controller: widget.controller,
                        maxLines: 5,
                        minLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          hintText: 'Message',
                          hintStyle: TextStyle(
                            color: AppColors.lightTextSecondary,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 10,
                          ),
                        ),
                      ),
                    ),
                    // Attachment button
                    IconButton(
                      icon: const Icon(
                        Icons.attach_file,
                        color: AppColors.lightIcon,
                      ),
                      onPressed: widget.onAttachmentPressed,
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(),
                    ),
                    // Camera button (shown when no text)
                    if (!_hasText)
                      IconButton(
                        icon: const Icon(
                          Icons.camera_alt,
                          color: AppColors.lightIcon,
                        ),
                        onPressed: widget.onCameraPressed,
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(),
                      ),
                    const SizedBox(width: 4),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Send / Voice button
            GestureDetector(
              onTap: _hasText
                  ? () => widget.onSend(widget.controller.text)
                  : null,
              onLongPressStart: !_hasText
                  ? (_) => widget.onVoiceRecordStart?.call()
                  : null,
              onLongPressEnd: !_hasText
                  ? (_) => widget.onVoiceRecordEnd?.call()
                  : null,
              child: Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _hasText ? Icons.send : Icons.mic,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReplyPreviewBar extends StatelessWidget {
  final String replyToName;
  final String replyToMessage;
  final VoidCallback onClose;

  const ReplyPreviewBar({
    super.key,
    required this.replyToName,
    required this.replyToMessage,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: const Border(
          left: BorderSide(color: AppColors.secondary, width: 4),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  replyToName,
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                Text(
                  replyToMessage,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 20),
            onPressed: onClose,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
