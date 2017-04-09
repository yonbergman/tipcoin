import React from 'react';
import { connect } from 'react-redux'
import { signedIn, signOut } from '../reducers/user_actions'
import { sign_in } from './user_api'

class Header extends React.Component {

  componentDidMount() {
    sign_in("yon.bergman@wework.com", "foobar").then((token) => {
      this.props.signedIn(token);
    })
  }
  render() {
    let { user } = this.props;
    console.log(user);
    return (
      <header>
        <b>Foo</b>
        <span>{user}</span>
      </header>
    )
  }
}

const mapStateToProps = (state) => {
  return {
    user: state.user
  }
};

const mapDispatchToProps = (dispatch) => {
  return {
    signedIn: (user) => {
      dispatch(signedIn(user))
    },
    sign_out: () => {
      dispatch(signOut())
    }
  }
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Header);
