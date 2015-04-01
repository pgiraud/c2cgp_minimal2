#
# This is the config file for jsbuild utility
# Documentation on the syntax of this file is available at:
# http://pypi.python.org/pypi/JSTools#configuration-format
#

#
# Notes:
#
# Language files are in the lang-*.js builds. Except for one file:
# OpenLayers/Lang.js. This is tricky. This one is included in the main build,
# e.g. app.js. The thing is that OpenLayers/Lang.js requires
# OpenLayers/SingleFile.js, which resets the OpenLayers (root) object.  And we
# can obviously not reset the OpenLayers object when evaluating lang-*.js.
#
# Warning: when adding a comment whose leading "#" is not on the first
# column in the file do not add a space between the "#" character and
# the actual comment. For example, use "#GXP", not "# GXP". Really,
# this should be fixed in jsbuild.
#

<%
root = [
    "c2cgp_minimal2/static/lib/cgxp/core/src/script",
    "c2cgp_minimal2/static/lib/cgxp/ext",
    "c2cgp_minimal2/static/lib/cgxp/geoext/lib",
    "c2cgp_minimal2/static/lib/cgxp/openlayers/lib",
    "c2cgp_minimal2/static/lib/cgxp/openlayers.addins/GoogleEarthView/lib",
    "c2cgp_minimal2/static/lib/cgxp/openlayers.addins/Spherical/lib",
    "c2cgp_minimal2/static/lib/cgxp/openlayers.addins/URLCompressed/lib",
    "c2cgp_minimal2/static/lib/cgxp/openlayers.addins/DynamicMeasure/lib",
    "c2cgp_minimal2/static/lib/cgxp/openlayers.addins/AddViaPoint/lib",
    "c2cgp_minimal2/static/lib/cgxp/openlayers.addins/AutoProjection/lib",
    "c2cgp_minimal2/static/lib/cgxp/gxp/src/script",
    "c2cgp_minimal2/static/lib/cgxp/proj4js",
    "c2cgp_minimal2/static/lib/cgxp/geoext.ux/ux/Measure/lib",
    "c2cgp_minimal2/static/lib/cgxp/geoext.ux/ux/SimplePrint/lib",
    "c2cgp_minimal2/static/lib/cgxp/geoext.ux/ux/FeatureEditing/lib",
    "c2cgp_minimal2/static/lib/cgxp/geoext.ux/ux/FeatureSelectionModel/lib",
    "c2cgp_minimal2/static/lib/cgxp/geoext.ux/ux/WMSBrowser/lib",
    "c2cgp_minimal2/static/lib/cgxp/geoext.ux/ux/StreetViewPanel",
    "c2cgp_minimal2/static/lib/cgxp/sandbox",
    "c2cgp_minimal2/static/lib/cgxp/styler/lib",
    "c2cgp_minimal2/static/lib/cgxp/ext.ux/TwinTriggerComboBox",
    "c2cgp_minimal2/static/lib/cgxp/ext.ux/GroupComboBox",
    "c2cgp_minimal2/static/lib/cgxp/ext.ux/ColorPicker",
    "c2cgp_minimal2/static/lib/cgxp/ext.ux/base64",
    "c2cgp_minimal2/static/lib/cgxp/ext.overrides",
    "c2cgp_minimal2/static/lib/cgxp/dygraphs",
    "c2cgp_minimal2/static/js",
]
%>

[app.js]
root =
    ${"\n    ".join(root)}
first =
    Ext/adapter/ext/ext-base-debug.js
    Ext/ext-all-debug.js
    OpenLayers/SingleFile.js
    OpenLayers/Console.js
    OpenLayers/BaseTypes.js
    OpenLayers/BaseTypes/Class.js
    OpenLayers/BaseTypes/Pixel.js
    OpenLayers/BaseTypes/Bounds.js
    OpenLayers/BaseTypes/LonLat.js
    OpenLayers/BaseTypes/Element.js
    OpenLayers/BaseTypes/Size.js
    OpenLayers/Util.js
    OpenLayers/Lang.js
    proj4js/lib/proj4js.js
    proj4js/lib/projCode/merc.js
exclude =
    GeoExt.js
    GeoExt/SingleFile.js
include =
    EPSG3857.js #proj4js
    util.js #GXP
    widgets/Viewer.js #GXP
    CGXP/cgxp.js
    CGXP/plugins/ThemeSelector.js
    CGXP/plugins/ThemeFinder.js
    CGXP/plugins/LayerTree.js
    CGXP/plugins/FeaturesWindow.js
    CGXP/plugins/Zoom.js
    CGXP/plugins/GetFeature.js
    CGXP/plugins/MapOpacitySlider.js
    CGXP/plugins/MenuShortcut.js
    CGXP/plugins/Print.js
    CGXP/plugins/Legend.js
    CGXP/plugins/Help.js
    CGXP/plugins/QueryBuilder.js
    CGXP/plugins/Login.js
    CGXP/plugins/Measure.js
    CGXP/plugins/FullTextSearch.js
    CGXP/plugins/Permalink.js
    CGXP/plugins/Disclaimer.js
    CGXP/plugins/ContextualData.js
    CGXP/widgets/MapPanel.js
    CGXP/plugins/Redlining.js
    CGXP/tools/tools.js
    OpenLayers/Control/Navigation.js
    OpenLayers/Control/PinchZoom.js
    OpenLayers/Control/KeyboardDefaults.js
    OpenLayers/Control/PanZoomBar.js
    OpenLayers/Control/ArgParser.js
    OpenLayers/Control/Attribution.js
    OpenLayers/Control/ScaleLine.js
    OpenLayers/Control/MousePosition.js
    OpenLayers/Control/OverviewMap.js
    OpenLayers/Control/NavigationHistory.js
    OpenLayers/Layer/WMTS.js
    OpenLayers/Layer/WMS.js
    OpenLayers/Layer/OSM.js
    OpenLayers/Layer/Vector.js
    OpenLayers/Renderer/SVG.js
    OpenLayers/Renderer/VML.js
    plugins/OLSource.js #GXP
    plugins/ZoomToExtent.js #GXP
    plugins/NavigationHistory.js #GXP

[edit.js]
root =
    ${"\n    ".join(root)}
first =
    Ext/adapter/ext/ext-base-debug.js
    Ext/ext-all-debug.js
    OpenLayers/SingleFile.js
    OpenLayers/Console.js
    OpenLayers/BaseTypes.js
    OpenLayers/BaseTypes/Class.js
    OpenLayers/BaseTypes/Pixel.js
    OpenLayers/BaseTypes/Bounds.js
    OpenLayers/BaseTypes/LonLat.js
    OpenLayers/BaseTypes/Element.js
    OpenLayers/BaseTypes/Size.js
    OpenLayers/Util.js
    OpenLayers/Lang.js
    proj4js/lib/proj4js.js
    proj4js/lib/projCode/merc.js
exclude =
    GeoExt.js
    GeoExt/SingleFile.js
include =
    EPSG3857.js #proj4js
    util.js #GXP
    widgets/Viewer.js #GXP
    CGXP/cgxp.js
    CGXP/plugins/Editing.js
    CGXP/plugins/Login.js
    CGXP/plugins/ThemeSelector.js
    CGXP/plugins/ThemeFinder.js
    CGXP/plugins/LayerTree.js
    CGXP/plugins/MenuShortcut.js
    CGXP/plugins/MapOpacitySlider.js
    CGXP/plugins/Permalink.js
    CGXP/widgets/MapPanel.js
    CGXP/tools/tools.js
    OpenLayers/Control/Navigation.js
    OpenLayers/Control/KeyboardDefaults.js
    OpenLayers/Control/PanZoomBar.js
    OpenLayers/Control/ArgParser.js
    OpenLayers/Control/Attribution.js
    OpenLayers/Control/ScaleLine.js
    OpenLayers/Control/MousePosition.js
    OpenLayers/Control/OverviewMap.js
    OpenLayers/Control/NavigationHistory.js
    OpenLayers/Layer/Vector.js
    OpenLayers/Renderer/SVG.js
    OpenLayers/Renderer/VML.js
    plugins/OLSource.js #GXP

[routing.js]
root =
    ${"\n    ".join(root)}
first =
    Ext/adapter/ext/ext-base-debug.js
    Ext/ext-all-debug.js
    OpenLayers/SingleFile.js
    OpenLayers/Console.js
    OpenLayers/BaseTypes.js
    OpenLayers/BaseTypes/Class.js
    OpenLayers/BaseTypes/Pixel.js
    OpenLayers/BaseTypes/Bounds.js
    OpenLayers/BaseTypes/LonLat.js
    OpenLayers/BaseTypes/Element.js
    OpenLayers/BaseTypes/Size.js
    OpenLayers/Util.js
    OpenLayers/Lang.js
    proj4js/lib/proj4js.js
    proj4js/lib/projCode/merc.js
exclude =
    GeoExt.js
    GeoExt/SingleFile.js
include =
    EPSG3857.js #proj4js
    util.js #GXP
    widgets/Viewer.js #GXP
    plugins/OLSource.js #GXP
    CGXP/cgxp.js
    CGXP/plugins/MapOpacitySlider.js
    CGXP/plugins/Routing.js
    CGXP/data/OSRM.js
    CGXP/widgets/MapPanel.js
    CGXP/tools/tools.js
    OpenLayers/Control/Navigation.js
    OpenLayers/Control/KeyboardDefaults.js
    OpenLayers/Control/PanZoomBar.js
    OpenLayers/Control/ArgParser.js
    OpenLayers/Control/Attribution.js
    OpenLayers/Control/ScaleLine.js
    OpenLayers/Control/MousePosition.js
    OpenLayers/Control/OverviewMap.js
    OpenLayers/Control/NavigationHistory.js
    OpenLayers/Layer/WMTS.js
    OpenLayers/Renderer/SVG.js
    OpenLayers/Renderer/VML.js

[lang-en.js]
root =
    ${"\n    ".join(root)}
first =
    OpenLayers/Lang/en.js
last =
    Proj/Lang/en.js
include =
    Ext/src/locale/ext-lang-en.js
    Styler/lang/en.js
    locale/en.js #GXP
exclude =
    OpenLayers/Lang.js

[lang-fr.js]
root =
    ${"\n    ".join(root)}
first =
    OpenLayers/Lang/fr.js
last =
    Proj/Lang/fr.js
    Proj/Lang/GeoExt-fr.js
include =
    Ext/src/locale/ext-lang-fr.js
    GeoExt/locale/GeoExt-fr.js
    FeatureEditing/resources/lang/fr.js
    Styler/lang/fr.js
    GeoExt.ux/locale/WMSBrowser-fr.js
    ux/locale/StreetViewPanel-fr.js
    locale/fr.js #GXP
    CGXP/locale/fr.js
exclude =
    OpenLayers/Lang.js

[lang-de.js]
root =
    ${"\n    ".join(root)}
first =
    OpenLayers/Lang/de.js
last =
    Proj/Lang/de.js
    Proj/Lang/GeoExt-de.js
include =
    Ext/src/locale/ext-lang-de.js
#    GeoExt/locale/GeoExt-de.js
    FeatureEditing/resources/lang/de.js
    Styler/lang/de.js
    GeoExt.ux/locale/WMSBrowser-de.js
    ux/locale/StreetViewPanel-de.js
    locale/de.js #GXP
    CGXP/locale/de.js
exclude =
    OpenLayers/Lang.js

[api.js]
root =
    ${"\n    ".join(root)}
first =
    OpenLayers/SingleFile.js
    OpenLayers/Console.js
    OpenLayers/BaseTypes.js
    OpenLayers/BaseTypes/Class.js
    OpenLayers/BaseTypes/Pixel.js
    OpenLayers/BaseTypes/Bounds.js
    OpenLayers/BaseTypes/LonLat.js
    OpenLayers/BaseTypes/Element.js
    OpenLayers/BaseTypes/Size.js
    OpenLayers/Util.js
    OpenLayers/Lang.js
    proj4js/lib/proj4js.js
    proj4js/lib/projCode/merc.js
include =
    EPSG3857.js #proj4js
    OpenLayers/Control/Navigation.js
    OpenLayers/Control/PanZoomBar.js
    OpenLayers/Control/ArgParser.js
    OpenLayers/Control/Attribution.js
    OpenLayers/Control/ScaleLine.js
    OpenLayers/Control/MousePosition.js
    OpenLayers/Control/OverviewMap.js
    OpenLayers/Control/LayerSwitcher.js
    OpenLayers/Layer/WMTS.js
    OpenLayers/Layer/TMS.js
    OpenLayers/Layer/OSM.js
    CGXP/api/Map.js

[api-lang-en.js]
root =
    ${"\n    ".join(root)}
first =
    OpenLayers/Lang/en.js
include =
    Proj/Lang/en.js
exclude =
    OpenLayers/Lang.js

[api-lang-fr.js]
root =
    ${"\n    ".join(root)}
first =
    OpenLayers/Lang/fr.js
include =
    Proj/Lang/fr.js
exclude =
    OpenLayers/Lang.js

[api-lang-de.js]
root =
    ${"\n    ".join(root)}
first =
    OpenLayers/Lang/de.js
include =
    Proj/Lang/de.js
exclude =
    OpenLayers/Lang.js

[xapi.js]
root =
    ${"\n    ".join(root)}
first =
    Ext/adapter/ext/ext-base-debug.js
    Ext/ext-all-debug.js
    GeoExt/Lang.js
    OpenLayers/SingleFile.js
    OpenLayers/Console.js
    OpenLayers/BaseTypes.js
    OpenLayers/BaseTypes/Class.js
    OpenLayers/BaseTypes/Pixel.js
    OpenLayers/BaseTypes/Bounds.js
    OpenLayers/BaseTypes/LonLat.js
    OpenLayers/BaseTypes/Element.js
    OpenLayers/BaseTypes/Size.js
    OpenLayers/Util.js
    OpenLayers/Lang.js
    proj4js/lib/proj4js.js
    proj4js/lib/projCode/merc.js
include =
    EPSG3857.js #proj4js
    util.js #GXP
    widgets/Viewer.js #GXP
    CGXP/cgxp.js
    CGXP/api/Map.js
    CGXP/plugins/Zoom.js
    CGXP/plugins/Redlining.js
    CGXP/plugins/MapOpacitySlider.js
    CGXP/plugins/MenuShortcut.js
    CGXP/plugins/Legend.js
    CGXP/plugins/Help.js
    CGXP/plugins/Measure.js
    CGXP/plugins/FullTextSearch.js
    CGXP/plugins/Disclaimer.js
    CGXP/widgets/MapPanel.js
    OpenLayers/Control/Navigation.js
    OpenLayers/Control/PanZoomBar.js
    OpenLayers/Control/ArgParser.js
    OpenLayers/Control/Attribution.js
    OpenLayers/Control/ScaleLine.js
    OpenLayers/Control/MousePosition.js
    OpenLayers/Control/NavigationHistory.js
    OpenLayers/Control/OverviewMap.js
    OpenLayers/Control/LayerSwitcher.js
    OpenLayers/Layer/WMTS.js
    OpenLayers/Layer/TMS.js
    OpenLayers/Layer/OSM.js
    plugins/OLSource.js #GXP
    plugins/ZoomToExtent.js #GXP
    plugins/NavigationHistory.js #GXP
exclude =
    GeoExt.js
    GeoExt/SingleFile.js
