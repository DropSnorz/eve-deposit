import { connect } from 'react-redux'
import OreComparator from '../components/OreComparator.jsx'
import { filterOreListByType } from '../selectors/oreTypeSelector.jsx'
import { filterMineralListByType } from '../selectors/oreTypeSelector.jsx'
import { setOreTypeFilter } from '../actions'


const mapStateToProps = (state, ownProps) => {
    var customOreList = filterOreListByType(state, ownProps)
    var customMineralList = filterMineralListByType(state, ownProps)
  return {
    oreList: customOreList,
    mineralList: customMineralList,
    oreTypeFilter: state.oreTypeFilter
  }
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    onTypeFilterChange: (typeFilter) => {
      dispatch(setOreTypeFilter(typeFilter))
    }
  }
}

const Comparator = connect(
  mapStateToProps,
  mapDispatchToProps
)(OreComparator)

export default Comparator