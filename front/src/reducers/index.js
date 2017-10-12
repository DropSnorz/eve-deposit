import { combineReducers } from 'redux'
import {oreNameVisibilityFilter} from './oreVisibilityFilter.js'
import {oreSecurityLevelFilter} from './oreVisibilityFilter.js'



/*
	oreNameVisibilityFilter:[],
	oreSecurityLevelFilter:""
	oreList: undefined
*/


const refineryApp = combineReducers({
  oreNameVisibilityFilter,
  oreSecurityLevelFilter

})

export default refineryApp