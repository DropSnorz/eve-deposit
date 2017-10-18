

export const setOreNameVisibilityFilter = nameFilters => {
  return {
    type: 'SET_ORE_NAME_FILTER',
    nameFilters
  }
}

export const setOreSecurityLevelFilter = securityFilter =>{
	return{
		type:'SET_SECURITY_LEVEL_FILTER',
		securityFilter
	}
}

export const setOreSortParameter = parameter =>{
	return {
		type:'SET_SORT_PARAMETER',
		parameter
	}
}

export const triggerToggleMineralFilter = filter =>{
	return{
		type:'TOGGLE_MINERAL_FILTER',
		filter
	}
}

