/**
 * Desc: Reducer for session actions
 * Author: Tatsuro Ide
 * Date: 10/9/2016
 */

import * as Sessions from '../constants/sessions'

const initialState = {

}

export default function sessions(state = initialState, action) {
	switch(action.type) {
		case Sessions.CREATE_USER_RESULT: {
			return Object.assign({}, state, {
				user: action.user,
			})
		}
		default: {
			return state
		}
	}
}