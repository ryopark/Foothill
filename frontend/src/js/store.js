import { applyMiddleware, compose, createStore } from 'redux'
import Thunk from 'redux-thunk';
import rootReducer from './root-reducer'

export default function createFinalStore () {
	const finalCreateStore = compose(applyMiddleware(Thunk))(createStore)
	return finalCreateStore(rootReducer)
}