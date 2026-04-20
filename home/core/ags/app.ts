import app from "ags/gtk4/app"
import style from "./style.scss"
import Bar from "./widget/Bar"

app.start({
  css: style,
  main() {
    const monitor = app.monitors[0]

    return Bar(monitor)
  },
})
