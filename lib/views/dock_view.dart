import 'package:flutter/material.dart';
import '../models/dock_item.dart';
import '../controllers/dock_controller.dart';

class DockView extends StatefulWidget {
  final DockController controller;
  final Widget Function(DockItem) itemBuilder;

  const DockView(
      {super.key, required this.controller, required this.itemBuilder});

  @override
  DockViewState createState() => DockViewState();
}

class DockViewState extends State<DockView> {
  int? _draggedItemIndex;
  int? _hoverIndex;
  bool _isDragging = false;

  double _calculateItemPosition(int index) {
    const double itemWidth = 60;
    const double spacing = 10;

    if (_draggedItemIndex != null && _hoverIndex != null) {
      if (index == _draggedItemIndex) {
        return index * (itemWidth + spacing);
      } else if (index > _draggedItemIndex! && index <= _hoverIndex!) {
        return (index - 1) * (itemWidth + spacing);
      } else if (index < _draggedItemIndex! && index >= _hoverIndex!) {
        return (index + 1) * (itemWidth + spacing);
      }
    }

    return index * (itemWidth + spacing);
  }

  bool _isWithinDockBounds(DragUpdateDetails details) {
    final renderBox = context.findRenderObject() as RenderBox;
    final dockPosition = renderBox.localToGlobal(Offset.zero);
    final dragPosition = details.globalPosition;

    return dragPosition.dx >= dockPosition.dx &&
        dragPosition.dx <= dockPosition.dx + renderBox.size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(4),
      height: 70,
      child: Stack(
        children: widget.controller.items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;

          return AnimatedPositioned(
            duration:
                _isDragging ? const Duration(milliseconds: 300) : Duration.zero,
            left: _calculateItemPosition(index),
            top: 0,
            bottom: 0,
            width: 60, // Width of each item
            child: LongPressDraggable<DockItem>(
              data: item,
              onDragStarted: () {
                setState(() {
                  _draggedItemIndex = index;
                  _hoverIndex = index;
                  _isDragging = true;
                });
              },
              onDragUpdate: (details) {
                if (_isWithinDockBounds(details)) {
                  setState(() {
                    _hoverIndex = (details.localPosition.dx / 70)
                        .round()
                        .clamp(0, widget.controller.items.length - 1);
                  });
                }
              },
              onDragEnd: (details) {
                setState(() {
                  if (_draggedItemIndex != null && _hoverIndex != null) {
                    final itemToMove =
                        widget.controller.items.removeAt(_draggedItemIndex!);
                    widget.controller.items.insert(_hoverIndex!, itemToMove);
                  }
                  _draggedItemIndex = null;
                  _hoverIndex = null;
                  _isDragging = false;
                });
              },
              feedback: Material(
                type: MaterialType.transparency,
                child: Opacity(
                  opacity: 0.7,
                  child: widget.itemBuilder(item),
                ),
              ),
              childWhenDragging: Opacity(
                opacity: 0.0,
                child: widget.itemBuilder(item),
              ),
              child: widget.itemBuilder(item),
            ),
          );
        }).toList(),
      ),
    );
  }
}
