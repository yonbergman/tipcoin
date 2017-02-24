import ReactDOM from 'react-dom';
import App from './app';

document.addEventListener("DOMContentLoaded", e => {
  ReactDOM.render(<App name="React" />, document.body.appendChild(document.createElement('div')))
});

