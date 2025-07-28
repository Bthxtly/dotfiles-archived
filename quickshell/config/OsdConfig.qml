import Quickshell.Io

JsonObject {
    property int hideDelay: 2000
    property Sizes sizes: Sizes {}
    // property list<string> brightnessIcon: [ "", "", "", "", "", "", "", "", "" ]

    component Sizes: JsonObject {
        property int sliderWidth: 30
        property int sliderHeight: 150
    }
}
