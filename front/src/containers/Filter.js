import { connect } from 'react-redux'
import { setOreNameVisibilityFilter } from '../actions'
import { setOreSecurityLevelFilter } from '../actions'
import { triggerToggleMineralFilter } from '../actions'
import OreFilter from '../components/OreFilter.jsx'

const mapStateToProps = state => {
  console.log(state.mineralFilters)
  return {
     nameFilters : state.oreNameVisibilityFilter,
     securityLevelFilter: state.oreSecurityLevelFilter,
     mineralFilters: state.mineralFilters
  }
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    onNameFilterChange: (nameFilters) => {
      dispatch(setOreNameVisibilityFilter(nameFilters))
    },
    onSecurityLevelFilterChange: (securityFilter) => {
      dispatch(setOreSecurityLevelFilter(securityFilter))
    },
    onMineralFilterChange: (filter) => {
      dispatch(triggerToggleMineralFilter(filter))
    }
  }
}

const Filter = connect(
  mapStateToProps,
  mapDispatchToProps
)(OreFilter)

export default Filter