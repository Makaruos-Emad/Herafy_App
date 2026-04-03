import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';

class CustomListTitle<T> extends StatefulWidget {
  const CustomListTitle({
    super.key,
    required this.items,
    required this.titleBuilder,
    required this.onSelected,
    this.selected,
    this.initialSelected,
    this.leading,
    this.leadingBuilder,
    this.trailingBuilder,
    this.showSelectedTitle = true,
    this.placeholderText,
  });

  final List<T> items;
  final String Function(T item) titleBuilder;
  final ValueChanged<T> onSelected;
  final T? selected;
  final T? initialSelected;
  final Widget? leading;
  final Widget? Function(T item)? leadingBuilder;
  final Widget? Function(T item)? trailingBuilder;
  final bool showSelectedTitle;
  final String? placeholderText;

  @override
  State<CustomListTitle<T>> createState() => _CustomListTitleState<T>();
}

class _CustomListTitleState<T> extends State<CustomListTitle<T>> {
  T? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected ??
        widget.initialSelected ??
        (widget.placeholderText == null ? widget.items.firstOrNull : null);
  }

  @override
  void didUpdateWidget(covariant CustomListTitle<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selected != oldWidget.selected) {
      _selected = widget.selected;
    }
  }

  T? get _effectiveSelected => widget.selected ?? _selected;

  Widget? _buildLeading(T? selected) {
    if (selected == null) return widget.leading;
    return widget.leadingBuilder?.call(selected) ?? widget.leading;
  }

  @override
  Widget build(BuildContext context) {
    final selected = _effectiveSelected;
    final leading = _buildLeading(selected);

    final shouldShowTitle =
        selected == null || widget.showSelectedTitle || leading == null;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                return ListTile(
                  leading:
                      widget.leadingBuilder?.call(item) ?? widget.leading,
                  title: Text(
                    widget.titleBuilder(item),
                    style: const TextStyle(fontSize: 20),
                  ),
                  trailing: widget.trailingBuilder?.call(item),
                  onTap: () {
                    setState(() {
                      _selected = item;
                    });
                    widget.onSelected(item);
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: () {
            final children = <Widget>[];

            if (leading != null) {
              children.add(leading);
            }

            if (shouldShowTitle) {
              if (children.isNotEmpty) {
                children.add(const SizedBox(width: 6));
              }
              children.add(
                Text(
                  selected == null
                      ? (widget.placeholderText ?? "")
                      : widget.titleBuilder(selected),
                  style: TextStyle(
                    fontSize: 18,
                    color: selected == null ? Theme.of(context).hintColor : null,
                  ),
                ),
              );
            }

            if (children.isNotEmpty) {
              children.add(const SizedBox(width: 6));
            }

            children.add(const Icon(Icons.arrow_drop_down));

            return children;
          }(),
        ),
      ),
    );
  }
}

extension _FirstOrNullExt<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
