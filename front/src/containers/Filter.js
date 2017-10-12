import { connect } from 'react-redux'
import { setOreNameVisibilityFilter } from '../actions'
import { setOreSecurityLevelFilter } from '../actions'
import OreFilter from '../components/OreFilter.jsx'

const mapStateToProps = state => {
  return {
     nameFilters : state.oreNameVisibilityFilter,
     securityLevelFilter: state.oreSecurityLevelFilter
  }
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    onNameFilterChange: (nameFilters) => {
      dispatch(setOreNameVisibilityFilter(nameFilters))
    },
    onSecurityLevelFilterChange: (securityFilter) => {
      dispatch(setOreSecurityLevelFilter(securityFilter))
    }
  }
}

const Filter = connect(
  mapStateToProps,
  mapDispatchToProps
)(OreFilter)

export default Filter