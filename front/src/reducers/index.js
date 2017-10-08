import { combineReducers } from 'redux'
import oreNameVisibilityFilter from './oreVisibilityFilter.js'



/*
	oreNameVisibilityFilter:[],
	oreList: undefined
*/


const refineryApp = combineReducers({
  oreNameVisibilityFilter
})

export default refineryApp