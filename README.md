# pin-pad
simple, generic and opinionated numpad meant for stylish pin inputs.


<img src="https://i.imgur.com/Uagsngc.gif" alt="video-example" width="200" />


## Importing
in pubspec.yaml:
```yaml
dependencies:
  pinpad:
    git: https://github.com/80-20-labs/pin-pad
```


in .dart file:
```dart
import 'package: pinpad/numpad.dart';
import 'package: pinpad/numpad_controller.dart';
```

# Usage

## style parameters
you can customize the look by passing the following parameters to NumPad():

| Parameters        | Description                                                                                     |
| ----------------- | ----------------------------------------------------------------------------------------------- |
|backgroundColor    | self explanatory.                                                                               |
|keyColor           | color of each individual regular key (doesn't include backspace or clear).                      |
|clearKeyBackgroundColor      | background color for the clear button.                                                                     |
|clearKeyFontColor | font color for clear key. |
|backKeyBackgroundColor       | background color for the backspace button.|
|backKeyFontColor | font color for the backspace key. |
|numPadFontColor | font color of the number keys.                                                 |
|pinInputFieldColor | font color for the input field.                                                                 |
|pinInputLength     | limit input length, defaults to 5.                                                              |
|pinPlaceholder | customize placeholder text for the input field, defaults to "PIN" |
|pinPlaceholderColor | font color for the placeholder text |

## controller
with the NumPadController object, you can add custom behaviors for what to do once you want to process the pin input. 

| Type | Name | Description |
| --- | --- | --- |
| function | wrongInputBehavior() | Shakes pin input, also clears input field |
| string | code | returns String for the content of the pin input code |
| bool | doneTyping | returns true once the pin input field text has reached the pinInputLength set |


## example code.
full code implementation can be found at [example/lib/main.dart](https://github.com/80-20-labs/pin-pad/tree/master/example/lib).
```dart
NumPadController npc = NumpadController();
npc.addListener((){
  String realCode = "111";
  if (npc.doneTyping) {
    print("do any behavior you want here");
    if (realCode != npc.code) {
      // shakes the input field and clears text.
      npc.wrongInputBehavior();
    }
  }
});

...

return NumPad(
  controller: npc
  pinInputLength: 4,
);

```

