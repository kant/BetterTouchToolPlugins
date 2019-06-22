import Foundation
import AppKit
@objc class SamplePluginCustomString : NSObject, BTTTouchBarPluginInterface
{
    // the delegate will be set automatically after this plugin is loaded in BTT
    var delegate : BTTTouchBarPluginDelegate?
    
    
    var configurationValues: Dictionary<AnyHashable, Any> = [:];
    
    
    /* MARK: Option 3: Returning a NSViewController instance
     * if you return a view controller BTT will display the view
     * controller's view on
     * the Touch Bar.
     * You are responsible for any styling you want to apply.
     * Make sure to always return the same instance of the button
     * here.
     */
    func touchBarTitleString() -> String? {
        return "Hello Custom String!";
    }
    
    // here you can configure what items are shown in the BTT configuration side-bar for this plugin
    class func configurationFormItems() -> BTTPluginFormItem? {
        
        // here we just create a text field, we will receive the
        // current value in didReceiveNewConfigurationValues
        let item = BTTPluginFormItem.init();
        item.formFieldType = BTTFormTypeTextField;
        item.formLabel1 = "Custom Widget Name";
        item.formFieldID = "widgetName";
        
        return item;
    }
    
    func didReceiveNewConfigurationValues(_ configurationValues: [AnyHashable : Any]) {
        self.configurationValues = configurationValues;
    }
    
    // this will tell BTT to execute the actions the user assigned to this widget
    @objc func executeAssignedBTTActions() {
        self.delegate?.executeAssignedBTTActions(self);
    }
    
}

