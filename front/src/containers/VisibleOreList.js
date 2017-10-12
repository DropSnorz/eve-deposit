import { connect } from 'react-redux'
import OreList from '../components/OreList.jsx'

const getVisibleOreList = (oreList, state) => {
    
  var nameFilters = state.oreNameVisibilityFilter;
  var securityLevelFilter = state.oreSecurityLevelFilter;

  var filteredOre = oreList;

  if(nameFilters.length > 0 && nameFilters[0] != ""){
    filteredOre  = oreList.filter(function(oreItem){
     return nameFilters.filter(function(oreFilter){
        return oreItem.name == oreFilter;
     }).length != 0
  	});
  }

  if(securityLevelFilter!="ALL"){
    filteredOre = filteredOre.filter(function(oreItem){
      if(securityLevelFilter=="HIGH_SEC"){
        return oreItem.securityLevel > 0.4
      }
      if(securityLevelFilter=="LOW_SEC"){
        return oreItem.securityLevel < 0.5
      }
      else{
        return true;
      }
    })
  }


  return filteredOre;
}

const mapStateToProps = (state, ownProps) => {
  return {
    oreList: getVisibleOreList(ownProps.oreList, state)
  }
}

const VisibleTodoList = connect(
  mapStateToProps
)(OreList)

export default VisibleTodoList