import { connect } from 'react-redux'
import OreList from '../oreList.jsx'

const getVisibleOreList = (oreList, filters) => {
  
  return oreList;
}

const mapStateToProps = (state, ownProps) => {
  return {
    oreList: getVisibleOreList(ownProps.oreList, state.oreNameVisibilityFilter)
  }
}

const VisibleTodoList = connect(
  mapStateToProps
)(OreList)

export default VisibleTodoList