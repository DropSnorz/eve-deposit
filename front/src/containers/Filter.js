import { connect } from 'react-redux'
import { setOreNameFilter } from '../actions'
import OreFilter from '../components/OreFilter.jsx'

const mapStateToProps = state => {
  return {
     nameFilters : state.oreNameVisibilityFilter
  }
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    onNameFilterChange: () => {
      dispatch(setOreNameVisibilityFilter(ownProps.nameFilters))
    }
  }
}

const Filter = connect(
  mapStateToProps,
  mapDispatchToProps
)(OreFilter)

export default Filter