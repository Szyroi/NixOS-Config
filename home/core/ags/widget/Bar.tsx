import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { createPoll } from "ags/time"
import GLib from "gi://GLib?version=2.0"
import { createState, createComputed } from "gnim"

const { TOP, LEFT, RIGHT, BOTTOM } = Astal.WindowAnchor

const [vertical, setVertical] = createState(true)

function Clock() {
  const hours = createPoll("", 1000, () =>
    GLib.DateTime.new_now_local().format("%H"),
  )

  const minutes = createPoll("", 1000, () =>
    GLib.DateTime.new_now_local().format("%M"),
  )

  return (
    <box orientation={Gtk.Orientation.VERTICAL}>
      <label label={hours() ?? ""} />
      <label label={minutes() ?? ""} />
    </box>
  )
}

function Counter() {
  const [count, setCount] = createState(0)

  function Increment() {
    setCount((v) => v + 1)
  }
  const label = createComputed(() => count().toString())

  return (
    <box>
      <label label={label} />
      <button onClicked={Increment}> Click me!</button>
    </box>
  )
}

function Switch() {
  const label = vertical((v) => (v ? "Vertical" : "Horizontal"))

  return (
    <box>
      <button onClicked={() => setVertical((v) => !v)}>
        <label label={label} />
      </button>
    </box>
  )
}

export default function Bar(monitor: Gdk.Monitor) {
  return (
    <window
      $={(self) => print("Element Initialized")}
      visible
      name="bar"
      class="Bar"
      gdkmonitor={monitor}
      anchor={vertical((v) => (v ? TOP | BOTTOM | LEFT : TOP | LEFT | RIGHT))}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      application={app}
    >
      <box
        orientation={vertical((v) =>
          v ? Gtk.Orientation.VERTICAL : Gtk.Orientation.HORIZONTAL,
        )}
        spacing={5}
        widthRequest={vertical((v) => (v ? 50 : -1))}
        heightRequest={vertical((v) => (v ? -1 : 30))}
      >
        <Clock />

        <button
          onClicked={() =>
            print(
              `Resolution: ${monitor.geometry.width}x${monitor.geometry.height}`,
            )
          }
        >
          <label label="Info" />
        </button>
        <Switch />
        <Counter />

        <button onClicked={() => print(`Monitore: ${app.monitors}`)}>
          <label label="Monitors" />
        </button>
      </box>
    </window>
  )
}
