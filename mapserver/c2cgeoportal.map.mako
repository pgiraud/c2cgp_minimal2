#
# MapServer Mapfile
#
# Test requests:
#
# WMS GetCapabilities:
# /mapserv?service=wms&version=1.1.1&request=getcapabilities
#
# WMS GetMap:
# /mapserv?service=wms&version=1.1.1&request=getmap&bbox=-180,-90,180,90&layers=countries&width=600&height=400&srs=EPSG:4326&format=image/png
#
# WMS GetFeatureInfo:
# /mapserv?service=wms&version=1.1.1&request=getfeatureinfo&bbox=-180,-90,180,90&layers=countries&query_layers=countries&width=600&height=400&srs=EPSG:4326&format=image/png&x=180&y=90&info_format=application/vnd.ogc.gml
#

MAP
    NAME "geoportal"

    EXTENT -466375.77628413 5379611.8001185 1035458.955194 6573252.433606
    UNITS METERS

    # RESOLUTION and DEFRESOLUTION default to 72. If you
    # change RESOLUTION to some other value, also change
    # DEFRESOLUTION. See
    # http://mapserver.org/development/rfc/ms-rfc-55.html
    RESOLUTION 96 ## Also set in Openlayers especially for legends
    DEFRESOLUTION 96

    # MAXSIZE shouldn't be less than 5000 for MF print on A3
    MAXSIZE 5000

    SHAPEPATH '/var/sig/c2cgeoportal'

    IMAGECOLOR 255 255 255
    STATUS ON

    FONTSET "fonts.conf"
    #SYMBOLSET "symbole.sym"

    OUTPUTFORMAT
        NAME jpeg
        DRIVER "AGG/JPEG"
        MIMETYPE "image/jpeg"
        IMAGEMODE RGB
        EXTENSION "jpeg"
        FORMATOPTION "QUALITY=75,PROGRESSIVE=TRUE"
    END

    OUTPUTFORMAT
        NAME png
        DRIVER AGG/PNG
        MIMETYPE "image/png"
        IMAGEMODE RGBA
        EXTENSION "png"
        FORMATOPTION "INTERLACE=OFF"
        FORMATOPTION "QUANTIZE_DITHER=OFF"
        FORMATOPTION "QUANTIZE_FORCE=ON"
        FORMATOPTION "QUANTIZE_COLORS=256"
    END

    PROJECTION
        "init=epsg:3857"
    END

    WEB
        METADATA
            "wms_title" "changeme"
            "wms_abstract" "changeme"
            "wms_onlineresource" "http://${host}/${instanceid}/wsgi/mapserv_proxy"
            "wms_srs" "epsg:2857"
            "wms_encoding" "UTF-8"
            "wms_enable_request" "*"
            "wfs_enable_request" "!*"
            "wfs_encoding" "UTF-8"
        END
    END

    LEGEND
        LABEL
            ENCODING "UTF-8"
            TYPE TRUETYPE
            FONT "Arial"
            SIZE 9
        END
    END

    # restricted access layer
    LAYER
        NAME 'layer_name'
        TYPE POLYGON
        TEMPLATE fooOnlyForWMSGetFeatureInfo # For GetFeatureInfo
        EXTENT 620000 218000 690000 278000
        CONNECTIONTYPE postgis
        PROCESSING "CLOSE_CONNECTION=DEFER" # For performance
        CONNECTION "${mapserver_connection}"
        # Example data for secured layer by restriction area
        DATA "geometrie FROM (SELECT geo.* FROM geodata.table AS geo WHERE ST_Contains((${mapfile_data_subselect} 'layer_name'), ST_SetSRID(geo.geometrie, 21781))) as foo using unique id using srid=21781"
        # Example data for secured layer by role (without any area)
        #DATA "geometrie FROM (SELECT geo.geom as geom FROM geodata.table AS geo WHERE %role_id% IN (${mapfile_data_noarea_subselect} 'layer_name')) as foo USING UNIQUE gid USING srid=21781"
        # Example data for public layer
        #DATA "geometrie FROM (SELECT geo.geom as geom FROM geodata.table AS geo) AS foo USING UNIQUE gid USING srid=21781"
        METADATA
            "wms_title" "layer_name" # For WMS
            "wms_srs" "epsg:3857" # For WMS

            "wfs_enable_request" "*" # Enable WFS for this layer
            "gml_include_items" "all" # For GetFeatureInfo and WFS GetFeature (QuerryBuilder)
            "ows_geom_type" "polygon" # For returning geometries in GetFeatureInfo
            "ows_geometries" "geom" # For returning geometries in GetFeatureInfo

            "wms_metadataurl_href" "http://www.example.com/bar" # For metadata URL
            "wms_metadataurl_format" "text/html" # For metadata URL
            "wms_metadataurl_type" "TC211" # For metadata URL

            ${mapserver_layer_metadata} # For secured layers
        END
        DUMP TRUE # For GetFeatureInfo
        STATUS ON
        PROJECTION
          "init=epsg:21781"
        END
        CLASS
            NAME "countries"
            OUTLINECOLOR 0 0 0
        END
    END

    # raster layer (with a tile index)
    LAYER
        NAME 'topo'
        GROUP 'plan'
        TYPE RASTER
        STATUS ON
        PROCESSING "RESAMPLE=AVERAGE"
        TILEINDEX "raster/topo"
        TILEITEM "LOCATION"
        MINSCALEDENOM 25000
    END

    LAYER
        NAME "Com_Boundary"
        TYPE LINE
        TEMPLATE fooOnlyForWMSGetFeatureInfo # For GetFeatureInfo
        EXTENT 600000.000000 194000.000000 604000.000000 198000.000000
        CONNECTIONTYPE postgis
        PROCESSING "CLOSE_CONNECTION=DEFER" # For performance
        CONNECTION "${mapserver_connection}"
        # Example data for secured layer by restriction area
        DATA "the_geom FROM (select * from app.vec200_com_boundary) as foo using unique gid using srid=21781"
        # Example data for secured layer by role (without any area)
        #DATA "geometrie FROM (SELECT geo.geom as geom FROM geodata.table AS geo WHERE %role_id% IN (${mapfile_data_noarea_subselect} 'layer_name')) as foo USING UNIQUE gid USING srid=21781"
        # Example data for public layer
        #DATA "geometrie FROM (SELECT geo.geom as geom FROM geodata.table AS geo) AS foo USING UNIQUE gid USING srid=21781"
        METADATA
            "wms_title" "Com_Boundary" # For WMS
            "wms_srs" "epsg:3857" # For WMS

            "gml_include_items" "all"
            "gml_types" "auto"
            "gml_featureid" "gid"
            "wfs_enable_request" "*"

            "gml_geometries" "the_geom"
            "gml_the_geom_type" "polygon"

            "wms_metadataurl_href" "http://www.example.com/bar" # For metadata URL
            "wms_metadataurl_format" "text/html" # For metadata URL
            "wms_metadataurl_type" "TC211" # For metadata URL
        END
        DUMP TRUE # For GetFeatureInfo
        STATUS ON
        PROJECTION
          "init=epsg:21781"
        END
        CLASS
            NAME "com_boundary"
            STYLE
                COLOR 255 0 0
                WIDTH 3
            END
        END
    END

    LAYER
        NAME "buildings"
        TYPE POLYGON
        TEMPLATE fooOnlyForWMSGetFeatureInfo # For GetFeatureInfo
        EXTENT 600000.000000 194000.000000 604000.000000 198000.000000
        CONNECTIONTYPE postgis
        PROCESSING "CLOSE_CONNECTION=DEFER" # For performance
        CONNECTION "${mapserver_connection}"
        # Example data for secured layer by restriction area
        DATA "the_geom FROM (select * from app.buildings) as foo using unique gid using srid=21781"
        # Example data for secured layer by role (without any area)
        #DATA "geometrie FROM (SELECT geo.geom as geom FROM geodata.table AS geo WHERE %role_id% IN (${mapfile_data_noarea_subselect} 'layer_name')) as foo USING UNIQUE gid USING srid=21781"
        # Example data for public layer
        #DATA "geometrie FROM (SELECT geo.geom as geom FROM geodata.table AS geo) AS foo USING UNIQUE gid USING srid=21781"
        METADATA
            "wms_title" "buildings" # For WMS
            "wms_srs" "epsg:3857" # For WMS

            "gml_include_items" "all"
            "gml_types" "auto"
            "gml_featureid" "gid"
            "wfs_enable_request" "*"

            "gml_geometries" "the_geom"
            "gml_the_geom_type" "polygon"

            "wms_metadataurl_href" "http://www.example.com/bar" # For metadata URL
            "wms_metadataurl_format" "text/html" # For metadata URL
            "wms_metadataurl_type" "TC211" # For metadata URL
        END
        DUMP TRUE # For GetFeatureInfo
        STATUS ON
        PROJECTION
          "init=epsg:21781"
        END
        LABELITEM "objectid"
        CLASS
            NAME "buildings null"
            EXPRESSION ('[objorig_ye]' eq '')
            STYLE
                COLOR 255 0 0
                OUTLINECOLOR 0 0 0
            END
            LABEL
                COLOR  150 150 150
                OUTLINECOLOR 255 255 255
                FONT "arial"
                TYPE truetype
                SIZE 6
                POSITION AUTO
                PARTIALS FALSE
            END
        END
        CLASS
            NAME "buildings < 1990"
            EXPRESSION ([objorig_ye] < 1990)
            STYLE
                COLOR 0 120 120
                OUTLINECOLOR 0 0 0
            END
            LABEL
                COLOR  150 150 150
                OUTLINECOLOR 255 255 255
                FONT "arial"
                TYPE truetype
                SIZE 6
                POSITION AUTO
                PARTIALS FALSE
            END
        END
        CLASS
            NAME "buildings < 2000"
            EXPRESSION ([objorig_ye] < 2000)
            STYLE
                COLOR 120 0 120
                OUTLINECOLOR 0 0 0
            END
            LABEL
                COLOR  150 150 150
                OUTLINECOLOR 255 255 255
                FONT "arial"
                TYPE truetype
                SIZE 6
                POSITION AUTO
                PARTIALS FALSE
            END
        END
        CLASS
            NAME "buildings < 2010"
            EXPRESSION ([objorig_ye] < 2010)
            STYLE
                COLOR 0 0 120
                OUTLINECOLOR 0 0 0
            END
            LABEL
                COLOR  150 150 150
                OUTLINECOLOR 255 255 255
                FONT "arial"
                TYPE truetype
                SIZE 6
                POSITION AUTO
                PARTIALS FALSE
            END
        END
        CLASS
            NAME "buildings"
            STYLE
                COLOR 0 120 0
                OUTLINECOLOR 0 0 0
            END
            LABEL
                COLOR  150 150 150
                OUTLINECOLOR 255 255 255
                FONT "arial"
                TYPE truetype
                SIZE 6
                POSITION AUTO
                PARTIALS FALSE
            END
        END
    END
END
