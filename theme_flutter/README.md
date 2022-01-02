# theme_flutter

### Learning Concepts
- Theme
    - brightness
        - dark
        - light
- Customize Theme
    - `theme: ThemeData.dark().copyWith(
      appBarTheme:AppBarTheme(
      backgroundColor: Color(0xff071953),
      ),
      scaffoldBackgroundColor: Color(0xff0a0e21),
      ),`
        - appBarTheme
            - Its customize the appbar of apps
            - set the Color of appbar
        - debugShowCheckedModeBanner
            - stop debug mode
        - scaffoldBackgroundColor
            - app body color customization
        - foregroundColor
            - Title color can be changed
        - centerTitle
            - Center the title
- Image
    - Color
        - Transparent image can be changed its color of the image
- Global Theme    
    - Theme
        - base theme
            - text theme
              - headline theme
              - subtitle theme
              - caption theme  
              - body theme
              - button theme
- Font
  - Create a directory `fonts`
  - add the `*.ttf` font file
  - add in `pubspec.yaml` file
    - uncomment the font section
    - add font family name
        - its usually fonts main name
        - need to indent everything
        - `pub get`
    - use in `fontFamily: "Lobster"`
    - if some time not works just build or rebuild the project
    - Local fontFamily changed -
        - `bodyText2: base.bodyText2?.copyWith(
          fontSize: 16.9,
          fontFamily: "Lobster",
          color: Colors.white,
          )`
    - Global fontFamily changed -
        - `baseTheme.copyWith(ThemeProperty).apply(fontFamily: "Lobster");`
- Resource
  - [Fonts Google](https://fonts.google.com/)
  - [MaterialIO](https://material.io/)  