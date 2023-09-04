# quiz_app

## Learning Concepts -
 - Assets
    - How to add an image in project
    - Modification of `pubspec.yaml` file
    - Run `pub get` command
 - Data Model
   - Name-constructor design
   - Modeling data
 - Snack Bar
   - Duration functionality
   - Background color
   - Context Passing
   - Example :
        -
          ```js
          final snackbar = SnackBar(
            content: const Text("Incorrect!"),
            backgroundColor: Colors.deepOrange,
            duration: Duration(milliseconds: 500),
            );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          ```
 - Elevated Button
   - Style
     - Example : 
       -
       ```js
         ElevatedButton.styleFrom(
            primary: Colors.blueGrey.shade900
         )
       ```
   - onPressed method
   - Child
      - Example :
         - Any type of widget like Text, Icon etc
 - Scaffold
   - appBar
   - Background Color
   - Body
      - Hold any kind of widget
 - AppBar
    - title
    - center title
    - background color
 - Container
    - child
        - Hold any kind of widget
    - height
    - width
 - Column
    - Main axis alignment
    - children
 - Box Decoration
    - color
    - border radius
    - border
        - Border.all()
            - color
            - style
                - `BorderStyle.solid`
 - Row
    - main axis alignment
        - spaceBetween
        - spaceEvenly
        - spaceAround  
        - start
        - center
        - end
 - debugPrint   
        
    
   
