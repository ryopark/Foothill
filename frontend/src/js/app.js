import React from 'react'
import { render } from 'react-dom'
import { Router, Route, hashHistory } from 'react-router'
import { Provider } from 'react-redux'

import Auth from './components/auth'
import Common from './components/common'
import TopPage from './components/top-page'

import createFinalStore from './store'

const store = createFinalStore()

/*::::::::::::::::::::::::::::::::::
 Rendering
:::::::::::::::::::::::::::::::::::*/
render(	
	<Provider store={store}>
		<Route component={Common}>
			<Route path='/' component={TopPage} />
			<Route component={Auth}>
				<Route path='/dressr' component={DresserPage} />
			</Route>
		</Route>
	</Provider>,
	document.getElementById('root')
)
