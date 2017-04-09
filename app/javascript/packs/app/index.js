import React from 'react';
import { Provider } from 'react-redux';
import { createStore } from 'redux';
import reducers from '../reducers';
import App from './app';

let store = createStore(reducers);

export default function() {
  return (
    <Provider store={store}>
      <App />
    </Provider>
  )
}

