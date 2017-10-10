import { connect } from 'react-redux'
import OreList from '../components/OreList.jsx'

const getVisibleOreList = (oreList, filters) => {
    
  var filteredOre = oreList;

  if(filters.length > 0 && filters[0] != ""){
    filteredOre  = oreList.filter(function(oreItem){
     return filters.filter(function(oreFilter){
        return oreItem.name == oreFilter;
     }).length != 0
  	});
  }


  return filteredOre;
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