import Quickshell.Io

JsonObject {
    property int maxShown: 8
    property int maxWallpapers: 9 // Warning: even numbers look bad
    property string actionPrefix: " "
    property int dragThreshold: 50
    property UseFuzzy useFuzzy: UseFuzzy {}
    property Sizes sizes: Sizes {}

    component UseFuzzy: JsonObject {
        property bool apps: true
        property bool actions: true
        property bool wallpapers: true
    }

    component Sizes: JsonObject {
        property int itemWidth: 600
        property int itemHeight: 57
        property int wallpaperWidth: 280
        property int wallpaperHeight: 200
    }
}
