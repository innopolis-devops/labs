import React from "react"
import ReactDom from "react-dom"

const date = new Date().toLocaleDateString()
const time = new Date().toLocaleTimeString()

ReactDom.render(
  <div>
    <p>
      Today's date is {date}
    </p>
    <p>
      Current time is {time}
    </p>
  </div>,
  document.getElementById('root')
)
