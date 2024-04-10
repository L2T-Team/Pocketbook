import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ListViewLoadMoreWidget extends StatefulWidget {
  final Axis scrollDirection;
  final bool reverse;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final int itemCount;
  final DragStartBehavior dragStartBehavior;
  final Function funcLoadMore;
  final IndexedWidgetBuilder itemBuilder;
  final bool canLoadMore;
  final bool showLoading;
  final EdgeInsetsGeometry? padding;

  const ListViewLoadMoreWidget({
    super.key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.physics,
    this.shrinkWrap = false,
    required this.itemBuilder,
    this.itemCount = 0,
    this.dragStartBehavior = DragStartBehavior.start,
    required this.funcLoadMore,
    required this.canLoadMore,
    required this.showLoading,
    this.padding,
  });

  @override
  State<ListViewLoadMoreWidget> createState() => _ListViewLoadMoreWidgetState();
}

class _ListViewLoadMoreWidgetState extends State<ListViewLoadMoreWidget>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();
  final offsetVisibleThreshold = 10.0;

  @override
  void initState() {
    _scrollController.addListener(execute);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            padding: widget.padding,
            controller: _scrollController,
            key: widget.key,
            itemBuilder: (context, index) => index == widget.itemCount
                ? widget.showLoading
                    ? const Center(child: CircularProgressIndicator())
                    : const SizedBox.shrink()
                : widget.itemBuilder(context, index),
            itemCount: widget.itemCount + 1,
            shrinkWrap: widget.shrinkWrap,
            physics: widget.physics,
            reverse: widget.reverse,
            scrollDirection: widget.scrollDirection,
            dragStartBehavior: widget.dragStartBehavior,
          ),
        ),
      ],
    );
  }

  void execute() {
    if (!widget.canLoadMore) return;
    if (_scrollController.offset + offsetVisibleThreshold >=
        _scrollController.position.maxScrollExtent) {
      widget.funcLoadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
