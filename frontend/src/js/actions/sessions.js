/**
 * Desc: Session actions
 * Author: Tatsuro Ide
 * Date: 10/9/2016
 */
import * as Sessions from '../constants/sessions'
import axios from 'axios'

export function createUser() {
	return (dispatch) => {
		axios.post('/users.json', params).then(
			(res) => {
				console.info('User has been created.')
			}
		).catch(
			() => {
				console.warn('Failed to create new user.')
			}
		)
	}
}

export function createSession() {
	return (dispatch) => {
		axios.post('/sessions.json', params).then(
			(res) => {
				console.info('User has been logged in.')
			}
		).catch(
			() => {
				console.warn('Failed to create new session.')
			}
		)
	}
}

function createUserResult() {
	return {
		type: Sessions.CREATE_USER_RESULT,
		user: user,
	}
}

function createSessionResult() {
	return {
		type: Sessions.CREATE_SESSION_RESULT,
		user: user,
	}
}