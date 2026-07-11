import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';

class CustomListTitleFormField<T> extends FormField<T> {
  CustomListTitleFormField({
    super.key,
    required List<T> items,
    required String Function(T item) titleBuilder,
    required ValueChanged<T> onSelected,
    super.initialValue,
    Widget? leading,
    Widget? Function(T item)? leadingBuilder,
    Widget? Function(T item)? trailingBuilder,
    bool showSelectedTitle = true,
    String? placeholderText,
    super.validator,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
  }) : super(
          builder: (FormFieldState<T> state) {
            final selected = state.value;

            Widget? buildLeading(T? selected) {
              if (selected == null) return leading;
              return leadingBuilder?.call(selected) ?? leading;
            }

            final leadingWidget = buildLeading(selected);

            final shouldShowTitle =
                selected == null || showSelectedTitle || leadingWidget == null;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: state.context,
                      builder: (_) {
                        return SafeArea(
                          child: ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return ListTile(
                                leading: leadingBuilder?.call(item) ?? leading,
                                title: Text(
                                  titleBuilder(item),
                                  style: const TextStyle(fontSize: 18),
                                ),
                                trailing: trailingBuilder?.call(item),
                                onTap: () {
                                  state.didChange(item);
                                  onSelected(item);
                                  Navigator.pop(context);
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: state.hasError
                            ? Colors.red
                            : AppColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: () {
                        final children = <Widget>[];

                        if (leadingWidget != null) {
                          children.add(leadingWidget);
                        }

                        if (shouldShowTitle) {
                          if (children.isNotEmpty) {
                            children.add(const SizedBox(width: 6));
                          }
                          children.add(
                            Expanded(
                              child: Text(
                                selected == null
                                    ? (placeholderText ?? "")
                                    : titleBuilder(selected),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: selected == null
                                      ? Theme.of(state.context).hintColor
                                      : null,
                                ),
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
                ),

                /// 🔥 error text
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 5),
                    child: Text(
                      state.errorText!,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
              ],
            );
          },
        );
}
