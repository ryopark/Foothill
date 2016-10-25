import React, { Component } from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import ReactCookie from 'react-cookie'
import axios from 'axios'

import * as SessionsActions from '../actions/sessions'

class Auth extends Component {
	constructor(props) {
		super(props)
	}
	componentWillMount() {
		this.checkAuth() 
	}
	componentDidMount() {
		this.checkAuth()
	}
	componentWillReceiveProps(nextProps) {
		if (!nextProps.sessions.hasLoggedIn) {
			this.props.topActions.switchTopPageState('login')
			this.context.router.push('/')
		}
	}
	checkAuth() {
		// temp
		return true

		if (!ReactCookie.load('access_token')) {
			this.props.topActions.switchTopPageState('login')
			this.context.router.push('/')
		}else if(!this.props.sessions.hasLoggedIn) {
			this.props.sessionsActions.autoLogin()
		}
	}

	render() {
		return (
			<div>{ this.props.children }</div>
		)
	}
}
function mapStateToProps(state) {
	return {
		sessions: state.sessions,
	}
}
function mapDispatchToProps(dispatch) {
	return {
		sessionsActions: bindActionCreators(SessionsActions, dispatch),
	}
}
export default connect(
	mapStateToProps,
	mapDispatchToProps
)(Auth)

Auth.contextTypes = {
	router: React.PropTypes.object
}