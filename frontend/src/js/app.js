import React from 'react'
import { render } from 'react-dom'
import { Router, Route, hashHistory } from 'react-router'
import { Provider } from 'react-redux'

import createFinalStore from './store'

const store = createFinalStore()

/*::::::::::::::::::::::::::::::::::
 Rendering
:::::::::::::::::::::::::::::::::::*/
render(	
	<Provider store={store}>
		<Router history={hashHistory}>
		</Router>
	</Provider>,
	document.getElementById('root')
)
