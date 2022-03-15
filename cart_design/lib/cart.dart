import 'package:flutter/material.dart';
import 'customer.dart';
import 'customerCart.dart';
import 'draggingListItem.dart';
import 'item.dart';
import 'menuListItem.dart';

const List<Item> _items = [
  Item(
    name: 'Spinach Pizza',
    totalPrice: 1299,
    uid: '1',
    imageProvider: NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg'),
  ),
  Item(
    name: 'Veggie Delight',
    totalPrice: 799,
    uid: '2',
    imageProvider: NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food2.jpg'),
  ),
  Item(
    name: 'Chicken Parmesan',
    totalPrice: 1499,
    uid: '3',
    imageProvider: NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food3.jpg'),
  ),
];

@immutable
class DrageAndDrop extends StatefulWidget {
  const DrageAndDrop({Key? key}) : super(key: key);

  @override
  _DrageAndDropState createState() => _DrageAndDropState();
}

class _DrageAndDropState extends State<DrageAndDrop> with TickerProviderStateMixin{
  final List<Customer> _people = [
    Customer(
      name: 'Makayla',
      imageProvider: const NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Avatar1.jpg'),
    ),
    Customer(
      name: 'Nathan',
      imageProvider: const NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Avatar2.jpg'),
    ),
    Customer(
      name: 'Emilio',
      imageProvider: const NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Avatar3.jpg'),
    ),
  ];

  final GlobalKey _draggableKey = GlobalKey();

  void _itemDroppedOnCustomerCart({
    required Item item,
    required Customer customer,
}){
    setState(() {
      customer.items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: _buildAppBar(),
      body: _buildContent(),
    );
  }

  PreferredSizeWidget _buildAppBar(){
    return AppBar(
      iconTheme: const IconThemeData(color: Color(0xFFF64209)),
      title: Text('Order Food', 
        style: Theme.of(context).textTheme.headline4?.copyWith(
          fontSize: 36,
          color: const Color(0xFFF64209),
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color(0xFFF7F7F7),
      elevation: 0,
    );
  }

  Widget _buildContent(){
    return Stack(
      children: [
        SafeArea(child: Column(
          children: [
            Expanded(child: _buildMenuList(),),
            _buildPeopleRow(),
          ],
        ),
        ),
      ],
    );
  }

  Widget _buildMenuList(){
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index){
        final item = _items[index];
        return _buildMenuItem(
          item: item,
        );
        },
        separatorBuilder: (context, index){
        return const SizedBox(
          height: 12.0,
        );
        },
        itemCount: _items.length
    );
  }

  Widget _buildMenuItem({required Item item}){
    return LongPressDraggable<Item>(
        data: item,
        dragAnchorStrategy: pointerDragAnchorStrategy,

        child: MenuListItem(
          name: item.name,
          price: item.formattedTotalItemPrice,
          photoProvider: item.imageProvider,
        ),
        feedback: DraggingListItem(
          dragKey: _draggableKey,
          photoProvider: item.imageProvider,
        )
    );
  }

  Widget _buildPeopleRow() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 20.0,
      ),
      child: Row(
        children: _people.map(_buildPersonWithDropZone).toList(),
      ),
    );
  }

  Widget _buildPersonWithDropZone(Customer customer) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6.0,
        ),
        child: DragTarget<Item>(
          builder: (context, candidateItems, rejectedItems) {
            return CustomerCart(
              hasItems: customer.items.isNotEmpty,
              highlighted: candidateItems.isNotEmpty,
              customer: customer,
            );
          },
          onAccept: (item) {
            _itemDroppedOnCustomerCart(
              item: item,
              customer: customer,
            );
          },
        ),
      ),
    );
  }

}
