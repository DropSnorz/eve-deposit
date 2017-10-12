

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