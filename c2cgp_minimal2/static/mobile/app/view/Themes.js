/**
 * Copyright (c) 2011-2014 by Camptocamp SA
 *
 * CGXP is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * CGXP is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with CGXP. If not, see <http://www.gnu.org/licenses/>.
 */

Ext.define("App.view.Themes", {
    extend: 'Ext.List',
    xtype: 'themesview',

    config: {
        items: [
            {
                docked: 'top',
                xtype: 'toolbar',
                title: OpenLayers.i18n('theme_view.title'),
                items: [{
                    ui: 'back',
                    text: OpenLayers.i18n('back'),
                    listeners: {
                        tap: function() {
                            history.back();
                        }
                    }
                }]
            }
        ],
        itemTpl: new Ext.XTemplate(
            '<div class="theme">',
                '<img src="{icon}" />',
                '<div class="info"><b>{[OpenLayers.i18n(values.name)]}</b></div>',
            '</div>'
        ),
        store: 'themesStore',
        disableSelection: true
    }
});
