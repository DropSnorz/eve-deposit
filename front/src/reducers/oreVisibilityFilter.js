

const oreNameVisibilityFilter = (state = [], action) => {
  switch (action.type) {
    case 'SET_ORE_NAME_FILTER':
      return action.nameFilters
    default:
      return state
  }
}

export default oreNameVisibilityFilter