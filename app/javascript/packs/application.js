import ReactDOM from 'react-dom';
import React from 'react'

import App from './app';


document.addEventListener("DOMContentLoaded", e => {
  ReactDOM.render(<App />, document.body.appendChild(document.createElement('div')))
});

