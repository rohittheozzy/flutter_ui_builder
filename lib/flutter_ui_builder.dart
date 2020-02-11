library flutter_ui_builder;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

bool editModeOn = true;

class UiBuilderTextConf {
  Function callback;
  UiBuilderTextConf(
      this.data, {
        Key key,
        this.callback,
        this.style,
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        //this.EditModeOn,
      })  : assert(
  data != null,
  'A non-null String must be provided to a Text widget.',
  ),
        textSpan = null;

  String data;
  TextStyle style;
  StrutStyle strutStyle;
  TextAlign textAlign;
  TextDirection textDirection;
  Locale locale;
  bool softWrap;
  TextOverflow overflow;
  double textScaleFactor;
  int maxLines;
  String semanticsLabel;
  TextWidthBasis textWidthBasis;

  bool inherit;
  Color color;
  Color backgroundColor;
  String fontFamily;
  InlineSpan textSpan;
  String _package;
  double fontSize;
  static double _defaultFontSize = 14.0;
  FontWeight fontWeight;
  FontStyle fontStyle;
  double letterSpacing;
  double wordSpacing;
  TextBaseline textBaseline;
  double height;
  Paint foreground;
  Paint background;
  TextDecoration decoration;
  Color decorationColor;
  TextDecorationStyle decorationStyle;
  double decorationThickness;
  String debugLabel;
//bool EditModeOn;
}

class UiBuilderText extends StatefulWidget {
  UiBuilderTextConf textWidgetProps;
  UiBuilderText(this.textWidgetProps);

  @override
  UiBuilderTextState createState() => UiBuilderTextState();
}

class UiBuilderTextState extends State<UiBuilderText> {
  double fontSizeVal = 1;
  bool fontUnderline = true;
  bool fontBold = true;
  bool fontItalic = true;

  final myController = TextEditingController();
//  widget.textWidgetProps.callback = _callback;

  void _callback() {
    setState(() {
      //  widget.textWidgetProps.callback(widget.textWidgetProps);
    });
  }

  void _setBackgroundColor(Color color) {
    setState(() {
      widget.textWidgetProps.backgroundColor = color;
    });
  }

  void _setUnderline(TextDecoration textDecoration) {
    setState(() {
      widget.textWidgetProps.decoration = textDecoration;
    });
  }

  void _setColor(Color color) {
    setState(() {
      widget.textWidgetProps.color = color;
    });
  }

  void _setFontStyle(FontStyle fontStyle) {
    setState(() {
      widget.textWidgetProps.fontStyle = fontStyle;
    });
  }

  void _setAlignment(TextAlign alignment) {
    setState(() {
      widget.textWidgetProps.textAlign = alignment;
    });
  }

  void _setFontWeight(FontWeight fontWeight) {
    setState(() {
      widget.textWidgetProps.fontWeight = fontWeight;
    });
  }

  void _setFontSize(double _size) {
    setState(() {
      fontSizeVal = _size;
      widget.textWidgetProps.fontSize = fontSizeVal;
    });
  }

  void _setText(String _text) {
    setState(() {
      widget.textWidgetProps.data = _text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Text(
        /*TextField(
          autofocus: true,
          controller: myController,
          textAlign: TextAlign.center,
          decoration: new InputDecoration.collapsed(hintText: widget.textWidgetProps.data),*/
        widget.textWidgetProps.data,
        style: TextStyle(
          color: widget.textWidgetProps.color,
          backgroundColor: widget.textWidgetProps.backgroundColor,
          fontSize: widget.textWidgetProps.fontSize,
          fontWeight: widget.textWidgetProps.fontWeight,
          fontStyle: widget.textWidgetProps.fontStyle,
          letterSpacing: widget.textWidgetProps.letterSpacing,
          wordSpacing: widget.textWidgetProps.wordSpacing,
          textBaseline: widget.textWidgetProps.textBaseline,
          height: widget.textWidgetProps.height,
          locale: widget.textWidgetProps.locale,
          foreground: widget.textWidgetProps.foreground,
          background: widget.textWidgetProps.background,
          decoration: widget.textWidgetProps.decoration,
          decorationColor: widget.textWidgetProps.decorationColor,
          decorationStyle: widget.textWidgetProps.decorationStyle,
          decorationThickness: widget.textWidgetProps.decorationThickness,
          debugLabel: widget.textWidgetProps.debugLabel,
        ),
        strutStyle: widget.textWidgetProps.strutStyle,
        textAlign: widget.textWidgetProps.textAlign,
        textDirection: widget.textWidgetProps.textDirection,
        locale: widget.textWidgetProps.locale,
        softWrap: widget.textWidgetProps.softWrap,
        overflow: widget.textWidgetProps.overflow,
        textScaleFactor: widget.textWidgetProps.textScaleFactor,
        maxLines: widget.textWidgetProps.maxLines,
        semanticsLabel: widget.textWidgetProps.semanticsLabel,
        textWidthBasis: widget.textWidgetProps.textWidthBasis,
      ),
      onTap: () {
        //FocusScope.of(context).requestFocus(FocusNode());
        //_popupFlex = 2;
        //if (widget.textWidgetProps.EditModeOn)
        if (editModeOn) _settingBottomSheet(context);
      },
    );
  }

  void _settingBottomSheet(context) {
    //showModalBottomSheet(
    showBottomSheet(
        context: context,
        clipBehavior: Clip.antiAlias,
        backgroundColor: Colors.blue[100],
        builder: (BuildContext bc) {
          return new Container(
            height: (MediaQuery.of(context).size.height) * 0.4,
            //width:  MediaQuery.of(context).size.width,
            child: ListView(children: <Widget>[
              textfieldCard(),
              fontSizeCard(),
              alignmentCard(),
              fontStyleCard(),
              colorCard(),
              backGroundColorCard(),
              RaisedButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ]),
            /*floatingActionButton: FloatingActionButton(
            //onPressed: this.context.,
            tooltip: 'Close',
            child: Icon(Icons.close),
          ),*/
          );
        });
  }

  Widget textfieldCard() {
    return ExpansionTile(
      leading: new Icon(Icons.edit),
      trailing: Icon(Icons.keyboard_arrow_right),
      title: new Text('Edit Text'),
      children: <Widget>[
        Column(children: <Widget>[
          Wrap(children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Expanded(
                  child: new TextField(
                    autofocus: true,
                    controller: myController,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration.collapsed(hintText: 'Enter Text here'),
                  ),
                ),
                new Expanded(
                  child: new IconButton(
                    icon: new Icon(Icons.save),
                    color: Colors.black26,
                    onPressed: () {
                      _setText(myController.text);
                    },
                  ),
                )
              ],
            ),
          ]),
        ]),
      ],
    );
  }

  Widget fontSizeCard() {
    return new ExpansionTile(
      leading: Icon(Icons.format_size),
      trailing: Icon(Icons.keyboard_arrow_right),
      title: Text('Font Size'),
      children: <Widget>[
        new Column(
          children: <Widget>[
            new Wrap(children: <Widget>[
              new Slider(
                value: fontSizeVal,
                activeColor: Colors.green,
                inactiveColor: Colors.red,
                onChanged: (double s) {
                  _setFontSize(s);
                  setState(() {
                    fontSizeVal = s;
                  });
                  //this._value = s;
                },
                //label: "$_value",
                //divisions: 10,
                min: 1.0,
                max: 100.0,
              ),
            ]),
          ],
        ),
      ],
    );
    //);
  }

  Widget alignmentCard() {
    return ExpansionTile(
      leading: new Icon(Icons.format_align_justify),
      trailing: Icon(Icons.keyboard_arrow_right),
      title: new Text('Alignment'),
      children: <Widget>[
        Column(children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
            IconButton(
              icon: Icon(Icons.format_align_left),
              tooltip: 'Left Alignment',
              onPressed: () {
                _setAlignment(TextAlign.left);
              },
            ),
            IconButton(
              icon: Icon(Icons.format_align_center),
              tooltip: 'Center Alignment',
              onPressed: () {
                _setAlignment(TextAlign.center);
              },
            ),
            IconButton(
              icon: Icon(Icons.format_align_right),
              tooltip: 'Right Alignment',
              onPressed: () {
                _setAlignment(TextAlign.right);
              },
            ),
          ]),
        ]),
      ],
    );
  }

  Widget fontStyleCard() {
    return ExpansionTile(
      leading: new Icon(Icons.font_download),
      trailing: Icon(Icons.keyboard_arrow_right),
      title: new Text('Font Style'),
      children: <Widget>[
        Column(children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
            IconButton(
              icon: Icon(Icons.font_download),
              tooltip: 'Normal Font',
              onPressed: () {
                _setFontWeight(FontWeight.normal);
              },
            ),
            IconButton(
              icon: Icon(Icons.format_bold),
              tooltip: 'Bold Font',
              onPressed: () {
                fontBold ? _setFontWeight(FontWeight.bold) : _setFontWeight(FontWeight.normal);
                fontBold = !fontBold;
              },
            ),
            IconButton(
              icon: Icon(Icons.format_italic),
              tooltip: 'Italic Format',
              onPressed: () {
                fontItalic ? _setFontStyle(FontStyle.italic) : _setFontWeight(FontWeight.normal);
                fontItalic = !fontItalic;
              },
            ),
            IconButton(
              icon: Icon(Icons.format_underlined),
              tooltip: 'Underline Font',
              onPressed: () {
                _setUnderline(fontUnderline ? TextDecoration.underline : TextDecoration.none);
                fontUnderline = !fontUnderline;
              },
            ),
          ]),
        ]),
      ],
    );
  }

  Widget colorCard() {
    return ExpansionTile(
      leading: new Icon(Icons.color_lens),
      trailing: Icon(Icons.keyboard_arrow_right),
      title: new Text('Color'),
      children: <Widget>[
        Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.red,
                  ),
                  tooltip: 'Red Color',
                  onPressed: () {
                    _setColor(Colors.red);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.blue,
                  ),
                  tooltip: 'Blue Color',
                  onPressed: () {
                    _setColor(Colors.blue);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.green,
                  ),
                  tooltip: 'green Color',
                  onPressed: () {
                    _setColor(Colors.green);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.yellow,
                  ),
                  tooltip: 'Yellow Color',
                  onPressed: () {
                    _setColor(Colors.yellow);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.orange,
                  ),
                  tooltip: 'orange Color',
                  onPressed: () {
                    _setColor(Colors.orange);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.black,
                  ),
                  tooltip: 'black Color',
                  onPressed: () {
                    _setColor(Colors.black);
                  },
                ),
                IconButton(
                  icon: Material(
                    color: Colors.transparent,
                    shape: CircleBorder(side: BorderSide(color: Colors.black)),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                  tooltip: 'white Color',
                  onPressed: () {
                    _setColor(Colors.white);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.purple,
                  ),
                  tooltip: 'purple Color',
                  onPressed: () {
                    _setColor(Colors.purple);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.cyan,
                  ),
                  tooltip: 'cyan Color',
                  onPressed: () {
                    _setColor(Colors.cyan);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.lime,
                  ),
                  tooltip: 'lime Color',
                  onPressed: () {
                    _setColor(Colors.lime);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.brown,
                  ),
                  tooltip: 'brown Color',
                  onPressed: () {
                    _setColor(Colors.brown);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.deepOrange,
                  ),
                  tooltip: 'Deep Orange Color',
                  onPressed: () {
                    _setColor(Colors.deepOrange);
                  },
                ),
              ]),
            ),
          ],
        ),
      ],
    );
  }

  Widget backGroundColorCard() {
    return ExpansionTile(
      leading: new Icon(Icons.format_color_fill),
      trailing: Icon(Icons.keyboard_arrow_right),
      title: new Text('Background Color'),
      children: <Widget>[
        Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.red,
                  ),
                  tooltip: 'Red Color',
                  onPressed: () {
                    _setBackgroundColor(Colors.red);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.blue,
                  ),
                  tooltip: 'Blue Color',
                  onPressed: () {
                    _setBackgroundColor(Colors.blue);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.green,
                  ),
                  tooltip: 'green Color',
                  onPressed: () {
                    _setBackgroundColor(Colors.green);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.yellow,
                  ),
                  tooltip: 'Yellow Color',
                  onPressed: () {
                    _setBackgroundColor(Colors.yellow);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.orange,
                  ),
                  tooltip: 'orange Color',
                  onPressed: () {
                    _setBackgroundColor(Colors.orange);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.black,
                  ),
                  tooltip: 'black Color',
                  onPressed: () {
                    _setBackgroundColor(Colors.black);
                  },
                ),
                IconButton(
                  icon: Material(
                    color: Colors.transparent,
                    shape: CircleBorder(side: BorderSide(color: Colors.black)),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                  tooltip: 'white Color',
                  onPressed: () {
                    _setBackgroundColor(Colors.white);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.purple,
                  ),
                  tooltip: 'purple Color',
                  onPressed: () {
                    _setBackgroundColor(Colors.purple);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.cyan,
                  ),
                  tooltip: 'cyan Color',
                  onPressed: () {
                    _setBackgroundColor(Colors.cyan);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.lime,
                  ),
                  tooltip: 'lime Color',
                  onPressed: () {
                    _setBackgroundColor(Colors.lime);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.brown,
                  ),
                  tooltip: 'brown Color',
                  onPressed: () {
                    _setBackgroundColor(Colors.brown);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.lens,
                    color: Colors.deepOrange,
                  ),
                  tooltip: 'Deep Orange Color',
                  onPressed: () {
                    _setBackgroundColor(Colors.deepOrange);
                  },
                ),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}
