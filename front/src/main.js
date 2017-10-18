import React from 'react'
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux'
import { createStore } from 'redux'
import refineryApp from './reducers'
import OreApp from './components/OreApp.jsx'


var initialState = {oreNameVisibilityFilter: [],
					oreSecurityLevelFilter:"ALL",
					sortParameter:"SELL_PRICE",
					mineralFilters: []}

let store = createStore(refineryApp, initialState);


ReactDOM.render(
	<Provider store={store}>
		<OreApp mineralList = {minerals} oreList = {primaryOres} reprocessingStats={reprocessingStats} />
	</Provider>
	, document.getElementById('ore-component'));


