import St from 'gi://St';
import GLib from 'gi://GLib';
import Gio from 'gi://Gio';
import Clutter from 'gi://Clutter';
import GObject from 'gi://GObject';

import {Extension} from 'resource:///org/gnome/shell/extensions/extension.js';
import * as Main from 'resource:///org/gnome/shell/ui/main.js';
import * as PanelMenu from 'resource:///org/gnome/shell/ui/panelMenu.js';
import * as PopupMenu from 'resource:///org/gnome/shell/ui/popupMenu.js';

const IPIndicator = GObject.registerClass(
class IPIndicator extends PanelMenu.Button {
    _init() {
        super._init(0.0, 'Custom IP');

        this._label = new St.Label({
            text: 'IP',
            y_align: Clutter.ActorAlign.CENTER,
        });

        this.add_child(this._label);

        this._publicIP = 'Loading...';
        this._localIP = 'Loading...';
        this._interface = 'Loading...';

        this._refresh();

        this._timer = GLib.timeout_add_seconds(
            GLib.PRIORITY_DEFAULT,
            60,
            () => {
                this._refresh();
                return GLib.SOURCE_CONTINUE;
            }
        );
    }

    async _command(command) {
        try {
            const process = Gio.Subprocess.new(
                ['bash', '-c', command],
                Gio.SubprocessFlags.STDOUT_PIPE |
                Gio.SubprocessFlags.STDERR_PIPE
            );

            const result = await new Promise((resolve, reject) => {
                process.communicate_utf8_async(null, null, (proc, res) => {
                    try {
                        resolve(proc.communicate_utf8_finish(res));
                    } catch (e) {
                        reject(e);
                    }
                });
            });

            return result[1].trim();
        } catch (e) {
            return '';
        }
    }

    async _refresh() {
        const publicIP = await this._command(
            'curl -4 -fsS --max-time 5 https://api.ipify.org'
        );

        const localData = await this._command(
            "ip -4 route get 1.1.1.1 | awk '{for(i=1;i<=NF;i++) if($i==\"src\") print $(i+1); for(i=1;i<=NF;i++) if($i==\"dev\") print $(i+1)}'"
        );

        const parts = localData.split('\n').filter(Boolean);

        let localIP = 'Unavailable';
        let iface = 'Unavailable';

        for (const part of parts) {
            if (/^192\.168\./.test(part)) {
                localIP = part;
            } else if (/^(wl|en|eth|wlan)/.test(part)) {
                iface = part;
            }
        }

        this._publicIP = publicIP || 'Unavailable';
        this._localIP = localIP;
        this._interface = iface;

        this._label.set_text(`IP ${this._localIP}`);
        this._updateMenu();
    }

    _updateMenu() {
        this.menu.removeAll();

        const publicItem = new PopupMenu.PopupMenuItem(
            `Public IPv4: ${this._publicIP}`
        );
        publicItem.reactive = false;
        this.menu.addMenuItem(publicItem);

        const localItem = new PopupMenu.PopupMenuItem(
            `Local IPv4: ${this._localIP}`
        );
        localItem.reactive = false;
        this.menu.addMenuItem(localItem);

        const interfaceItem = new PopupMenu.PopupMenuItem(
            `Interface: ${this._interface}`
        );
        interfaceItem.reactive = false;
        this.menu.addMenuItem(interfaceItem);

        this.menu.addMenuItem(
            new PopupMenu.PopupSeparatorMenuItem()
        );

        const refreshItem = new PopupMenu.PopupMenuItem('Refresh');
        refreshItem.connect('activate', () => this._refresh());
        this.menu.addMenuItem(refreshItem);
    }

    destroy() {
        if (this._timer) {
            GLib.source_remove(this._timer);
            this._timer = null;
        }

        super.destroy();
    }
});

export default class CustomIPExtension extends Extension {
    enable() {
        this._indicator = new IPIndicator();

        Main.panel.addToStatusArea(
            "custom-ip",
            this._indicator,
            0,
            "left"
        );
    }

    disable() {
        this._indicator?.destroy();
        this._indicator = null;
    }
}
