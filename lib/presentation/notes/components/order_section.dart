import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/util/note_order.dart';
import 'package:flutter_note_app/domain/util/order_type.dart';

class OrderSection extends StatelessWidget {
  final NoteOrder noteOrder;
  final Function(NoteOrder) onOrderChanged;

  const OrderSection({
    super.key,
    required this.noteOrder,
    required this.onOrderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio<NoteOrder>(
              value: NoteOrder.title(noteOrder.orderType),
              groupValue: noteOrder,
              activeColor: Colors.white,
              focusColor: Colors.white,
              onChanged: (NoteOrder? value) {
                onOrderChanged(NoteOrder.title(noteOrder.orderType));
              },
            ),
            const Text(
              '제목',
              style: TextStyle(color: Colors.white),
            ),
            Radio<NoteOrder>(
              value: NoteOrder.date(noteOrder.orderType),
              groupValue: noteOrder,
              activeColor: Colors.white,
              focusColor: Colors.white,
              onChanged: (NoteOrder? value) {
                onOrderChanged(NoteOrder.date(noteOrder.orderType));
              },
            ),
            const Text(
              '날짜',
              style: TextStyle(color: Colors.white),
            ),
            Radio<NoteOrder>(
              value: NoteOrder.color(noteOrder.orderType),
              groupValue: noteOrder,
              activeColor: Colors.white,
              focusColor: Colors.white,
              onChanged: (NoteOrder? value) {
                onOrderChanged(NoteOrder.color(noteOrder.orderType));
              },
            ),
            const Text(
              '색상',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        Row(
          children: [
            Radio<OrderType>(
              value: OrderType.ascending(),
              groupValue: noteOrder.orderType,
              activeColor: Colors.white,
              focusColor: Colors.white,
              onChanged: (OrderType? value) {
                onOrderChanged(
                  noteOrder.copyWith(
                    orderType: const OrderType.ascending(),
                  ),
                );
              },
            ),
            const Text(
              '오름차순',
              style: TextStyle(color: Colors.white),
            ),
            Radio<OrderType>(
              value: OrderType.descending(),
              groupValue: noteOrder.orderType,
              activeColor: Colors.white,
              focusColor: Colors.white,
              onChanged: (OrderType? value) {
                onOrderChanged(
                  noteOrder.copyWith(
                    orderType: const OrderType.descending(),
                  ),
                );
              },
            ),
            const Text(
              '내림차순',
              style: TextStyle(color: Colors.white),
            ),
          ],
        )
      ],
    );
  }
}
