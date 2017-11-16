import { combineReducers } from 'redux'
import {oreNameVisibilityFilter} from './oreVisibilityFilter.js'
import {oreSecurityLevelFilter} from './oreVisibilityFilter.js'
import {oreSortParameter} from './oreVisibilityFilter.js'
import {toggleMineralFilter} from './oreVisibilityFilter.js'
import {oreTypeFilter} from './oreVisibilityFilter.js'



/*
	oreNameVisibilityFilter:[],
	oreSecurityLevelFilter:""
	oreList: undefined
*/


const refineryApp = combineReducers({
  oreNameVisibilityFilter,
  oreSecurityLevelFilter,
  sortParameter: oreSortParameter,
  mineralFilters: toggleMineralFilter,
  oreTypeFilter: oreTypeFilter

})

export default refineryApp