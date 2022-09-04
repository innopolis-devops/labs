import React from 'react';
import ReactDom from 'react-dom';

const date = new Date().toLocaleDateString();
const time = new Date().toLocaleTimeString();

ReactDom.render(
<>
<p>Today's date is {date}</p>
<p>Current time is {time}</p>
</>
, 
document.getElementById('root'));

