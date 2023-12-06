# movies

## Learning concepts

- Data Model
    - How to access data object using function
    - Make constructor
    - Select all of the variables  
    - Double tap `Shift` key and search for constructor
    - Without make an object direct access through static method
- Scaffold
    - `appBar`
        - AppBar
            - title
            - `backgroundColor`
    - `backgroundColor`
    - `body`
- `ListView.builder`
    - `itemCount`
    - `itemBuilder`
        - `(BuildContext context, int index) {
          return Widget();`
- `Positioned`
    - child
    - context
- Stack
  - children
  - alignment
- Card
    - elevation
    - color
    - child
    - `onTap()`
    - shape : `RoundedRectangleBorder`
        - borderRadius
            - `BorderRadius.circular(14.9)`
- ListTile
    - leading
    - color
    - trailing
    - title
    - subtitle
    - `onTap()`
- CircleAvatar
- BoxDecoration
  - image
  - borderRadius
- DecorationImage
  - image
  - fit
- Container
  - height
  - width
  - decoration
  - child
  - margin
  - padding
- Page route
  - Navigator
    - push
    - pop
    - `MaterialPageRoute()`
      - `builder (context) => {}`
  - Anything we can pass through constructor
- Return type `TextStyle`
- Return type `Widget`
- Height and Width Accessing Via MediaQuery
  - `MediaQuery.of(context).size.``width / height`
- Column
    - crossAxisAlignment
    - mainAxisAlignment
    - children
- Row
    - crossAxisAlignment
    - mainAxisAlignment
    - children
- Flexible
- NetworkImage
    - Url type `String`
- Icon
  - `Icons.arrow_back`
  - size
  - color
- LinearGradient
  - colors
      - `[Color1, Color2, Color3]`,
        - `Color1 = Color(0x00f5f5f5)`
  - begin
    - `Alignment.topCenter`
    - `Alignment.bottomCenter`
  - end
    - `Alignment.topCenter`
    - `Alignment.bottomCenter`
  - Using `Stack` and Make `height` using `Container`
- SizedBox
  - width
- Expanded
  - child
- TextStyle
  - fontWeight
  - fontSize
  - color
- `Text.rich`
  - TextSpan
    - style
    - children
    - text
      - `String`
- ClipRRect
  - child
  - borderRadius
    - `BorderRadius.all(Radius.circular(10.0))`
- Padding
  - padding
    - EdgeInsets
      - only
      - all
      - symmetric
  - child
- HorizontalLine Class
  - ```js
    class HorizontalLine extends StatelessWidget {
        const HorizontalLine({Key? key}) : super(key: key);
    ```
```
  @override
  Widget build(BuildContext context) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Container(
              height: 0.5,
              color: Colors.grey.shade800,
              ),
          );
      }
  }
```
- `ListView.separated`
  - scrollDirection
  - separatorBuilder
    - `(context, index) => SizedBox(width: 8,)`
  - itemCount
    - `posters.length` posters as a `String Array`
  - itemBuilder
    - passing a function that\'s return a widget
  
  

    
    
        
    
