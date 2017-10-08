import React from 'react'
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux'
import { createStore } from 'redux'
import refineryApp from './reducers'
import OreApp from './oreApp.jsx'


var initialState = {oreNameVisibilityFilter: [],
					oreList: []}

let store = createStore(refineryApp, initialState);


ReactDOM.render(
	<Provider store={store}>
		<OreApp mineralList = {minerals} oreList = {primaryOres} />
	</Provider>
	, document.getElementById('ore-component'));

