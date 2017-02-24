import React from 'react'

export default class App extends React.Component {
  componentWillMount() {
    fetch('/api/v1/sign_in', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
    })
  }
  render() {
    return <div>Hello {this.props.name}!</div>
  }
}

