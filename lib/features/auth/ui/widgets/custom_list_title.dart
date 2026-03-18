import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/features/auth/models/list_contry.dart';

class CustomListTitle extends StatefulWidget {
  const CustomListTitle({
    super.key,
    required this.onCountrySelected,
    required this.listItems,
    required this.leadingIcon,
    this.initialSelected,
    this.showSelectedTitle = true,
    this.placeholderText,
  });

  final ValueChanged<Country> onCountrySelected;
  final List<Country> listItems;
  final Icon? leadingIcon;
  final Country? initialSelected;
  final bool showSelectedTitle;
  final String? placeholderText;

  @override
  State<CustomListTitle> createState() => _CustomListTitleState();
}

class _CustomListTitleState extends State<CustomListTitle> {
  Country? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialSelected ??
        (widget.placeholderText == null ? widget.listItems.first : null);
  }

  @override
  Widget build(BuildContext context) {
    final selected = _selected;
    final shouldShowTitle = selected == null ||
        widget.showSelectedTitle ||
        selected.flag == null;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return ListView.builder(
              itemCount: widget.listItems.length,
              itemBuilder: (context, index) {
                final item = widget.listItems[index];
                return ListTile(
                  leading: item.flag == null
                      ? widget.leadingIcon
                      : Text(item.flag!, style: const TextStyle(fontSize: 20)),
                  title: Text(item.title, style: const TextStyle(fontSize: 20)),
                  trailing: item.code == null
                      ? null
                      : Text(
                          item.code!,
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(fontSize: 16),
                        ),
                  onTap: () {
                    setState(() {
                      _selected = item;
                    });
                    widget.onCountrySelected(item);
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

            if (selected == null) {
              if (widget.leadingIcon != null) {
                children.add(widget.leadingIcon!);
              }
            } else {
              if (selected.flag == null && widget.leadingIcon != null) {
                children.add(widget.leadingIcon!);
              } else if (selected.flag != null) {
                children.add(
                  Text(selected.flag!, style: const TextStyle(fontSize: 20)),
                );
              }
            }

            if (shouldShowTitle) {
              if (children.isNotEmpty) {
                children.add(const SizedBox(width: 6));
              }
              children.add(
                Text(
                  selected?.title ?? (widget.placeholderText ?? ""),
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
