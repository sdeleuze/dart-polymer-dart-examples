import 'package:polymer/polymer.dart';

@CustomTag('my-element')
class MyElement extends PolymerElement with ObservableMixin {
  @observable bool isCreated = false;
  @observable bool isEntered = false;
  @observable bool isLeft = false;
  @observable bool isAttributeChanged = false;
  
  @observable String timestamp;

  // The following two callbacks should be stable.
  
  void created() {
    // ALWAYS call super's lifecycle method
    super.created();

    isCreated = true;
  }
  
  // BUG: this does not work: https://code.google.com/p/dart/issues/detail?id=12719
  
  void attributeChanged(String attrName, String oldVal, String newVal) {
    super.attributeChanged(attrName, oldVal, newVal);

    isAttributeChanged = true;
  }
  
  // BUG: Use these when https://code.google.com/p/dart/issues/detail?id=12716
  // is fixed.

//  void enteredDocument() {
//    super.enteredDocument();
//
//    isEntered = true;
//  }
//
//  void leftDocument() {
//    super.leftDocument();
//
//    isLeft = false;
//  }

  // The following two callbacks are historical, they will go away.
  // BUG tracked at: https://code.google.com/p/dart/issues/detail?id=12716
  
  void inserted() {
    super.inserted(); // I don't think we really need this.
    
    isEntered = true;
  }
  
  void removed() {
    super.removed(); // I don't think we really need this.
    
    isLeft = true;
  }

}