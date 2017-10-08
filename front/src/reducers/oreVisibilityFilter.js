

const oreNameVisibilityFilter = (state = [], action) => {
  switch (action.type) {
    case 'SET_ORE_NAME_FILTER':
      return action.filters
    default:
      return state
  }
}

export default oreNameVisibilityFilter