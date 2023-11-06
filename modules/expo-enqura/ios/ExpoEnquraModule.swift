import ExpoModulesCore
// import Toaster

public class ExpoEnquraModule: Module {
  //let testObject = CustomMethods()
  var enVerifyManager = EnverifyManager.shared
  // Each module class must implement the definition function. The definition consists of components
  // that describes the module's functionality and behavior.
  // See https://docs.expo.dev/modules/module-api for more details about available components.
  public func definition() -> ModuleDefinition {
    // Sets the name of the module that JavaScript code will use to refer to the module. Takes a string as an argument.
    // Can be inferred from module's class name, but it's recommended to set it explicitly for clarity.
    // The module will be accessible from `requireNativeModule('ExpoEnqura')` in JavaScript.
    Name("ExpoEnqura")

    // Sets constant properties on the module. Can take a dictionary or a closure that returns a dictionary.
    Constants([
      "PI": Double.pi
    ])

    // Defines event names that the module can send to JavaScript.
    Events("onChange")

    // Defines a JavaScript synchronous function that runs the native code on the JavaScript thread.
    Function("hello") {
      //EnVerify.idFrontStart()
      
      return "Hello world! 👋"
      
    }

    // Defines a JavaScript function that always returns a Promise and whose native code
    // is by default dispatched on the different thread than the JavaScript runtime runs on.
    AsyncFunction("setValueAsync") { (value: String) in
      // Send an event to JavaScript.
      //Toast(text: "Hello from native toast ! ! !").show()
      enVerifyManager.initialize()
      //enVerifyManager.idRetry()
      //enVerifyManager.nfcVerify()
      self.sendEvent("onChange", [
        "value": value
      ])
    }

    AsyncFunction("startVerification") { (value: String) in
      // Send an event to JavaScript.
      //Toast(text: "Hello from native toast ! ! !").show()
      enVerifyManager.startVerification()
      //enVerifyManager.idRetry()
      //enVerifyManager.nfcVerify()
      self.sendEvent("onChange", [
        "value": value
      ])
    }

    // Enables the module to be used as a native view. Definition components that are accepted as part of the
    // view definition: Prop, Events.
    View(ExpoEnquraView.self) {
      // Defines a setter for the `name` prop.
      Prop("name") { (view: ExpoEnquraView, prop: String) in
        print(prop)
      }
    }
  }
}
