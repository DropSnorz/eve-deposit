

export const oreNameVisibilityFilter = (state = [], action) => {
  switch (action.type) {
    case 'SET_ORE_NAME_FILTER':
      return action.nameFilters.split(",")
    default:
      return state
  }
}


export const oreSecurityLevelFilter = (state="ALL", action) => {
	switch(action.type){
		case 'SET_SECURITY_LEVEL_FILTER':
			return action.securityFilter
		default:
			return state
	}
}

export const toggleMineralFilter = (state = [], action) => {
	switch(action.type){
		case 'TOGGLE_MINERAL_FILTER':{
			var array =  state.slice();
			var index = state.indexOf(action.filter)
			if (index > -1){
				array.splice(index, 1)
			}
			else{
				array.push(action.filter)
			}

			return array
		}

		default:
			return state
	}

}